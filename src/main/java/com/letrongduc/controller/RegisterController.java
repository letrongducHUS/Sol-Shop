package com.letrongduc.controller;

import org.springframework.security.crypto.password.PasswordEncoder;
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
	private final UserDAO userDAO;
    private final PasswordEncoder passwordEncoder;

    public RegisterController(UserDAO userDAO, PasswordEncoder passwordEncoder) {
        this.userDAO = userDAO;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new Users());
        return "user/register";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String processRegister(@ModelAttribute("user") Users users, Model model) {
        String username = users.getUsername() == null ? "" : users.getUsername().trim();
        String password = users.getPassword() == null ? "" : users.getPassword();

        if (username.length() < 3 || username.length() > 50) {
            model.addAttribute("error", "Tên đăng nhập phải từ 3 đến 50 ký tự.");
            return "user/register";
        }

        if (password.length() < 8) {
            model.addAttribute("error", "Mật khẩu phải có ít nhất 8 ký tự.");
            return "user/register";
        }

        if (userDAO.findByUsername(username) != null) {
            model.addAttribute("error", "Tên đăng nhập đã tồn tại.");
            return "user/register";
        }

        users.setUsername(username);
        users.setPassword(passwordEncoder.encode(password));
        users.setRole("USER");
        users.setStatus(true);

        if (userDAO.insert(users)) {
            return "redirect:/login?registered";
        }

        model.addAttribute("error", "Đăng ký thất bại, vui lòng thử lại.");
        return "user/register";
    }
}