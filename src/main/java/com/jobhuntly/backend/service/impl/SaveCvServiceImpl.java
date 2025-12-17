package com.jobhuntly.backend.service.impl;

import com.jobhuntly.backend.dto.request.SaveCvRequest;
import com.jobhuntly.backend.dto.response.SaveCvResponse;
import com.jobhuntly.backend.entity.SaveCv;
import com.jobhuntly.backend.mapper.SaveCvMapper;
import com.jobhuntly.backend.repository.SaveCvRepository;
import com.jobhuntly.backend.service.SaveCvService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.http.HttpStatus;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SaveCvServiceImpl implements SaveCvService {

    private final SaveCvRepository saveCvRepository;

    @Override
    public SaveCvResponse create(Long userId, SaveCvRequest request) {
        SaveCv entity = SaveCvMapper.toEntity(userId, request);
        SaveCv saved = saveCvRepository.save(entity);
        return SaveCvMapper.toResponse(saved);
    }

    @Override
    public List<SaveCvResponse> getByUserId(Long userId) {
        return saveCvRepository.findByUserIdOrderByUpdatedAtDesc(userId)
                .stream()
                .map(SaveCvMapper::toResponse)
                .collect(Collectors.toList());
    }

    @Override
    public SaveCvResponse getById(Long userId, Long id) {
        SaveCv entity = saveCvRepository
                .findByIdAndUserId(id, userId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "CV not found"));
        return SaveCvMapper.toResponse(entity);
    }

    @Override
    public SaveCvResponse update(Long userId, Long id, SaveCvRequest request) {
        SaveCv entity = saveCvRepository
                .findByIdAndUserId(id, userId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "CV not found"));

        entity.setTitle(request.getTitle());
        entity.setContent(request.getContent());
        entity.setTemplate(request.getTemplate());
        if (request.getIsDefault() != null) {
            entity.setIsDefault(request.getIsDefault());
        }

        SaveCv saved = saveCvRepository.save(entity);
        return SaveCvMapper.toResponse(saved);
    }

    @Override
    public boolean delete(Long userId, Long id) {
        SaveCv entity = saveCvRepository
                .findByIdAndUserId(id, userId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "CV not found"));
        saveCvRepository.delete(entity);
        return true;
    }
}


