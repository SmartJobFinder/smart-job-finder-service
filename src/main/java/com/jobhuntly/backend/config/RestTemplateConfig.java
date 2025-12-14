package com.jobhuntly.backend.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpRequest;
import org.springframework.http.client.*;
import org.springframework.util.StreamUtils;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Collections;

@Slf4j
@Configuration
public class RestTemplateConfig {

    @Bean
    public RestTemplate restTemplate() {

        SimpleClientHttpRequestFactory base = new SimpleClientHttpRequestFactory();
        base.setConnectTimeout(10_000); // 10s
        base.setReadTimeout(180_000);   // 180s

        // ✅ để interceptor đọc body xong vẫn đọc lại được
        ClientHttpRequestFactory factory = new BufferingClientHttpRequestFactory(base);

        RestTemplate rt = new RestTemplate(factory);

        rt.setInterceptors(Collections.singletonList(new LoggingInterceptor()));

        return rt;
    }

    static class LoggingInterceptor implements ClientHttpRequestInterceptor {

        @Override
        public ClientHttpResponse intercept(
                HttpRequest request,
                byte[] body,
                ClientHttpRequestExecution execution
        ) throws IOException {

            long t0 = System.currentTimeMillis();

            String reqBody = body.length > 0 ? new String(body, StandardCharsets.UTF_8) : "";
            log.info("[HTTP OUT] {} {} headers={} body={}",
                    request.getMethod(),
                    request.getURI(),
                    request.getHeaders(),
                    shorten(reqBody, 2000)
            );

            ClientHttpResponse response = execution.execute(request, body);

            long ms = System.currentTimeMillis() - t0;

            String respBody = StreamUtils.copyToString(response.getBody(), StandardCharsets.UTF_8);

            log.info("[HTTP IN ] {} {} -> {} {}ms headers={} body={}",
                    request.getMethod(),
                    request.getURI(),
                    response.getStatusCode().value(), // ✅ FIX
                    ms,
                    response.getHeaders(),
                    shorten(respBody, 4000)
            );


            // ✅ trả lại response body để RestTemplate vẫn parse được
            return new BufferingClientHttpResponseWrapper(response, respBody);
        }

        private static String shorten(String s, int max) {
            if (s == null) return null;
            if (s.length() <= max) return s;
            return s.substring(0, max) + "...(truncated)";
        }
    }

    /**
     * Wrapper để "reset" body sau khi interceptor đã đọc.
     */
    static class BufferingClientHttpResponseWrapper implements ClientHttpResponse {

        private final ClientHttpResponse delegate;
        private final byte[] bodyBytes;

        BufferingClientHttpResponseWrapper(ClientHttpResponse delegate, String body) {
            this.delegate = delegate;
            this.bodyBytes = body == null ? new byte[0] : body.getBytes(StandardCharsets.UTF_8);
        }

        @Override public org.springframework.http.HttpStatusCode getStatusCode() throws IOException { return delegate.getStatusCode(); }

        @Override public String getStatusText() throws IOException { return delegate.getStatusText(); }
        @Override public void close() { delegate.close(); }
        @Override public org.springframework.http.HttpHeaders getHeaders() { return delegate.getHeaders(); }

        @Override
        public java.io.InputStream getBody() {
            return new java.io.ByteArrayInputStream(bodyBytes);
        }
    }
}
