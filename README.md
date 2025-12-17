# Smart Job Finder Service (Backend)

Spring Boot 3 backend cho hệ thống Smart Job Finder. Cung cấp API cho web/mobile, xử lý auth, quản lý hồ sơ, tuyển dụng, thanh toán, thông báo realtime, email và tích hợp AI.

## 📦 Tech stack

- Java 17, Spring Boot 3.5 (Web, Security, Data JPA, Validation, WebSocket)
- DB: MySQL/PostgreSQL (JPA), Redis cache
- Messaging: STOMP WebSocket
- Auth: JWT (HTTP-only cookies), Google OAuth verify
- Cloudinary upload, Mail (SMTP), VnPay, MapStruct, Lombok
- Swagger/OpenAPI via springdoc

## 🗂️ Cấu trúc chính

```
src/main/java/com/jobhuntly/backend
  config/         # cấu hình security, redis, mail, cloudinary, swagger...
  controller/     # REST controllers (auth, jobs, company, profile, AI, payments...)
  dto/            # request/response DTO
  entity/         # JPA entities & enums
  repository/     # Spring Data repositories
  security/       # JWT filter, cookie utils, handlers
  service/        # business services
  websocket/      # STOMP auth & subscribe guard
resources/
  application.yml
  application-local.yml
  templates/      # email templates (Thymeleaf)
  database/       # sample SQL (add_data_demo.sql, job_huntly_db.sql)
```

## ✅ Yêu cầu

- Java 17+
- Gradle (đã kèm `gradlew`)
- MySQL/PostgreSQL
- Redis (nếu bật cache)

## ⚙️ Cấu hình môi trường (`.env.local.properties`)

Tạo file `.env.local.properties` ở thư mục gốc (được import trong profile `local`):

```
# Database
SPRING_DATASOURCE_URL=jdbc:mysql://localhost:3306/job_huntly?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
SPRING_DATASOURCE_USERNAME=root
SPRING_DATASOURCE_PASSWORD=secret
SPRING_JPA_DATABASE_PLATFORM=org.hibernate.dialect.MySQL8Dialect  # hoặc Postgres dialect

# JWT
JWT_SECRET_KEY=change-me

# Frontend/backends URL
FRONTEND_HOST=http://localhost:3000
BACKEND_HOST=http://localhost:8082
BACKEND_PREFIX=/api/v1

# Cloudinary
CLOUDINARY_CLOUD_NAME=
CLOUDINARY_API_KEY=
CLOUDINARY_API_SECRET=

# Mail (SMTP + IMAP listener)
SPRING_MAIL_USERNAME=your@gmail.com
SPRING_MAIL_PASSWORD=app-password
GMAIL_IMAP_USERNAME=your@gmail.com
GMAIL_IMAP_PASS=app-password

# Google OAuth verify
GOOGLE_CLIENT_ID=your-google-client-id

# VNPAY sandbox
VNPAY_TMN_CODE=
VNPAY_SECRET_KEY=

# AI services
GEMINI_API_KEY=
AI_SERVICE_URL=http://localhost:8000
```

## 🚀 Chạy dự án

```bash
cd smart-job-finder-service
./gradlew clean bootRun    # profile mặc định: local
# hoặc build jar
./gradlew clean bootJar
java -jar build/libs/job-huntly-backend-0.0.1-SNAPSHOT.jar
```

Profile mặc định `local` (xem `application.yml`). Có thể dùng `--spring.profiles.active=prod` với `application-prod.yml` của bạn.

## 🔗 Endpoints & tài liệu

- Swagger UI: `/swagger-ui`
- OpenAPI: `/v3/api-docs`
- STOMP WebSocket endpoint: `/ws` (config trong `WebSocketConfig`)
- REST prefix mặc định: `/api/v1`

## 🔐 Bảo mật

- JWT access/refresh lưu ở HTTP-only cookies (`AT`, `RT`)
- Refresh tự động qua endpoint `/auth/refresh`
- CORS cấu hình trong `security.cors.allowed-origins` (`application-local.yml`)
- Route guard WebSocket bằng `WsSubscribeGuard`

## 🔧 Modules chức năng

- Auth: login/register, refresh, social verify (Google ID token), account activation/reset password email
- Jobs & Applications: tìm kiếm, lưu job, apply, trạng thái
- Company & Recruiter: hồ sơ công ty, tin tuyển dụng, gói subscription
- Profile & CV: hồ sơ ứng viên, kỹ năng, kinh nghiệm, tải CV, template
- Notifications: REST + WebSocket push
- Payments: VnPay sandbox flow
- AI: CV/Job matching, interview coach (tích hợp service AI qua HTTP), Gemini key
- Email: SMTP gửi mail, IMAP listener để xử lý phản hồi

## 🧪 Kiểm thử

```bash
./gradlew test
```

## 📝 Ghi chú triển khai

- Import dữ liệu mẫu: `resources/database/add_data_demo.sql` (tùy chỉnh theo DB)
- Nếu không dùng Redis, có thể tắt bằng `APP_REDIS_ENABLED=false`
- Cập nhật `allowed-origins` theo domain frontend/admin

## 👥 Team

- **[Võ Nhật Hào](https://github.com/nhathao512)**
- **[Pham Văn Phúc](https://github.com/pkucpkam)**
