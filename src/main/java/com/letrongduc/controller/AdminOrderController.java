package com.letrongduc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.letrongduc.model.Order_Items;
import com.letrongduc.model.Orders;
import com.letrongduc.service.OrderService;

@Controller
@RequestMapping("/orders")
public class AdminOrderController {

    @Autowired
    private OrderService orderService;

    // Xem danh sách tất cả đơn hàng
    @RequestMapping(value = "/list",  method = RequestMethod.GET)
    public String listOrders(Model model) {
        List<Orders> orders = orderService.getAllOrders();
        model.addAttribute("orders", orders);
        return "order-list"; // JSP hiển thị danh sách đơn hàng
    }

    // Xem chi tiết một đơn hàng
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String orderDetail(@RequestParam("id") int orderId, Model model) {
        Orders order = orderService.getOrderById(orderId);
        List<Order_Items> items = orderService.getOrder_Items(orderId);
        model.addAttribute("order", order);
        model.addAttribute("items", items);
        return "order-detail"; // JSP hiển thị chi tiết đơn hàng
    }
    
    // Cập nhật trạng thái đơn hàng
//    @RequestMapping(value = "/updateStatus", method = RequestMethod.POST)
//    public String updateOrderStatus(@RequestParam("id") int orderId,
//                                    @RequestParam("status") String status) {
//        Orders order = orderService.getOrderById(orderId);
//        if (order != null) {
//            order.setStatus(status);
//            orderService.updateOrder(order); // cần implement updateOrder trong service
//        }
//        return "redirect:/orders/detail?id=" + orderId;
//    }
}