//package com.cinema;
//
//import java.util.NoSuchElementException;
//import java.util.stream.Collectors;
//
//import com.cinema.Entity.TaiKhoan;
//import com.cinema.Services.TaiKhoanService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.http.HttpMethod;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig extends WebSecurityConfigurerAdapter{
//	@Autowired
//	TaiKhoanService taiKhoanService;
//	@Autowired
//	BCryptPasswordEncoder pe;
//
//	//Cung cấp nguồn dữ liệu đăng nhập
//	@Override
//	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
//		auth.userDetailsService(username -> {
//			try {
//				TaiKhoan user= taiKhoanService.findByUsername(username);
//				String password= pe.encode(user.getPassword());
//				String[] roles= user.getAuthorities().stream()
//							.map(er -> er.getRole().getId())
//							.collect(Collectors.toList()).toArray(new String[0]);
//							return User.withUsername(username).password(password).roles(roles).build();
//			}catch (NoSuchElementException e) {
//				throw new UsernameNotFoundException(username + " not found!");
//			}
//		});
//
//	}
//	//Phân quyền sử dụng
//	@Override
//	protected void configure(HttpSecurity http) throws Exception{
//		http.csrf().disable();
//		http.authorizeRequests()
//		.antMatchers("/order/**").authenticated()
//		.antMatchers("/admin/**").hasAnyRole("STAF","DIRE")
//		.antMatchers("/api/authorities").hasRole("DIRE")
//		.anyRequest().permitAll();
//
//		http.formLogin()
//		.loginPage("/security/login/form")
//		.loginProcessingUrl("/security/login")
//		.defaultSuccessUrl("/home/index",false)
//		.failureUrl("/security/login/form");
//
//		http.rememberMe()
//		.tokenValiditySeconds(86400);
//
//		http.exceptionHandling()
//		.accessDeniedPage("/security/unauthoried");
//
//		http.logout()
//			.logoutUrl("/security/logoff")
//			.logoutSuccessUrl("/security/logoff/success");
//	}
//
//	//Cơ chế mã hóa mật khẩu
//	@Bean
//	public BCryptPasswordEncoder getPasswordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
//
//	//Cho phep truy xuat REST API tu ben ngoai(domain khac)
//	@Override
//	public void configure(WebSecurity web) throws Exception{
//		web.ignoring().antMatchers(HttpMethod.OPTIONS,"/**");
//	}
//}
