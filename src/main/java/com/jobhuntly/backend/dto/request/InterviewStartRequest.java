package com.jobhuntly.backend.dto.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class InterviewStartRequest {
    @JsonProperty("job_title")
    private String jobTitle;

    @JsonProperty("job_description")
    private String jobDescription;

    public InterviewStartRequest() {}

    public InterviewStartRequest(String jobTitle, String jobDescription) {
        this.jobTitle = jobTitle;
        this.jobDescription = jobDescription;
    }

    public String getJobTitle() { return jobTitle; }
    public void setJobTitle(String jobTitle) { this.jobTitle = jobTitle; }

    public String getJobDescription() { return jobDescription; }
    public void setJobDescription(String jobDescription) { this.jobDescription = jobDescription; }
}
