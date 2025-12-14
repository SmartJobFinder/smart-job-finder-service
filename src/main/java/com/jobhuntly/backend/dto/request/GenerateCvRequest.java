package com.jobhuntly.backend.dto.request;

import lombok.Data;

@Data
public class GenerateCvRequest {
    private Long jobId;
    private String language;
}
