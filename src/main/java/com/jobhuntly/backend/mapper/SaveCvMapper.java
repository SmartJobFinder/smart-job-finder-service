package com.jobhuntly.backend.mapper;

import com.jobhuntly.backend.dto.request.SaveCvRequest;
import com.jobhuntly.backend.dto.response.SaveCvResponse;
import com.jobhuntly.backend.entity.SaveCv;

public class SaveCvMapper {

    public static SaveCv toEntity(Long userId, SaveCvRequest request) {
        SaveCv entity = new SaveCv();
        entity.setUserId(userId);
        entity.setTitle(request.getTitle());
        entity.setContent(request.getContent());
        entity.setTemplate(request.getTemplate());
        entity.setIsDefault(request.getIsDefault() != null && request.getIsDefault());
        return entity;
    }

    public static SaveCvResponse toResponse(SaveCv entity) {
        return SaveCvResponse.builder()
                .id(entity.getId())
                .title(entity.getTitle())
                .isDefault(Boolean.TRUE.equals(entity.getIsDefault()))
                .content(entity.getContent())
                .template(entity.getTemplate())
                .updatedAt(entity.getUpdatedAt())
                .build();
    }
}


