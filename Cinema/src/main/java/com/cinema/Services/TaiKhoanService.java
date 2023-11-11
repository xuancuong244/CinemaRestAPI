package com.cinema.Services;

import com.cinema.Entity.TaiKhoan;
import org.springframework.stereotype.Service;

import java.util.Optional;

<<<<<<< Updated upstream
=======
@Service
>>>>>>> Stashed changes
public interface TaiKhoanService {
    Optional<TaiKhoan> findTaiKhoanByUsername(String username);
}
