package com.jobhuntly.backend.dto.request;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SaveCvRequest {

    @NotBlank
    private String title;

    private String content;

    private String template;

    private Boolean isDefault;
}


