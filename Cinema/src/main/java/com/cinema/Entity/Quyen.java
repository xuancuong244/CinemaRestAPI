package com.cinema.Entity;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Quyen", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"Email", "ChucVuId"})
})
public class Quyen implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "Email")
    private TaiKhoan taiKhoan;

    @ManyToOne
    @JoinColumn(name = "ChucVuId")
    private ChucVu chucVu;
}
