package com.jobhuntly.backend.service.impl;

import com.jobhuntly.backend.dto.request.GenerateCvRequest;
import com.jobhuntly.backend.dto.response.GenerateCvResponse;
import com.jobhuntly.backend.entity.CandidateProfile;
import com.jobhuntly.backend.entity.Edu;
import com.jobhuntly.backend.entity.Job;
import com.jobhuntly.backend.entity.User;
import com.jobhuntly.backend.repository.CandidateProfileRepository;
import com.jobhuntly.backend.repository.JobRepository;
import com.jobhuntly.backend.repository.UserRepository;
import com.jobhuntly.backend.service.AIService;
import com.jobhuntly.backend.service.CVGenerateService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CVGenerateServiceImpl implements CVGenerateService {

    private final CandidateProfileRepository candidateProfileRepository;
    private final JobRepository jobRepository;
    private final AIService aiService;
    private final UserRepository userRepository;

    private final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");

    @Transactional(readOnly = true)
    public GenerateCvResponse generateCv(String email, GenerateCvRequest req) {

        if (req == null) throw new RuntimeException("Request is null");
        if (email == null || email.isBlank()) throw new RuntimeException("Unauthenticated");
        if (req.getJobId() == null) throw new RuntimeException("jobId is required");

        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found for email=" + email));

        CandidateProfile profile = candidateProfileRepository.findByUser_Id(user.getId())
                .orElseThrow(() -> new RuntimeException("CandidateProfile not found for userId=" + user.getId()));

        Job job = jobRepository.findById(req.getJobId())
                .orElseThrow(() -> new RuntimeException("Job not found jobId=" + req.getJobId()));

        String lang = (req.getLanguage() == null || req.getLanguage().isBlank()) ? "en" : req.getLanguage().trim();

        String intro = aiService.generateIntro(CvAiPayloadBuilder.buildIntroReq(profile, job));
        String objective = aiService.generateObjective(CvAiPayloadBuilder.buildObjectiveReq(profile, job, lang));
        List<String> suitableSkills = aiService.generateSuitableSkills(CvAiPayloadBuilder.buildSkillsReq(profile, job, lang));

        User u = profile.getUser();
        String fullName = (u != null) ? u.getFullName() : null;
        String phone = (u != null) ? u.getPhone() : null;

        List<GenerateCvResponse.EducationItem> educations = safeStream(profile.getEducations())
                .map(e -> GenerateCvResponse.EducationItem.builder()
                        .school(trimOrNull(e.getSchoolName()))
                        .majors(trimOrNull(e.getMajors()))
                        .start(null)
                        .end(null)
                        .description(buildEduDescription(e))
                        .build())
                .collect(Collectors.toList());

        List<GenerateCvResponse.WorkItem> works = safeStream(profile.getWorkExperiences())
                .map(w -> GenerateCvResponse.WorkItem.builder()
                        .company(trimOrNull(getString(w, "getCompanyName", "getCompany")))
                        .role(trimOrNull(getString(w, "getPosition", "getRole", "getTitle")))
                        .start(format(getDate(w, "getStartDate", "getFromDate", "getStart")))
                        .end(format(getDate(w, "getEndDate", "getToDate", "getEnd")))
                        .description(trimOrNull(getString(w, "getDescription", "getSummary")))
                        .build())
                .collect(Collectors.toList());

        List<GenerateCvResponse.CertificateItem> certs = safeStream(profile.getCertificates())
                .map(c -> GenerateCvResponse.CertificateItem.builder()
                        .name(trimOrNull(getString(c, "getName", "getTitle")))
                        .issuer(trimOrNull(getString(c, "getIssuer", "getOrganization")))
                        .date(format(getDate(c, "getIssueDate", "getDate")))
                        .url(trimOrNull(getString(c, "getUrl", "getLink")))
                        .build())
                .collect(Collectors.toList());

        List<GenerateCvResponse.AwardItem> awards = safeStream(profile.getAwards())
                .map(a -> GenerateCvResponse.AwardItem.builder()
                        .name(trimOrNull(getString(a, "getName", "getTitle")))
                        .issuer(trimOrNull(getString(a, "getIssuer", "getOrganization")))
                        .date(format(getDate(a, "getDate", "getAwardDate")))
                        .description(trimOrNull(getString(a, "getDescription", "getSummary")))
                        .build())
                .collect(Collectors.toList());

        return GenerateCvResponse.builder()
                .fullName(trimOrNull(fullName))
                .title(trimOrNull(profile.getTitle()))
                .email(trimOrNull(email))
                .phone(trimOrNull(phone))
                .personalLink(trimOrNull(profile.getPersonalLink()))
                .avatar(trimOrNull(profile.getAvatar()))

                .intro(intro)
                .objective(objective)
                .suitableSkills(
                        suitableSkills != null
                                ? new ArrayList<>(suitableSkills)
                                : new ArrayList<>()
                )

                .aboutMe(trimOrNull(profile.getAboutMe()))
                .educations(educations)
                .workExperiences(works)
                .certificates(certs)
                .awards(awards)
                .build();

    }

    // ================= Helpers =================

    private String format(java.util.Date d) {
        if (d == null) return null;
        return df.format(d);
    }

    private static String trimOrNull(String s) {
        if (s == null) return null;
        String t = s.trim();
        return t.isBlank() ? null : t;
    }

    private static String buildEduDescription(Edu e) {
        if (e == null) return null;

        List<String> parts = new ArrayList<>();
        if (trimOrNull(e.getDegree()) != null) parts.add(trimOrNull(e.getDegree()));
        if (trimOrNull(e.getMajors()) != null) parts.add(trimOrNull(e.getMajors()));
        if (trimOrNull(e.getDuration()) != null) parts.add(trimOrNull(e.getDuration()));

        String joined = String.join(" • ", parts);
        return joined.isBlank() ? null : joined;
    }

    private static <T> java.util.stream.Stream<T> safeStream(Collection<T> c) {
        return (c == null) ? java.util.stream.Stream.empty() : c.stream().filter(Objects::nonNull);
    }

    private static String getString(Object obj, String... getterNames) {
        Object v = invokeAny(obj, getterNames);
        return (v instanceof String) ? (String) v : null;
    }

    private static java.util.Date getDate(Object obj, String... getterNames) {
        Object v = invokeAny(obj, getterNames);
        return (v instanceof java.util.Date) ? (java.util.Date) v : null;
    }

    private static Object invokeAny(Object obj, String... getterNames) {
        if (obj == null || getterNames == null) return null;
        for (String name : getterNames) {
            try {
                Method m = obj.getClass().getMethod(name);
                return m.invoke(obj);
            } catch (Exception ignore) {
                // try next getter name
            }
        }
        return null;
    }
}
