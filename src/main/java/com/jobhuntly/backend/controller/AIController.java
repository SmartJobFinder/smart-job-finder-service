package com.jobhuntly.backend.controller;

import com.jobhuntly.backend.dto.request.ai.IntroRequest;
import com.jobhuntly.backend.dto.request.ai.ObjectiveRequest;
import com.jobhuntly.backend.dto.request.ai.SuitableSkillsRequest;
import com.jobhuntly.backend.service.AIService;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;
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

    @PostMapping(
            value = "/intro",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.TEXT_PLAIN_VALUE
    )
    public String generateIntro(@RequestBody IntroRequest req) {
        return aiService.generateIntro(req);
    }

    @PostMapping(
            value = "/objective",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.TEXT_PLAIN_VALUE
    )
    public String generateObjective(@RequestBody ObjectiveRequest req) {
        return aiService.generateObjective(req);
    }

    @PostMapping(
            value = "/skills/suitable",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public List<String> generateSuitableSkills(@RequestBody SuitableSkillsRequest req) {
        return aiService.generateSuitableSkills(req);
    }
}
