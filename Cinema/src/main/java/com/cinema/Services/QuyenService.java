package com.cinema.Services;

import com.cinema.Entity.Quyen;

import java.util.List;

public interface QuyenService {
    List<Quyen> findAll();
    public Quyen create(Quyen auth);
    public void delete(Integer id);
    public List<Quyen> findAuthoritiesOfAdministrators();
}
