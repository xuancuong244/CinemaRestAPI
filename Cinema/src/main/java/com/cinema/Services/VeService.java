package com.cinema.Services;

import com.cinema.Entity.Ve;

import java.util.List;

public interface VeService {
    List<Ve> findAll();
    boolean existsById(Integer veId);

    void deleteVe(int veId);

    Ve updateVe(int veId, Ve updatedVe);

    Ve addVe(Ve veId);
}
