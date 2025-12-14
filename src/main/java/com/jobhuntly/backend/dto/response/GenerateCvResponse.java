package com.jobhuntly.backend.dto.response;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class GenerateCvResponse {

    // ===== Header =====
    private String fullName;
    private String title;
    private String email;
    private String phone;
    private String personalLink;
    private String avatar;

    // ===== AI sections =====
    private String intro;
    private String objective;
    private List<String> suitableSkills;

    // ===== From profile =====
    private String aboutMe;
    private List<EducationItem> educations;
    private List<WorkItem> workExperiences;
    private List<CertificateItem> certificates;

    private List<AwardItem> awards;

    @Data @Builder
    public static class EducationItem {
        private String school;
        private String majors;
        private String start;
        private String end;
        private String description;
    }

    @Data @Builder
    public static class WorkItem {
        private String company;
        private String role;
        private String start;
        private String end;
        private String description;
    }

    @Data @Builder
    public static class CertificateItem {
        private String name;
        private String issuer;
        private String date;
        private String url;
    }

    @Data @Builder
    public static class AwardItem {
        private String name;
        private String issuer;
        private String date;
        private String description;
    }
}
