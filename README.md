# 🚀 Rails Blog API

Dự án Backend API được xây dựng với **Ruby on Rails**, **Grape API**, và **PostgreSQL**, được container hóa hoàn toàn bằng **Docker**.

![Ruby](https://img.shields.io/badge/Ruby-3.2.2-red)
![Rails](https://img.shields.io/badge/Rails-8.x-red)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue)
![Docker](https://img.shields.io/badge/Docker-Enabled-blue)

---

## 🛠 Yêu cầu hệ thống (Prerequisites)

Trước khi bắt đầu, hãy đảm bảo máy tính của bạn đã cài đặt:

- **Docker Desktop** & **Docker Compose**
- **Git**

> 📌 **Lưu ý:** Bạn không cần cài đặt Ruby hay PostgreSQL trực tiếp trên máy, Docker sẽ lo việc đó.

---

## ⚙️ Cài đặt & Chạy dự án (Installation & Setup)

Làm theo các bước sau để khởi chạy môi trường phát triển (Development).

### 1. Clone dự án
```bash
    git clone https://github.com/binhfnguyeen/rails-blog-app.git
    cd blog-app
```
### 2. Build Docker & PostgreSQL Image 
```bash
    docker compose up -d --build
```

### 3. Migrate Database
```bash 
    docker compose run --rm web bin/rails db:migrate
```

## 🧰 Project Structure
```
    .
    ├── app/
    │   ├── api/             # Grape API endpoints
    │   ├── models/          # Database models
    │   └── interactors/     # Business logic (Service objects)
    ├── config/              # App configuration
    ├── db/                  # Migrations & Schema
    ├── docker-compose.yml   # Docker services config
    ├── Dockerfile.dev       # Docker setup for Development
    └── README.md            # Tài liệu dự án
```

## 🌐 Port Mapping

⚠️ Lưu ý: Database được map ra port 5433 ở máy local để tránh xung đột nếu máy bạn có cài sẵn Postgres ở port 5432 mặc định.

| Service                      | URL / Port                                     | Mô tả                                       |
|------------------------------|------------------------------------------------|---------------------------------------------|
| Web              | [http://localhost:3000](http://localhost:3000) | Rails API Server           |
| Postgres                | localhost:5433                                       | Database Server                    |

### Bảng lệnh Docker hữu ích
| Hành động          | Lệnh thực thi                                     | Giải thích                                  |
|--------------------|---------------------------------------------------|---------------------------------------------|
| Khởi chạy / Update | docker compose up -d --build                      | Tự động Build + Migrate + Start Server.     |
| Dừng Server        | docker compose down                               | Tắt toàn bộ container.                      |
| Xem Logs	docker    | compose logs -f web	                              | Xem log thời gian thực của Rails.           |
| Rails Console	     | docker compose run --rm web bin/rails c           | 	Vào màn hình dòng lệnh Ruby để debug.      |
| Cài Gem mới	       | docker compose run --rm web bundle install	       | Chạy lệnh này sau khi thêm gem vào Gemfile. |
| Chạy Migration	    | docker compose run --rm web bin/rails db:migrate  | 	Cập nhật cấu trúc Database.                |
| Rollback DB	       | docker compose run --rm web bin/rails db:rollback | 	Quay lại phiên bản Migration trước.        |
| Tạo Data mẫu	      | docker compose run --rm web bin/rails db:seed     | 	Nạp dữ liệu từ db/seeds.rb.                |
| Reset Database	    | docker compose run --rm web bin/rails db:reset    | 	Xóa sạch DB và tạo lại từ đầu.             |
| Chạy Test	         | docker compose run --rm web bin/rails test        | 	Chạy bộ kiểm thử (Unit Test).              |

