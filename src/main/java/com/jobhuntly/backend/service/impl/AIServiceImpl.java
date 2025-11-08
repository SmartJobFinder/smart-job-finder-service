package com.jobhuntly.backend.service.impl;

import com.jobhuntly.backend.service.AIService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.client.HttpStatusCodeException;

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
}
