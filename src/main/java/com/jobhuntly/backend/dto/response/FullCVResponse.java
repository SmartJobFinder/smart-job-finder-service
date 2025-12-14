package com.jobhuntly.backend.dto.response;

import lombok.Data;

import java.util.List;

@Data
public class FullCVResponse {
    private String introduce;
    private String objective;
    private List<EduItem> edu;
    private Information information;
    private List<ExperienceItem> experience;
    private List<String> skills;

    @Data public static class EduItem {
        private Long id;
        private String schoolName;
        private String degree;
        private String duration;
        private String majors;
    }

    @Data public static class ExperienceItem {
        private Long id;
        private String description;
        private String companyName;
        private String position;
        private String duration;
    }

    @Data public static class Information {
        private String fullName;
        private String title;
        private String gender;
        private String location;
        private Integer age;
        private String phone;
        private String email;
    }
}
