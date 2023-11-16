package com.cinema.DTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginResponse {
    private String role;

    public LoginResponse(String role) {
        this.role = role;
    }
}
