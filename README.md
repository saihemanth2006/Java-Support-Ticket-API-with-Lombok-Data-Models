# Java Support Ticket API

A Spring Boot REST API for creating and retrieving support tickets. The immutable data models use Lombok values and builders, with constructor-based dependency injection throughout.

## Requirements

- Java 17 or newer
- No Maven installation is required; the Maven wrapper is included

## Run

On macOS/Linux, run `./mvnw spring-boot:run`. On Windows, run `.\mvnw.cmd spring-boot:run`. The API starts at `http://localhost:8080`.

## Endpoints

- `POST /api/tickets` creates a ticket. JSON requires `title`, `description`, and `priority` (`LOW`, `MEDIUM`, `HIGH`, or `URGENT`).
- `GET /api/tickets` returns all tickets.
- `GET /api/tickets/{id}` returns a ticket by UUID.

Equivalent `/tickets` paths are also supported. Example request:

```bash
curl -X POST http://localhost:8080/api/tickets -H "Content-Type: application/json" -d '{"title":"Cannot sign in","description":"The reset link has expired","priority":"HIGH"}'
```

## Verify

Run `./mvnw clean verify` and `./verify_lombok.sh`. The repository is in-memory, so tickets are cleared when the application restarts.
