package com.jobhuntly.backend.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SaveCvResponse {

    private Long id;
    private String title;
    private Boolean isDefault;
    private String content;
    private String template;
    private LocalDateTime updatedAt;
}


