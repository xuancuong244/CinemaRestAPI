package com.cinema.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class YourDataModel {
    private String selectedDateTime;
    private String selectedMovieInfo;
    private String selectedSeatsInfo;
    private String selectedBranch;


}
