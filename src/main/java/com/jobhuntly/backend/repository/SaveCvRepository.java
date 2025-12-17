package com.jobhuntly.backend.repository;

import com.jobhuntly.backend.entity.SaveCv;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface SaveCvRepository extends JpaRepository<SaveCv, Long> {
    List<SaveCv> findByUserIdOrderByUpdatedAtDesc(Long userId);
    Optional<SaveCv> findByIdAndUserId(Long id, Long userId);
}


