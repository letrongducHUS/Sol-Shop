package com.letrongduc.config;

import com.letrongduc.service.CustomUserDetailsService;
import com.letrongduc.service.UserService;
import com.letrongduc.model.Users;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	private final CustomUserDetailsService userDetailsService;

    public SecurityConfig(CustomUserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    	http
        .csrf(csrf -> csrf.ignoringRequestMatchers("/logout"))
        .authenticationProvider(authenticationProvider())

        .authorizeHttpRequests(auth -> auth
            // Chưa đăng nhập vẫn được truy cập
            .requestMatchers(
                "/", "/login", "/register",
                "/css/**", "/js/**", "/images/**", "/uploads/**"
            ).permitAll()

            // Chỉ ADMIN được quản lý user, đơn hàng, sản phẩm
            .requestMatchers("/admin/**", "/orders/**").hasRole("ADMIN")
            .requestMatchers(
                "/products/form",
                "/products/save",
                "/products/delete",
                "/products/deleteByCategory"
            ).hasRole("ADMIN")

            // Giỏ hàng, checkout, đơn cá nhân và trang còn lại
            .anyRequest().authenticated()
        )

        .formLogin(form -> form
            .loginPage("/login")
            .loginProcessingUrl("/login")
            .usernameParameter("username")
            .passwordParameter("password")
            .successHandler(authenticationSuccessHandler())
            .failureUrl("/login?error")
            .permitAll()
        )

        .logout(logout -> logout
            .logoutUrl("/logout")
            .logoutSuccessUrl("/login?logout")
            .invalidateHttpSession(true)
            .clearAuthentication(true)
            .deleteCookies("JSESSIONID")
        )

        .sessionManagement(session -> session
            .sessionFixation(fixation -> fixation.migrateSession())
        );
    	
    return http.build();
    }

    @Bean
    public AuthenticationSuccessHandler authenticationSuccessHandler() {
        return (request, response, authentication) -> {
            Users user = userDetailsService.getUserService()
                    .getUserByUsername(authentication.getName());
            if (user != null) {
                request.getSession(true).setAttribute("loggedInUser", user);
            }
            response.sendRedirect(request.getContextPath() + "/home");
        };
    }
    
    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();

        provider.setUserDetailsService(userDetailsService);
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
    	return new BCryptPasswordEncoder();
    }
}
