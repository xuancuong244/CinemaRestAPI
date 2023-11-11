package com.cinema;

//import lombok.RequiredArgsConstructor;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//
////@Configuration
////@EnableWebSecurity
////@EnableMethodSecurity
////@RequiredArgsConstructor
//import com.cinema.Reponsitory.TaiKhoanRepository;
//import com.cinema.Services.UserInfoService;
//import com.cinema.Services.implServices.TaiKhoanServiceImpl;
//import lombok.RequiredArgsConstructor;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.AuthenticationProvider;
//import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
//import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.web.SecurityFilterChain;
//
//@Configuration
//@EnableWebSecurity
//@EnableMethodSecurity
//@RequiredArgsConstructor
//>>>>>>> Stashed changes
public class SecurityConfig {
//    private final TaiKhoanRepository taiKhoanRepository;
//
//    @Bean
//    public UserDetailsService userDetailsService() {
//        return new UserInfoService(taiKhoanRepository);
//    }
//
//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        return http.csrf().disable()
//                .authorizeHttpRequests()
//                .requestMatchers("/hello", "/user/new").permitAll()
//                .and()
//                .authorizeHttpRequests()

//                .requestMatchers("/index/**").authenticated()
//                .requestMatchers("/admin/index").authenticated()

//                .requestMatchers("/customer/**").authenticated()

//                .requestMatchers("/customer/**").authenticated()
//                .and().formLogin()
//                .and().build();
//    }
//
//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder();
//    }
//
//    @Bean
//    public AuthenticationProvider authenticationProvider(){
//        DaoAuthenticationProvider authenticationProvider=new DaoAuthenticationProvider();
//        authenticationProvider.setUserDetailsService(userDetailsService());
//        authenticationProvider.setPasswordEncoder(passwordEncoder());
//        return authenticationProvider;
//    }
}
