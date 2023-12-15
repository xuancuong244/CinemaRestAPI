package com.cinema.RestController;

import com.cinema.Entity.MovieStatistics;
import com.cinema.Services.MovieStatisticService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/Statistic")
public class MovieStatisticRestController {
    @Autowired
    MovieStatisticService movieStatisticService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<MovieStatistics> movieStatistics = movieStatisticService.getMovieStatistics();
        return ResponseEntity.ok(movieStatistics);
    }
}
