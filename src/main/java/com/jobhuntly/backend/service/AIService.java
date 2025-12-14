package com.jobhuntly.backend.service;

import com.jobhuntly.backend.dto.request.InterviewStartRequest;
import com.jobhuntly.backend.dto.request.ai.IntroRequest;
import com.jobhuntly.backend.dto.request.ai.ObjectiveRequest;
import com.jobhuntly.backend.dto.request.ai.SuitableSkillsRequest;
import com.jobhuntly.backend.dto.response.InterviewAnswerResponse;
import com.jobhuntly.backend.dto.response.InterviewStartResponse;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface AIService {
    String predictScam(String text);

    String matchCV(String jdText, String cvText);

    InterviewStartResponse interviewStart(InterviewStartRequest req);

    InterviewAnswerResponse interviewAnswer(String sessionId, String questionText, String language, MultipartFile file);

    String generateIntro(IntroRequest req);

    String generateObjective(ObjectiveRequest req);

    List<String> generateSuitableSkills(SuitableSkillsRequest req);

}
