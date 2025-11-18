package com.jobhuntly.backend.service.impl;

import com.jobhuntly.backend.entity.CandidateProfile;
import com.jobhuntly.backend.service.ProfileDomainService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CVBuilderService {

    private final ProfileDomainService profileDomainService;


    public String buildAboutMe(CandidateProfile profile) {
        if (profile == null) return "";

        StringBuilder aboutMe = new StringBuilder();

        if (profile.getFullName() != null && !profile.getFullName().isBlank()) {
            aboutMe.append(profile.getFullName());
            if (profile.getTitle() != null && !profile.getTitle().isBlank()) {
                aboutMe.append(" - ").append(profile.getTitle());
            }
        }

        if (profile.getEducation() != null && !profile.getEducation().isBlank()) {
            aboutMe.append(", ").append(profile.getEducation());
        }

        if (profile.getPersonalLink() != null && !profile.getPersonalLink().isBlank()) {
            aboutMe.append(" | ").append(profile.getPersonalLink());
        }

        if (profile.getGender() != null || profile.getDateOfBirth() != null) {
            aboutMe.append(" | ");
            if (profile.getGender() != null) aboutMe.append(profile.getGender());
            if (profile.getDateOfBirth() != null) {
                aboutMe.append(" | Born in ").append(profile.getDateOfBirth().getYear());
            }
        }

        return aboutMe.toString().trim();
    }

    /**
     * Lấy profile theo userId và tạo aboutMe tổng quát
     */
    public String generateAboutMeForUser(Long userId) {
        CandidateProfile profile = profileDomainService.getOrCreateProfile(userId);
        return buildAboutMe(profile);
    }
}
