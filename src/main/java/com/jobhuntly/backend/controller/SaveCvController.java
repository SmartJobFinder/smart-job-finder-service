package com.jobhuntly.backend.controller;

import com.jobhuntly.backend.dto.request.SaveCvRequest;
import com.jobhuntly.backend.dto.response.SaveCvResponse;
import com.jobhuntly.backend.security.SecurityUtils;
import com.jobhuntly.backend.service.SaveCvService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("${backend.prefix}/save-cv")
public class SaveCvController {

    private final SaveCvService saveCvService;

    @PostMapping
    public ResponseEntity<SaveCvResponse> create(@Valid @RequestBody SaveCvRequest request) {
        Long userId = SecurityUtils.getCurrentUserId();
        log.info("Save CV for userId={}", userId);
        SaveCvResponse response = saveCvService.create(userId, request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @GetMapping("/by-user")
    public ResponseEntity<List<SaveCvResponse>> getByUser() {
        Long userId = SecurityUtils.getCurrentUserId();
        List<SaveCvResponse> list = saveCvService.getByUserId(userId);
        return ResponseEntity.ok(list);
    }

    @GetMapping("/{id}")
    public ResponseEntity<SaveCvResponse> getById(@PathVariable Long id) {
        Long userId = SecurityUtils.getCurrentUserId();
        SaveCvResponse resp = saveCvService.getById(userId, id);
        return ResponseEntity.ok(resp);
    }

    @PutMapping("/{id}")
    public ResponseEntity<SaveCvResponse> update(
            @PathVariable Long id,
            @Valid @RequestBody SaveCvRequest request
    ) {
        Long userId = SecurityUtils.getCurrentUserId();
        SaveCvResponse resp = saveCvService.update(userId, id, request);
        return ResponseEntity.ok(resp);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        Long userId = SecurityUtils.getCurrentUserId();
        boolean deleted = saveCvService.delete(userId, id);
        return deleted ? ResponseEntity.noContent().build()
                : ResponseEntity.notFound().build();
    }
}


