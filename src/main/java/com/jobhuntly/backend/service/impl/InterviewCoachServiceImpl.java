package com.jobhuntly.backend.service.impl;

import com.jobhuntly.backend.dto.request.InterviewStartRequest;
import com.jobhuntly.backend.dto.response.InterviewAnswerResponse;
import com.jobhuntly.backend.dto.response.InterviewStartResponse;
import com.jobhuntly.backend.dto.response.JobResponse;
import com.jobhuntly.backend.service.AIService;
import com.jobhuntly.backend.service.InterviewCoachService;
import com.jobhuntly.backend.service.JobService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@RequiredArgsConstructor
public class InterviewCoachServiceImpl implements InterviewCoachService {

    private final JobService jobService;
    private final AIService aiService;

    @Override
    public InterviewStartResponse start(Long jobId) {
        JobResponse job = jobService.getById(jobId);

        String jobTitle = safe(job.getTitle());
        String jdForAI = buildJdForAI(job);

        InterviewStartRequest req = new InterviewStartRequest(jobTitle, jdForAI);
        return aiService.interviewStart(req);
    }

    @Override
    public InterviewAnswerResponse answer(Long jobId, String sessionId, String questionText, String language, MultipartFile file) {
        jobService.getById(jobId);

        return aiService.interviewAnswer(sessionId, questionText, language, file);
    }

    private String buildJdForAI(JobResponse job) {
        StringBuilder sb = new StringBuilder();

        sb.append("Location: ").append(safe(job.getLocation())).append("\n\n");
        sb.append("Job Description:\n").append(safe(job.getDescription())).append("\n\n");
        sb.append("Requirements:\n").append(safe(job.getRequirements())).append("\n\n");
        sb.append("Benefits:\n").append(safe(job.getBenefits())).append("\n");

        return sb.toString().trim();
    }

    private String safe(String s) {
        return s == null ? "" : s;
    }
}
