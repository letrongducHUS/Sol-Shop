package com.letrongduc.controller;

import com.letrongduc.dao.UserDAO;
import com.letrongduc.model.Users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private UserDAO userDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String showLoginForm(Model model) {
        model.addAttribute("user", new Users());
        return "user/login";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String processLogin(@ModelAttribute("user") Users formUser,
                               HttpSession session,
                               Model model) {

        Users user = userDAO.findByUsernameAndPassword(formUser.getUsername(), formUser.getPassword());
        if (user != null) {
        	if(user.isStatus() == false) {
        		model.addAttribute("error", "Tài khoản chưa được kích hoạt hoặc đã hết hạn!");
        		return "user/login";
        	}
            session.setAttribute("loggedInUser", user);
            return "redirect:/home"; // chuyển sang trang sản phẩm sau khi đăng nhập
        } else {
            model.addAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!");
            return "user/login";
        }
    }
    
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // xóa toàn bộ session
        return "redirect:/login"; // chuyển về trang đăng nhập
    }
}