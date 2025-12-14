package com.jobhuntly.backend.service;

import com.jobhuntly.backend.dto.request.GenerateCvRequest;
import com.jobhuntly.backend.dto.response.GenerateCvResponse;

public interface CVGenerateService {

    GenerateCvResponse generateCv(String email, GenerateCvRequest req);

}
