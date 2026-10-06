package com.example.supportticket.model;

import lombok.Builder;
import lombok.Value;
import lombok.extern.jackson.Jacksonized;

import java.time.Instant;
import java.util.UUID;

@Value
@Builder
@Jacksonized
public class Ticket {
    UUID id;
    String title;
    String description;
    TicketStatus status;
    TicketPriority priority;
    Instant createdAt;
}