package com.jobhuntly.backend.dto.request.ai;

import lombok.Data;

@Data
public class IntroRequest {
    private String basicInfoText;
    private String jobTitle;
    private String jobDescription;
    private String jobRequirements;
    private String jobLocation;
}