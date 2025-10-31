# LineByLine 🌍📚

> **A science-based language learning platform built on proven acquisition methods.**

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Docker](https://img.shields.io/badge/docker-compose-2496ED?logo=docker)](docker-compose.yml)
[![Next.js](https://img.shields.io/badge/Next.js-15-000000?logo=next.js)](line-by-line-ui/)
[![.NET](https://img.shields.io/badge/.NET-8.0-512BD4?logo=.net)](personal-vocab/)
[![Python](https://img.shields.io/badge/Python-3.8+-3776AB?logo=python)](inclusive/)

---

## 🎯 Overview

**LineByLine** is a comprehensive language learning ecosystem that prioritizes **real acquisition** over gamification. Built with:

- **Spaced Repetition (FSRS 4.5)** — Optimal vocabulary retention
- **Comprehensible Input** — Reading & listening at your level
- **Output Practice** — Speaking (shadowing) & writing tools
- **Community Decks** — Git-like versioning, fork & merge
- **Modular Design** — Focus on one skill at a time

### Core Modules

| Module            | Purpose                            | Status     |
| ----------------- | ---------------------------------- | ---------- |
| 📚 **Vocabulary** | FSRS flashcards, deck management   | ✅ Active  |
| 🎤 **Speaking**   | Shadowing, conversation practice   | 🚧 In Dev  |
| ✍️ **Writing**    | Composition, sentence building     | 🚧 In Dev  |
| 📖 **Reading**    | Graded texts, comprehensible input | 🚧 In Dev  |
| 🎧 **Listening**  | Podcasts, dictation exercises      | 📋 Planned |

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────┐
│           Frontend (Next.js)                        │
│           Port: 8081 (dev: 3000)                    │
└────────────────┬────────────────────────────────────┘
                 │ REST API
┌────────────────▼────────────────────────────────────┐
│           API Gateway (Ocelot)                      │
│           Port: 8090                                │
└─┬────────┬────────┬────────────┬────────────────────┘
  │        │        │            │
  ▼        ▼        ▼            ▼
┌──────┐ ┌─────┐ ┌────────┐ ┌──────────┐
│Auth  │ │Dict │ │Personal│ │Study     │
│Module│ │Parse│ │Vocab   │ │Module    │
│      │ │     │ │        │ │          │
└───┬──┘ └──┬──┘ └───┬────┘ └────┬─────┘
    │       │        │           │
    ▼       ▼        ▼           ▼
┌───────────────────────────────────┐  ┌──────────┐
│     PostgreSQL (2 instances)      │  │  Redis   │
│  - auth-module (5454)             │  │  (6379)  │
│  - personal-vocabulary (5455)     │  └─────┬────┘
└───────────────────────────────────┘        │
                                             │
                  ┌──────────────────────────▼──┐
                  │  Inclusive (Python/gRPC)   │
                  │  FSRS Scheduler (40051)    │
                  └────────────────────────────┘
```

### Tech Stack

| Component            | Technology                      | Purpose                         |
| -------------------- | ------------------------------- | ------------------------------- |
| **Frontend**         | Next.js 15, React 18, Chakra UI | User interface, PWA             |
| **API Gateway**      | ASP.NET Core + Ocelot           | Request routing, load balancing |
| **Backend Services** | ASP.NET Core 8.0                | Business logic, REST APIs       |
| **ML/AI Engine**     | Python 3.8+ (FastAPI + gRPC)    | FSRS scheduling, NLP            |
| **Databases**        | PostgreSQL 13                   | Persistent storage              |
| **Cache**            | Redis 7                         | Session state, real-time data   |
| **Deployment**       | Docker Compose                  | Container orchestration         |

---

## 📋 Prerequisites

### Option 1: Docker (Recommended) 🐋

- **Docker Desktop** 4.0+ ([Download](https://www.docker.com/products/docker-desktop))
- **Docker Compose** (included with Docker Desktop)
- **8 GB RAM** minimum (16 GB recommended)

### Option 2: Local Development 💻

#### Windows

- **Node.js** 18+ ([Download](https://nodejs.org/))
- **npm** 9+ (comes with Node.js)
- **.NET SDK** 8.0+ ([Download](https://dotnet.microsoft.com/download))
- **Python** 3.8+ ([Download](https://www.python.org/downloads/))
- **PostgreSQL** 13+ ([Download](https://www.postgresql.org/download/))
- **Redis** ([Download](https://redis.io/download) or use WSL)

#### Linux/macOS

```bash
# Ubuntu/Debian
sudo apt update
sudo apt install nodejs npm dotnet-sdk-8.0 python3 python3-pip postgresql redis

# macOS (Homebrew)
brew install node python@3.11 dotnet postgresql redis
brew services start postgresql
brew services start redis
```

---

## 🚀 Quick Start (Docker)

### 1. Clone Repository

```bash
git clone https://github.com/yourusername/LineByLine.git
cd LineByLine
```

### 2. Start All Services

```bash
# Build and start all containers
docker-compose up -d

# View logs
docker-compose logs -f

# Check service health
docker-compose ps
```

### 3. Access Application

| Service                | URL                   | Credentials          |
| ---------------------- | --------------------- | -------------------- |
| **Frontend**           | http://localhost:8081 | Register new account |
| **API Gateway**        | http://localhost:8090 | N/A                  |
| **PostgreSQL (Auth)**  | localhost:5454        | postgres / 123       |
| **PostgreSQL (Vocab)** | localhost:5455        | postgres / 123       |
| **Redis**              | localhost:6379        | No password          |
| **Inclusive (gRPC)**   | localhost:40051       | gRPC only            |

### 4. First-Time Setup

```bash
# Database migrations run automatically on first start
# Create your first user via the UI at http://localhost:8081

# Optional: Seed test data
docker-compose exec personal-vocab dotnet ef database update
```

### 5. Stop Services

```bash
# Stop all containers (preserves data)
docker-compose down

# Stop and remove volumes (clean slate)
docker-compose down -v
```

---

## 💻 Local Development Setup

### 1. Setup Databases

```bash
# PostgreSQL - Create databases
psql -U postgres
CREATE DATABASE "auth-module";
CREATE DATABASE "personal-vocabulary";
\q

# Redis - Start service
# Windows (WSL): sudo service redis-server start
# macOS: brew services start redis
# Linux: sudo systemctl start redis
```

### 2. Backend Services

#### A. Authorization Module

```bash
cd authorization-module/authorization-module.API

# Configure connection string
# Edit appsettings.Development.json:
# "ConnectionStrings": {
#   "DefaultConnection": "Server=localhost;Port=5432;Database=auth-module;User Id=postgres;Password=yourpassword"
# }

# Install dependencies & run
dotnet restore
dotnet ef database update
dotnet run

# Runs on: http://localhost:5000
```

#### B. Personal Vocab Service

```bash
cd personal-vocab/personal-vocab.API

# Configure appsettings.Development.json:
# {
#   "ConnectionStrings": {
#     "DefaultConnection": "Server=localhost;Port=5432;Database=personal-vocabulary;User Id=postgres;Password=yourpassword"
#   },
#   "Redis": {
#     "ConnectionString": "localhost:6379"
#   },
#   "GrpcAddresses": {
#     "Inclusive": "http://localhost:40051"
#   }
# }

dotnet restore
dotnet ef database update
dotnet run

# Runs on: http://localhost:5001
```

#### C. Dictionary Parser

```bash
cd dictionary-parser

dotnet restore
dotnet run

# Runs on: http://localhost:5002
```

#### D. Study Module

```bash
cd study-module

dotnet restore
dotnet run

# Runs on: http://localhost:5003
```

#### E. API Gateway

```bash
cd api-gateway/api-gateway

# Edit ocelot.json to point to local service URLs
dotnet restore
dotnet run

# Runs on: http://localhost:8090
```

### 3. Python Service (Inclusive - FSRS)

```bash
cd inclusive

# Create virtual environment
python -m venv venv

# Activate environment
# Windows:
venv\Scripts\activate
# Linux/macOS:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run server
python main.py

# Runs on: localhost:40051 (gRPC)
```

**Windows Quick Start:**

```bash
cd inclusive
run_local.bat
```

**Test gRPC Connection:**

```bash
cd inclusive
python test_grpc_local.py
```

### 4. Frontend (Next.js)

```bash
cd line-by-line-ui

# Install dependencies
npm install

# Configure environment
# Create .env.local:
echo "NEXT_PUBLIC_API_URL=http://localhost:8090" > .env.local

# Run development server
npm run dev

# Runs on: http://localhost:3000
```

---

## 🧪 Testing

### Backend Tests

```bash
# Run all .NET tests
dotnet test

# Specific project
cd personal-vocab
dotnet test --verbosity normal
```

### Python Tests

```bash
cd inclusive
pytest

# With coverage
pytest --cov=. --cov-report=html
```

### Frontend Tests

```bash
cd line-by-line-ui
npm test

# E2E tests (if configured)
npm run test:e2e
```

### Manual API Testing

```bash
# Test authorization
curl -X POST http://localhost:8090/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"Test123!","username":"testuser"}'

# Test vocabulary deck creation (with JWT token)
curl -X POST http://localhost:8090/api/decks \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"name":"Spanish Basics","language":"Spanish","description":"My first deck"}'
```

---

## 🔧 Configuration

### Environment Variables

#### Frontend (`line-by-line-ui/.env.local`)

```bash
NEXT_PUBLIC_API_URL=http://localhost:8090
NODE_ENV=development
```

#### Backend Services (appsettings.Development.json)

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=localhost;Port=5432;Database=your-db;User Id=postgres;Password=yourpassword"
  },
  "Jwt": {
    "Secret": "your-secret-key-min-32-chars",
    "Issuer": "LineByLine",
    "Audience": "LineByLineUsers",
    "ExpirationMinutes": 60
  },
  "Redis": {
    "ConnectionString": "localhost:6379"
  },
  "GrpcAddresses": {
    "Inclusive": "http://localhost:40051"
  }
}
```

#### Python Service (`inclusive/config.json`)

```json
{
  "grpc_port": 40051,
  "redis_host": "localhost",
  "redis_port": 6379
}
```

### Database Migrations

```bash
# Create new migration
cd personal-vocab/personal-vocab.API
dotnet ef migrations add MigrationName

# Apply migration
dotnet ef database update

# Rollback migration
dotnet ef database update PreviousMigrationName

# Generate SQL script
dotnet ef migrations script
```

---

## 🐛 Troubleshooting

### Common Issues

#### 1. Port Already in Use

```bash
# Windows - Find and kill process
netstat -ano | findstr :8090
taskkill /PID <PID> /F

# Linux/macOS
lsof -ti:8090 | xargs kill -9
```

#### 2. Docker Container Fails to Start

```bash
# Check logs
docker-compose logs <service-name>

# Rebuild without cache
docker-compose build --no-cache <service-name>
docker-compose up -d <service-name>

# Remove all containers and volumes (CAUTION: Deletes data)
docker-compose down -v
docker system prune -a
```

#### 3. Database Connection Errors

```bash
# Verify PostgreSQL is running
# Windows (WSL): sudo service postgresql status
# macOS: brew services list
# Linux: sudo systemctl status postgresql

# Test connection
psql -U postgres -h localhost -p 5432

# Check Docker network
docker-compose exec personal-vocab ping postgres_pv
```

#### 4. gRPC Connection Refused (Inclusive)

```bash
# Verify service is running
netstat -an | findstr 40051  # Windows
lsof -i :40051               # Linux/macOS

# Test gRPC locally
cd inclusive
python test_grpc_local.py

# Check firewall
# Windows: Allow port 40051 in Windows Defender Firewall
# Linux: sudo ufw allow 40051
```

#### 5. Next.js Build Errors

```bash
# Clear cache
cd line-by-line-ui
rm -rf .next node_modules package-lock.json

# Reinstall
npm install
npm run build
```

#### 6. Redis Connection Issues

```bash
# Test Redis
redis-cli ping
# Should return: PONG

# Check Redis logs
# Docker: docker-compose logs redis
# Local: sudo tail -f /var/log/redis/redis-server.log
```

---

## 📚 Documentation

| Document                                                   | Description                             |
| ---------------------------------------------------------- | --------------------------------------- |
| [PLATFORM_VISION.md](PLATFORM_VISION.md)                   | Complete platform vision & roadmap      |
| [PLATFORM_VISION_styled.html](PLATFORM_VISION_styled.html) | Beautiful web version (open in browser) |
| [GRPC_SETUP_SUMMARY.md](GRPC_SETUP_SUMMARY.md)             | gRPC integration guide                  |
| [inclusive/RUN_LOCAL.md](inclusive/RUN_LOCAL.md)           | Python service local setup              |
| [DOCUMENTATION_FORMATS.md](DOCUMENTATION_FORMATS.md)       | Export documentation to PDF/DOCX        |

---

## 🗂️ Project Structure

```
LineByLine/
├── api-gateway/              # Ocelot API Gateway (ASP.NET)
├── authorization-module/     # User auth, JWT (ASP.NET)
├── dictionary-parser/        # Word definition scraping (ASP.NET)
├── study-module/             # Study session logic (ASP.NET)
├── personal-vocab/           # Vocabulary management (ASP.NET + FSRS)
│   ├── personal-vocab.API/   # REST API
│   ├── personal-vocab.DAL/   # Data Access Layer
│   └── dotnet-fsrs/          # FSRS algorithm (C#)
├── inclusive/                # Python gRPC service
│   ├── proto/                # Protobuf definitions
│   ├── main.py               # gRPC server
│   └── requirements.txt
├── line-by-line-ui/          # Next.js frontend
│   ├── app/                  # App router (Next.js 13+)
│   ├── components/           # React components
│   └── public/               # Static assets
├── docker-compose.yml        # Container orchestration
├── PLATFORM_VISION.md        # Project documentation
└── README.md                 # This file
```

---

## 🛠️ Development Workflow

### 1. Feature Development

```bash
# Create feature branch
git checkout -b feature/your-feature-name

# Make changes, test locally
npm run dev  # Frontend
dotnet run   # Backend services

# Commit with conventional commits
git commit -m "feat(vocab): add bulk card import"

# Push and create PR
git push origin feature/your-feature-name
```

### 2. Database Changes

```bash
# Add/modify entity in personal-vocab.DAL/Entities/

# Create migration
cd personal-vocab/personal-vocab.API
dotnet ef migrations add YourMigrationName

# Review migration file in Migrations/

# Apply to local DB
dotnet ef database update

# Test in Docker
docker-compose down -v
docker-compose up -d
```

### 3. Proto Changes (gRPC)

```bash
# Edit proto file
# inclusive/proto/vocab.proto
# personal-vocab/personal-vocab.API/Protos/Vocab.proto (keep in sync)

# Regenerate Python code
cd inclusive
python -m grpc_tools.protoc \
  -I./proto \
  --python_out=./proto \
  --grpc_python_out=./proto \
  proto/vocab.proto

# C# code regenerates automatically on build
cd ../../personal-vocab/personal-vocab.API
dotnet build

# Test connection
cd ../../inclusive
python test_grpc_local.py
```

---

## 🚢 Deployment

### Production Checklist

- [ ] Update `appsettings.Production.json` with production DB/Redis
- [ ] Set strong JWT secrets (32+ characters)
- [ ] Configure CORS for production domain
- [ ] Enable HTTPS/SSL certificates
- [ ] Set up database backups
- [ ] Configure logging (Serilog, ELK, etc.)
- [ ] Set up monitoring (Prometheus, Grafana)
- [ ] Review and minimize exposed ports
- [ ] Enable Docker secrets for sensitive data
- [ ] Configure CDN for static assets

### Docker Production Build

```bash
# Build production images
docker-compose -f docker-compose.prod.yml build

# Start with production config
docker-compose -f docker-compose.prod.yml up -d

# Monitor logs
docker-compose -f docker-compose.prod.yml logs -f
```

### Environment-Specific Builds

```bash
# Development
docker-compose up -d

# Staging
docker-compose -f docker-compose.staging.yml up -d

# Production
docker-compose -f docker-compose.prod.yml up -d
```

---

## 🤝 Contributing

We welcome contributions! Please read our [Contributing Guidelines](CONTRIBUTING.md) first.

### Development Setup

1. Fork the repository
2. Clone your fork: `git clone https://github.com/yourusername/LineByLine.git`
3. Create a feature branch: `git checkout -b feature/amazing-feature`
4. Make your changes
5. Test thoroughly (local + Docker)
6. Commit: `git commit -m "feat: add amazing feature"`
7. Push: `git push origin feature/amazing-feature`
8. Open a Pull Request

### Commit Convention

```
feat: New feature
fix: Bug fix
docs: Documentation changes
style: Code style changes (formatting)
refactor: Code refactoring
test: Adding tests
chore: Build/tooling changes
```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **FSRS Algorithm:** [open-spaced-repetition/py-fsrs](https://github.com/open-spaced-repetition/py-fsrs)
- **Inspiration:** Anki, Duolingo, LingQ, Stephen Krashen's research
- **Tech Stack:** Next.js, ASP.NET Core, PostgreSQL, Redis, Docker

---

## 📞 Support

- **Documentation:** [PLATFORM_VISION.md](PLATFORM_VISION.md)
- **Issues:** [GitHub Issues](https://github.com/yourusername/LineByLine/issues)
- **Discussions:** [GitHub Discussions](https://github.com/yourusername/LineByLine/discussions)

---

## 🗺️ Roadmap

### Phase 1: MVP (Q4 2025) ✅

- [x] User authentication
- [x] Vocabulary module (FSRS)
- [x] Deck management (create, fork)
- [x] Basic gamification (XP, streaks)
- [ ] Speaking module (shadowing)
- [ ] Reading module (graded texts)

### Phase 2: Enhanced Modules (Q1 2026)

- [ ] Listening module (podcasts, dictation)
- [ ] Writing module (composition studio)
- [ ] AI conversation partner
- [ ] Social features (friends, leaderboards)
- [ ] Mobile PWA (offline mode)

### Phase 3: Community (Q2 2026)

- [ ] Public deck marketplace
- [ ] Deck versioning UI (git-like)
- [ ] Content import tools (Anki, CSV)
- [ ] Creator analytics
- [ ] Premium tier

### Phase 4: Advanced AI (Q3 2026)

- [ ] AI tutor (chat in target language)
- [ ] Auto-generate decks from videos
- [ ] Adaptive difficulty engine
- [ ] Real-time pronunciation feedback

See [PLATFORM_VISION.md](PLATFORM_VISION.md) for detailed roadmap.

---

<div align="center">

**Made with ❤️ by the LineByLine Team**

[⭐ Star us on GitHub](https://github.com/yourusername/LineByLine) | [🐛 Report Bug](https://github.com/yourusername/LineByLine/issues) | [💡 Request Feature](https://github.com/yourusername/LineByLine/issues)

</div>
