package com.jobhuntly.backend.service.impl;

import com.jobhuntly.backend.dto.request.ai.IntroRequest;
import com.jobhuntly.backend.dto.request.ai.ObjectiveRequest;
import com.jobhuntly.backend.dto.request.ai.SuitableSkillsRequest;
import com.jobhuntly.backend.entity.CandidateProfile;
import com.jobhuntly.backend.entity.Edu;
import com.jobhuntly.backend.entity.Job;
import com.jobhuntly.backend.entity.User;

import java.time.Instant;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class CvAiPayloadBuilder {

    private CvAiPayloadBuilder() {
    }

    // ================= INTRO =================
    public static IntroRequest buildIntroReq(CandidateProfile p, Job j) {
        IntroRequest req = new IntroRequest();

        if (j != null) {
            req.setJobTitle(j.getTitle());
            req.setJobDescription(j.getDescription());
            req.setJobRequirements(j.getRequirements());
            req.setJobLocation(j.getLocation());
        }

        req.setBasicInfoText(buildBasicInfoText(p));

        return req;
    }

    // ================= OBJECTIVE =================
    public static ObjectiveRequest buildObjectiveReq(CandidateProfile p, Job j, String language) {
        ObjectiveRequest req = new ObjectiveRequest();

        if (j != null) {
            req.setJobTitle(trimOrNull(j.getTitle()));
            req.setJobDescription(trimOrNull(j.getDescription()));
            req.setJobRequirements(trimOrNull(j.getRequirements()));
            req.setJobLocation(trimOrNull(j.getLocation()));
        }

        if (p != null) {
            User u = p.getUser();

            req.setFullName(u != null ? trimOrNull(u.getFullName()) : null);

            req.setTitle(trimOrNull(p.getTitle()));

            req.setGender(p.getGender() != null ? p.getGender().name() : null);

            String loc = null;
            if (u != null && u.getCity() != null) {
                loc = trimOrNull(u.getCity().getName());
            }
            if (loc == null) loc = req.getJobLocation();
            req.setLocation(loc);

            // age
            req.setAge(calcAge(p.getDateOfBirth()));
        }

        return req;
    }

    // ================= SKILLS =================
    public static SuitableSkillsRequest buildSkillsReq(CandidateProfile p, Job j, String language) {
        SuitableSkillsRequest req = new SuitableSkillsRequest();

        if (j != null) {
            req.setJobDescription(j.getDescription());
            req.setJobRequirements(j.getRequirements());
        }

        List<String> skills = new ArrayList<>();
        if (p != null && p.getCandidateSkills() != null && !p.getCandidateSkills().isEmpty()) {
            skills = p.getCandidateSkills().stream()
                    .filter(cs -> cs != null && cs.getSkill() != null && cs.getSkill().getName() != null)
                    .map(cs -> cs.getSkill().getName().trim())
                    .filter(s -> !s.isBlank())
                    .distinct()
                    .limit(30)
                    .collect(Collectors.toCollection(ArrayList::new));
        }

        req.setCandidateSkills(skills);
        return req;
    }


    // ================= HELPER =================
    public static String buildBasicInfoText(CandidateProfile profile) {
        if (profile == null) return "";

        StringBuilder sb = new StringBuilder();

        String fullName = (profile.getUser() != null) ? profile.getUser().getFullName() : null;
        if (fullName != null && !fullName.isBlank()) {
            sb.append(fullName.trim());
        }

        String title = profile.getTitle();
        if (title != null && !title.isBlank()) {
            if (sb.length() > 0) sb.append(" - ");
            sb.append(title.trim());
        }

        String major = safeFirstMajor(profile);
        if (major != null && !major.isBlank()) {
            if (sb.length() > 0) sb.append(", ");
            sb.append(major.trim());
        }

        String link = profile.getPersonalLink();
        if (link != null && !link.isBlank()) {
            if (sb.length() > 0) sb.append(" | ");
            sb.append(link.trim());
        }

        if (profile.getGender() != null || profile.getDateOfBirth() != null) {
            if (sb.length() > 0) sb.append(" | ");

            if (profile.getGender() != null) {
                sb.append(profile.getGender().name());
            }

            if (profile.getDateOfBirth() != null) {
                if (profile.getGender() != null) sb.append(" | ");
                sb.append("Born in ").append(profile.getDateOfBirth().getYear());
            }
        }

        return sb.toString().trim();
    }

    private static String safeFirstMajor(CandidateProfile profile) {
        if (profile == null || profile.getEducations() == null) return null;
        return profile.getEducations().stream()
                .filter(e -> e != null && e.getMajors() != null && !e.getMajors().isBlank())
                .map(Edu::getMajors)
                .findFirst()
                .orElse(null);
    }

    private static String trimOrNull(String s) {
        if (s == null) return null;
        String t = s.trim();
        return t.isBlank() ? null : t;
    }

    private static Integer calcAge(Date dob) {
        if (dob == null) return null;

        if (dob instanceof java.sql.Date sqlDate) {
            LocalDate birth = sqlDate.toLocalDate();
            return Period.between(birth, LocalDate.now()).getYears();
        }

        Instant ins = dob.toInstant();
        LocalDate birth = ins.atZone(ZoneId.systemDefault()).toLocalDate();
        return Period.between(birth, LocalDate.now()).getYears();
    }

}
