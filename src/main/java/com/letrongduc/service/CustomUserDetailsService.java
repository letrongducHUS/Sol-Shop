 package com.letrongduc.service;

  import com.letrongduc.model.Users;

  import org.springframework.security.core.userdetails.User;
  import org.springframework.security.core.userdetails.UserDetails;
  import org.springframework.security.core.userdetails.UserDetailsService;
  import org.springframework.security.core.userdetails.UsernameNotFoundException;
  import org.springframework.stereotype.Service;

  @Service
  public class CustomUserDetailsService implements UserDetailsService {

      private final UserService userService;

      public CustomUserDetailsService(UserService userService) {
          this.userService = userService;
      }

      public UserService getUserService() {
          return userService;
      }

      @Override
      public UserDetails loadUserByUsername(String username)
              throws UsernameNotFoundException {

          Users user = userService.getUserByUsername(username);

          if (user == null) {
              throw new UsernameNotFoundException("Không tìm thấy tài khoản.");
          }

          return User.withUsername(user.getUsername())
                  .password(user.getPassword())
                  .roles(user.getRole())
                  .disabled(!user.isStatus())
                  .build();
      }
  }
