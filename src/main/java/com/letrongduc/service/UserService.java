package com.letrongduc.service;

import java.util.List;

import com.letrongduc.model.Users;

public interface UserService {
	
	Users getUserByUsername(String username);
	
	List<Users> getAllUsers();

    Users getUserById(int id);

    void updateUser(Users user);

    boolean insertUser(Users user);
    
    boolean isAdmin(String username);
}
