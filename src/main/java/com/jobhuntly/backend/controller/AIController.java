package com.jobhuntly.backend.controller;

import com.jobhuntly.backend.service.AIService;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("${backend.prefix}/ai")
public class AIController {

    private final AIService aiService;

    public AIController(AIService aiService) {
        this.aiService = aiService;
    }

    @PostMapping("/predict-scam")
    public String predictScam(@RequestBody Map<String, String> body) {
        return aiService.predictScam(body.get("text"));
    }

    @PostMapping("/cv-matching")
    public String matchCV(@RequestBody Map<String, String> body) {
        return aiService.matchCV(body.get("jd_text"), body.get("cv_text"));
    }
}
