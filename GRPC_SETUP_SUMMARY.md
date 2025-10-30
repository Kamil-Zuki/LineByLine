# gRPC Connection Setup: Inclusive ↔ Personal-Vocab

## ✅ Completed Setup

### 1. Local Development Configuration

**Inclusive gRPC Service (Python)**

- Port: `40051`
- Config: `inclusive/config.json`
- Service: `VocabService.ReviewCard`
- Status: ✅ Running and tested successfully

**Personal-Vocab API (C#)**

- gRPC Client configuration in `appsettings.Development.json`:
  ```json
  "GrpcAddresses": {
    "Inclusive": "http://localhost:40051"
  }
  ```
- Proto: `personal-vocab.API/Protos/Vocab.proto`
- Client: `VocabService.VocabServiceClient` (injected via DI)

### 2. Docker Production Configuration

**docker-compose.yml changes:**

- ✅ `inclusive` service now exposes port `40051`
- ✅ `personal-vocab` depends on `inclusive` service
- ✅ Production connection: `http://inclusive:40051` (service name resolution)
- ✅ Added healthcheck for inclusive service

**appsettings.Production.json:**

- ✅ Updated `GrpcAddresses.Inclusive` to `http://inclusive:40051`

### 3. Fixed Issues

**main.py fixes:**

- ✅ Fixed timestamp serialization using `.FromDatetime()` for proto Timestamp fields
- ✅ Added proper State enum mapping (proto int ↔ FSRS State enum)
- ✅ Handle optional fields (step, stability, difficulty, review_duration)
- ✅ Added error logging and diagnostics

**Key mappings:**

- Proto `state: int32` → FSRS `State` enum (1=Learning, 2=Review, 3=Relearning)
- Proto optional wrappers → FSRS None values
- Proto Timestamps → Python datetime with UTC timezone

### 4. Testing

**Local test successful:**

```
SUCCESS! Received response:
  Card State: 1
  Card Stability: 3.26
  Card Difficulty: 4.88
  Review Rating: 3
```

## Running Locally

### Start Inclusive Service

```powershell
cd inclusive
.\run_local.bat
```

### Test Connection

```powershell
cd inclusive
.\venv\Scripts\Activate.ps1
python test_grpc_local.py
```

### Start Personal-Vocab API

```powershell
cd personal-vocab/personal-vocab.API
dotnet run
```

## Running in Docker

```bash
docker-compose up -d
docker-compose logs -f inclusive
docker-compose logs -f personal-vocab
```

## Proto Files

Both services use identical proto definitions:

- **Python**: `inclusive/proto/vocab.proto`
- **C#**: `personal-vocab/personal-vocab.API/Protos/Vocab.proto`

### Regenerate Proto (if needed)

**Python:**

```bash
cd inclusive
python -m grpc_tools.protoc -I./proto --python_out=./proto --grpc_python_out=./proto proto/vocab.proto
```

**C#:**
Automatically compiled via `.csproj` build.

## Dependencies

**Inclusive service requires:**

- Redis on `localhost:6379` (local) or `redis:6379` (Docker)
- Config matches both environments

**Personal-vocab requires:**

- PostgreSQL on configured port
- Redis on configured port
- Inclusive gRPC service reachable

## Next Steps

1. ✅ Local setup complete and tested
2. ✅ Docker production config verified
3. Ready to use `VocabServiceClient` in personal-vocab controllers/services
4. Monitor logs during first production deployment

## Notes

- Proto state values: 0 is invalid; use 1 (Learning) for new cards
- All timestamps must be UTC
- Optional fields (stability, difficulty) can be None for new cards
- Review duration is optional (None or int seconds)
