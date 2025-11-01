package com.jobhuntly.backend.dto.response;

import lombok.*;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MonthlyApplicationStatisticsResponse {
    private Integer year;
    private Integer month;
    private Long totalApplications;
    private List<ApplicationStatisticsResponse> dailyStatistics;
}