package com.jobhuntly.backend.dto.request.ai;

import lombok.Data;

@Data
public class ObjectiveRequest {
    private String jobTitle;
    private String jobDescription;
    private String jobRequirements;
    private String jobLocation;

    private String fullName;
    private String title;
    private String gender;
    private String location;
    private Integer age;
}