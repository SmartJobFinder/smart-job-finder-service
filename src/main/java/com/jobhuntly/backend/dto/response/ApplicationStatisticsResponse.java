package com.jobhuntly.backend.dto.response;

import lombok.*;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApplicationStatisticsResponse {
    private LocalDate date;
    private Long count;
}