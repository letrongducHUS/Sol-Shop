package com.letrongduc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.letrongduc.model.Users;
import com.letrongduc.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;

    // Hiển thị danh sách người dùng
    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String listUsers(Model model) {
        List<Users> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user-list";
    }

    // Hiển thị form tạo mới user
    @RequestMapping(value = "/users/add", method = RequestMethod.GET)
    public String showAddForm(Model model) {
        model.addAttribute("user", new Users());
        return "admin/user-form";
    }

    // Xử lý lưu user mới hoặc cập nhật
    @RequestMapping(value = "/users/save", method = RequestMethod.POST)
    public String saveUser(@ModelAttribute("user") Users user) {
        if (user.getId() == null) {
            userService.insertUser(user);
        } else {
            userService.updateUser(user);
        }
        return "redirect:/admin/users";
    }

    // Hiển thị form chỉnh sửa user
    @RequestMapping(value = "/users/edit/{id}", method = RequestMethod.GET)
    public String showEditForm(@PathVariable("id") int id, Model model) {
        Users user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user-form";
    }

    // Vô hiệu hóa/xóa user
    @RequestMapping(value = "/users/delete/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("id") int id) {
        Users user = userService.getUserById(id);
        if (user != null) {
            user.setStatus(false); // vô hiệu hóa thay vì xóa thật
            userService.updateUser(user);
        }
        return "redirect:/admin/users";
    }
}