package com.jobhuntly.backend.service;

import com.jobhuntly.backend.dto.response.InterviewAnswerResponse;
import com.jobhuntly.backend.dto.response.InterviewStartResponse;
import org.springframework.web.multipart.MultipartFile;

public interface InterviewCoachService {
    InterviewStartResponse start(Long jobId);
    InterviewAnswerResponse answer(Long jobId, String sessionId, String questionText, String language, MultipartFile file);
}
