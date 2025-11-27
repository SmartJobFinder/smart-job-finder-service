package com.jobhuntly.backend.dto.request;

import jakarta.validation.constraints.NotNull;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class FollowRequest {
    @NotNull(message = "companyId is required")
    private Long companyId;
}
