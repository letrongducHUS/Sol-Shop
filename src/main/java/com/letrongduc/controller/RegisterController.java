package com.letrongduc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.letrongduc.dao.UserDAO;
import com.letrongduc.model.Users;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(method = RequestMethod.GET)
	public String showRegisterForm(Model model) {
		model.addAttribute("user", new Users());
		return "user/register";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String processRegister(@ModelAttribute("user") Users users, Model model) {
		if (userDAO.findByUsername(users.getUsername()) != null) {
			model.addAttribute("error", "Tên đăng nhập đã tồn tại!");
			return "user/register";
		}
		
		users.setRole("USER");
		users.setStatus(true);
		
		boolean success = userDAO.insert(users);
		if (success) {
			return "redirect:/login";
		} else {
			model.addAttribute("error", "Đăng ký thất bại, vui lòng thử lại!");
			return "user/register";
		}
	}
}
