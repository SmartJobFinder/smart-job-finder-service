package com.jobhuntly.backend.dto.request.ai;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class SuitableSkillsRequest {
    private String jobDescription;
    private String jobRequirements;
    private List<String> candidateSkills = new ArrayList<>();
}