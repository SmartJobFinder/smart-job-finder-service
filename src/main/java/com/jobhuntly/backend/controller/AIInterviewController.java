package com.jobhuntly.backend.controller;

import com.jobhuntly.backend.dto.response.InterviewAnswerResponse;
import com.jobhuntly.backend.dto.response.InterviewStartResponse;
import com.jobhuntly.backend.service.InterviewCoachService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("${backend.prefix}/ai-interview")
@RequiredArgsConstructor
public class AIInterviewController {

    private final InterviewCoachService interviewCoachService;

    @PostMapping("/start")
    public InterviewStartResponse start(@RequestParam Long jobId) {
        return interviewCoachService.start(jobId);
    }

    @PostMapping(value = "/answer", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public InterviewAnswerResponse answer(
            @RequestParam Long jobId,
            @RequestParam("session_id") String sessionId,
            @RequestParam("question_text") String questionText,
            @RequestParam(value = "language", defaultValue = "en") String language,
            @RequestPart("file") MultipartFile file
    ) {
        return interviewCoachService.answer(jobId, sessionId, questionText, language, file);
    }
}
