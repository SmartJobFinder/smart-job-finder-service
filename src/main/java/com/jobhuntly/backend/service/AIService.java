package com.jobhuntly.backend.service;

public interface AIService {
    String predictScam(String text);

    String matchCV(String jdText, String cvText);


}
