package com.cinema;


import com.cinema.Services.implServices.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

//@Configuration
//@EnableWebSecurity
// extends WebSecurityConfigurerAdapter
public class SecurityConfig{
//    @Autowired
//    private UserDetailsServiceImpl userDetailsService;
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http.csrf().disable();
//        http.authorizeRequests()
//                .antMatchers("/DynamicCinema/movieDetails").authenticated()
//                .antMatchers("/DynamicCinema/movieDetails").hasRole("KHACH_HANG")
//                .antMatchers("/DynamicCinema/admin/index").hasRole("QUAN_TRI")
//                .anyRequest().permitAll();
//        http.formLogin()
//                .loginPage("/index/login/form")
//                .loginProcessingUrl("/index/login")
//                .defaultSuccessUrl("/DynamicCinema/index",false)
//                .failureUrl("/index/login/form");
//        http.rememberMe()
//                .tokenValiditySeconds(86400);
//        http.logout()
//                .logoutUrl("/index/logout")
//                .logoutSuccessUrl("/index/logout/success");
//    }
//
//    @Autowired
//    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
//    }
//
//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder();
//    }
//
//    //Cho phep truy xuat REST API tu ben ngoai(domain khac)
//    @Override
//    public void configure(WebSecurity web) throws Exception{
//        web.ignoring().antMatchers(HttpMethod.OPTIONS,"/**");
//    }
}
