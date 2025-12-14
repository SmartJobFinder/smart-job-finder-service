package com.jobhuntly.backend.controller;

import com.jobhuntly.backend.dto.auth.AppPrincipal;
import com.jobhuntly.backend.dto.request.GenerateCvRequest;
import com.jobhuntly.backend.dto.response.GenerateCvResponse;
import com.jobhuntly.backend.service.CVGenerateService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("${backend.prefix}/cv-builder")
@RequiredArgsConstructor
public class CVGenerateController {

    private final CVGenerateService cvGenerateService;

    @PostMapping
    public ResponseEntity<GenerateCvResponse> generate(
            @RequestBody GenerateCvRequest req,
            @AuthenticationPrincipal AppPrincipal principal
    ) {
        return ResponseEntity.ok(cvGenerateService.generateCv(principal.email(), req));
    }


    @GetMapping
    public ResponseEntity<GenerateCvResponse> generateGet(
            @RequestParam Long jobId,
            @RequestParam(required = false, defaultValue = "en") String language,
            @AuthenticationPrincipal AppPrincipal principal
    ) {
        GenerateCvRequest req = new GenerateCvRequest();
        req.setJobId(jobId);
        req.setLanguage(language);
        return ResponseEntity.ok(cvGenerateService.generateCv(principal.email(), req));
    }

}
