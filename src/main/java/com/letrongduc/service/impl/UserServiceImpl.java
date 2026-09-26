package com.letrongduc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letrongduc.dao.UserDAO;
import com.letrongduc.model.Users;
import com.letrongduc.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public Users getUserByUsername(String username) {
		return userDAO.findByUsername(username);
	}

	 @Override
	    public List<Users> getAllUsers() {
	        if(userDAO instanceof com.letrongduc.dao.impl.UserDaoImpl) {
	            return ((com.letrongduc.dao.impl.UserDaoImpl) userDAO).getAllUsers();
	        }
	        return new ArrayList<>();
	    }

	    @Override
	    public Users getUserById(int id) {
	        if(userDAO instanceof com.letrongduc.dao.impl.UserDaoImpl) {
	            return ((com.letrongduc.dao.impl.UserDaoImpl) userDAO).getUserById(id);
	        }
	        return null;
	    }

	    @Override
	    public void updateUser(Users user) {
	        if(userDAO instanceof com.letrongduc.dao.impl.UserDaoImpl) {
	            ((com.letrongduc.dao.impl.UserDaoImpl) userDAO).updateUser(user);
	        }
	    }

	    @Override
	    public void deleteUser(int id) {
	        userDAO.deleteUser(id);
	    }

	    @Override
	    public boolean insertUser(Users user) {
	        return userDAO.insert(user);
	    }

		@Override
		public boolean isAdmin(String username) {
			Users user = userDAO.findByUsername(username);
		    return user != null && "ADMIN".equalsIgnoreCase(user.getRole());
		}
}
