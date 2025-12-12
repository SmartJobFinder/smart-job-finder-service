package com.jobhuntly.backend.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;

public class InterviewStartResponse {
    @JsonProperty("session_id")
    private String sessionId;

    @JsonProperty("question_text")
    private String questionText;

    @JsonProperty("audio_url")
    private String audioUrl;

    public String getSessionId() { return sessionId; }
    public void setSessionId(String sessionId) { this.sessionId = sessionId; }

    public String getQuestionText() { return questionText; }
    public void setQuestionText(String questionText) { this.questionText = questionText; }

    public String getAudioUrl() { return audioUrl; }
    public void setAudioUrl(String audioUrl) { this.audioUrl = audioUrl; }
}
