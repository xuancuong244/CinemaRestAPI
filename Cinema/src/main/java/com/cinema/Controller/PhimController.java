package com.cinema.Controller;

import com.cinema.Entity.Phim;
import com.cinema.Reponsitory.PhimReponsitory;
import com.cinema.Services.PhimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class PhimController {
    @Autowired
    PhimService phimService;

}
