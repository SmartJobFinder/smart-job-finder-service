package com.jobhuntly.backend.service;

import com.jobhuntly.backend.dto.request.SaveCvRequest;
import com.jobhuntly.backend.dto.response.SaveCvResponse;

import java.util.List;

public interface SaveCvService {

    SaveCvResponse create(Long userId, SaveCvRequest request);

    List<SaveCvResponse> getByUserId(Long userId);

    SaveCvResponse getById(Long userId, Long id);

    SaveCvResponse update(Long userId, Long id, SaveCvRequest request);

    boolean delete(Long userId, Long id);
}


