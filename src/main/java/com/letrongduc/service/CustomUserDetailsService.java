package com.letrongduc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.letrongduc.model.Users;

public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UserService userService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Users user = userService.getUserByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("Không tìm thấy user: " + username);
        }

        return User.builder()
                .username(user.getUsername())
                .password(user.getPassword()) // plaintext
                .authorities("ROLE_" + user.getRole())
                .build();
    }
}
