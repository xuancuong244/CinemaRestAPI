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
//        http.csrf().disable()
//                .authorizeRequests()
//                .antMatchers("/index").permitAll() // Cho phép truy cập trang index mà không cần đăng nhập
//                .antMatchers("/DynamicCinema/movieDetails").authenticated()
//                .antMatchers("/DynamicCinema/movieDetails").hasRole("KHACH_HANG")
//                .antMatchers("/DynamicCinema/admin/index").hasRole("QUAN_TRI")
//                .anyRequest().permitAll()
//                .and()
//                .formLogin()
//                .loginPage("/index/login/form")
//                .loginProcessingUrl("/index/login")
//                .defaultSuccessUrl("/DynamicCinema/index", false)
//                .failureUrl("/index/login/form")
//                .and()
//                .logout()
//                .logoutUrl("/index/logout")
//                .logoutSuccessUrl("/index/logout/success")
//                .and()
//                .rememberMe().tokenValiditySeconds(86400)
//                .and()
//                .headers().frameOptions().disable() // Disable X-Frame-Options for H2 Console
//                .and()
//                .exceptionHandling().accessDeniedPage("/403"); // Custom 403 access denied page
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
//    // Cho phép truy xuất REST API từ bên ngoài (domain khác)
//    @Override
//    public void configure(WebSecurity web) throws Exception {
//        web.ignoring().antMatchers(HttpMethod.OPTIONS, "/**");
//    }
}

