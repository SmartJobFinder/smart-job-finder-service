package com.jobhuntly.backend.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;

public class InterviewAnswerResponse {
    @JsonProperty("answer_text")
    private String answerText;

    private Object evaluation;

    @JsonProperty("next_question_text")
    private String nextQuestionText;

    @JsonProperty("next_question_audio_url")
    private String nextQuestionAudioUrl;

    @JsonProperty("emotion_summary")
    private String emotionSummary;

    @JsonProperty("fluency_summary")
    private String fluencySummary;

    @JsonProperty("dominant_emotion")
    private String dominantEmotion;

    @JsonProperty("stress_score")
    private Double stressScore;

    private Double wpm;

    @JsonProperty("fluency_level")
    private String fluencyLevel;

    public String getAnswerText() { return answerText; }
    public void setAnswerText(String answerText) { this.answerText = answerText; }

    public Object getEvaluation() { return evaluation; }
    public void setEvaluation(Object evaluation) { this.evaluation = evaluation; }

    public String getNextQuestionText() { return nextQuestionText; }
    public void setNextQuestionText(String nextQuestionText) { this.nextQuestionText = nextQuestionText; }

    public String getNextQuestionAudioUrl() { return nextQuestionAudioUrl; }
    public void setNextQuestionAudioUrl(String nextQuestionAudioUrl) { this.nextQuestionAudioUrl = nextQuestionAudioUrl; }

    public String getEmotionSummary() { return emotionSummary; }
    public void setEmotionSummary(String emotionSummary) { this.emotionSummary = emotionSummary; }

    public String getFluencySummary() { return fluencySummary; }
    public void setFluencySummary(String fluencySummary) { this.fluencySummary = fluencySummary; }

    public String getDominantEmotion() { return dominantEmotion; }
    public void setDominantEmotion(String dominantEmotion) { this.dominantEmotion = dominantEmotion; }

    public Double getStressScore() { return stressScore; }
    public void setStressScore(Double stressScore) { this.stressScore = stressScore; }

    public Double getWpm() { return wpm; }
    public void setWpm(Double wpm) { this.wpm = wpm; }

    public String getFluencyLevel() { return fluencyLevel; }
    public void setFluencyLevel(String fluencyLevel) { this.fluencyLevel = fluencyLevel; }
}
