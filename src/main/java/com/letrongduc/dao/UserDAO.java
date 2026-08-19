package com.letrongduc.dao;

import java.util.List;

import com.letrongduc.model.Users;

public interface UserDAO {
	
	Users findByUsernameAndPassword(String username, String password);
	
	Users findByUsername(String username);
	
	boolean insert(Users users);
	
	List<Users> getAllUsers();
	
    Users getUserById(int id);
    
    void updateUser(Users user); 
}