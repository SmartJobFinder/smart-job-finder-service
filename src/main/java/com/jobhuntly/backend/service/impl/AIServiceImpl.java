package com.jobhuntly.backend.service.impl;

import com.jobhuntly.backend.dto.request.InterviewStartRequest;
import com.jobhuntly.backend.dto.response.InterviewAnswerResponse;
import com.jobhuntly.backend.dto.response.InterviewStartResponse;
import com.jobhuntly.backend.service.AIService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

@Service
public class AIServiceImpl implements AIService {

    private final RestTemplate restTemplate;
    private final String aiServiceUrl;

    public AIServiceImpl(
            RestTemplate restTemplate,
            @Value("${ai.service.url:http://localhost:8000}") String aiServiceUrl
    ) {
        this.restTemplate = restTemplate;
        this.aiServiceUrl = aiServiceUrl;
    }

    @Override
    public String predictScam(String text) {
        String url = aiServiceUrl + "/predict_scam";
        Map<String, String> requestBody = new HashMap<>();
        requestBody.put("text", text);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Map<String, String>> entity = new HttpEntity<>(requestBody, headers);

        try {
            ResponseEntity<String> response = restTemplate.postForEntity(url, entity, String.class);
            return response.getBody();
        } catch (HttpStatusCodeException e) {
            return "Error: " + e.getResponseBodyAsString();
        } catch (Exception e) {
            return "Error: " + e.getMessage();
        }
    }

    @Override
    public String matchCV(String jdText, String cvText) {
        Map<String, String> body = new HashMap<>();
        body.put("jd_text", jdText);
        body.put("cv_text", cvText);
        return callAIEndpoint("/cv_matching", body);
    }

    private String callAIEndpoint(String endpoint, Map<String, ?> body) {
        String url = aiServiceUrl + endpoint;

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Map<String, ?>> entity = new HttpEntity<>(body, headers);

        try {
            ResponseEntity<String> response = restTemplate.postForEntity(url, entity, String.class);
            return response.getBody();
        } catch (HttpStatusCodeException e) {
            return "Error from AI service: " + e.getResponseBodyAsString();
        } catch (Exception e) {
            return "Error connecting to AI service: " + e.getMessage();
        }
    }

    @Override
    public InterviewStartResponse interviewStart(InterviewStartRequest req) {
        String url = aiServiceUrl + "/interview/start";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<InterviewStartRequest> entity = new HttpEntity<>(req, headers);

        try {
            ResponseEntity<InterviewStartResponse> response =
                    restTemplate.postForEntity(url, entity, InterviewStartResponse.class);

            InterviewStartResponse body = response.getBody();
            if (body != null) {
                body.setAudioUrl(toAbsoluteAiUrl(body.getAudioUrl()));
            }
            return body;
        } catch (HttpStatusCodeException e) {
            throw new RuntimeException("AI error: " + e.getResponseBodyAsString());
        } catch (Exception e) {
            throw new RuntimeException("AI connect error: " + e.getMessage());
        }
    }

    @Override
    public InterviewAnswerResponse interviewAnswer(String sessionId, String questionText, String language, MultipartFile file) {
        String url = aiServiceUrl + "/interview/answer";

        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.MULTIPART_FORM_DATA);

            MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();
            form.add("session_id", sessionId);
            form.add("question_text", questionText);
            form.add("language", (language == null || language.isBlank()) ? "en" : language);

            ByteArrayResource fileResource = new ByteArrayResource(file.getBytes()) {
                @Override
                public String getFilename() {
                    return (file.getOriginalFilename() != null) ? file.getOriginalFilename() : "answer.webm";
                }
            };
            form.add("file", fileResource);

            HttpEntity<MultiValueMap<String, Object>> entity = new HttpEntity<>(form, headers);

            ResponseEntity<InterviewAnswerResponse> response =
                    restTemplate.exchange(url, HttpMethod.POST, entity, InterviewAnswerResponse.class);

            InterviewAnswerResponse body = response.getBody();
            if (body != null) {
                body.setNextQuestionAudioUrl(toAbsoluteAiUrl(body.getNextQuestionAudioUrl()));
            }
            return body;

        } catch (HttpStatusCodeException e) {
            throw new RuntimeException("AI error: " + e.getResponseBodyAsString());
        } catch (Exception e) {
            throw new RuntimeException("AI connect error: " + e.getMessage());
        }
    }

    private String toAbsoluteAiUrl(String maybeRelative) {
        if (maybeRelative == null || maybeRelative.isBlank()) return maybeRelative;
        if (maybeRelative.startsWith("http://") || maybeRelative.startsWith("https://")) return maybeRelative;
        if (!maybeRelative.startsWith("/")) maybeRelative = "/" + maybeRelative;
        return aiServiceUrl + maybeRelative;
    }
}
