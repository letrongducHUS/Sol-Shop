package com.letrongduc.controller;

import java.util.List;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.letrongduc.model.Order_Items;
import com.letrongduc.model.Orders;
import com.letrongduc.model.Users;
import com.letrongduc.service.OrderService;

@Controller
@RequestMapping("/userOrders")
public class UserOrderController {

    @Autowired
    private OrderService orderService;

    // Xem danh sách đơn hàng của user
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String myOrders(HttpSession session, Model model) {
        Users user = (Users) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }

        List<Orders> orders = orderService.getOrdersByUserId(user.getId());
        model.addAttribute("orders", orders);
        return "user/user-orders"; // JSP hiển thị danh sách đơn hàng của user
    }

    // Xem chi tiết 1 đơn hàng của user
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String myOrderDetail(@RequestParam("id") int orderId, HttpSession session, Model model) {
        Users user = (Users) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }

        Orders order = orderService.getOrderById(orderId);
        if (order == null || !order.getUser().getId().equals(user.getId())) {
            model.addAttribute("error", "Bạn không có quyền xem đơn hàng này!");
            return "error"; // JSP hiển thị thông báo lỗi
        }

        List<Order_Items> items = orderService.getOrder_Items(orderId);
                     
        model.addAttribute("order", order);
        model.addAttribute("items", items);         
        return "user/user-orders-detail"; // JSP hiển thị chi tiết đơn hàng
    }
    
    // Xóa đơn hàng của user
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteOrder(@RequestParam("id") int orderId, HttpSession session, RedirectAttributes redirectAttrs) {
        Users user = (Users) session.getAttribute("loggedInUser");
        if (user == null) {
            redirectAttrs.addFlashAttribute("error", "Bạn cần đăng nhập trước khi xóa đơn hàng!");
            return "redirect:/login";
        }

        Orders order = orderService.getOrderById(orderId);
        if (order == null || !order.getUser().getId().equals(user.getId())) {
            redirectAttrs.addFlashAttribute("error", "Không tìm thấy đơn hàng hoặc bạn không có quyền xóa!");
            return "redirect:/userOrders/list";
        }

        orderService.deleteOrder(orderId); // xóa đơn hàng
        redirectAttrs.addFlashAttribute("message", "Đơn hàng đã được xóa thành công!");
        return "redirect:/userOrders/list";
    }
}