package com.example.supportticket.repository;

import com.example.supportticket.model.Ticket;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface TicketRepository {
    Ticket save(Ticket ticket);

    List<Ticket> findAll();

    Optional<Ticket> findById(UUID id);
}