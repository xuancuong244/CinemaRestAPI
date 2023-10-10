package com.cinema.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

import java.io.Serializable;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "ChucVu")
public class ChucVu implements Serializable {
    @Id
    String maCV;
    String tenCV;
}
