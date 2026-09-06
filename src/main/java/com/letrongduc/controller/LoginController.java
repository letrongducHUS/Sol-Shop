package com.letrongduc.controller;

import com.letrongduc.model.Users;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@RequestMapping(method = RequestMethod.GET)
    public String showLoginForm(Model model) {
        model.addAttribute("user", new Users());
        return "user/login";
    }
}