package com.letrongduc.controller;

import com.letrongduc.model.Cart_Items;
import com.letrongduc.model.Orders;
import com.letrongduc.model.Products;
import com.letrongduc.model.Users;
import com.letrongduc.service.CartService;
import com.letrongduc.service.OrderService;
import com.letrongduc.service.ProductService;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;
    
    @Autowired
    private OrderService orderService;
    
    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String viewCart(HttpSession session, Model model) {
        Users user = (Users) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }

        List<Cart_Items> cartItems = cartService.getCartItemsByUserId(user.getId());
        model.addAttribute("cartItems", cartItems);
        return "cart";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addToCart(@RequestParam("productId") int productId,
                            @RequestParam("quantity") int quantity,
                            HttpSession session) {

        Users user = (Users) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }
        if (quantity <= 0) {
            return "redirect:/products";
        }
        
        Products product = productService.getProductById(productId);
        if (product == null) {
            return "redirect:/products";
        }

        Cart_Items item = new Cart_Items();
        item.setUser_id(user.getId());
        item.setProduct_id(productId);
        item.setQuantity(quantity);
        item.setCreated_at(new Date());
        item.setPrice(product.getPrice().doubleValue()); 

        cartService.addCartItem(item);

        return "redirect:/cart/view";
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String removeFromCart(@RequestParam("id") int id, HttpSession session) {
        Users user = (Users) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }

        cartService.removeCartItem(id, user.getId());
        return "redirect:/cart/view";
    }
 
    @RequestMapping(value = "/clear", method = RequestMethod.POST)
    public String clearCart(HttpSession session) {
        Users user = (Users) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }
        cartService.clearCart(user.getId());
        return "redirect:/cart/view";
    }
    
    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String showCheckoutForm(HttpSession session, Model model) {
        Users user = (Users) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }

        List<Cart_Items> cartItems = cartService.getCartItemsByUserId(user.getId());
        if (cartItems.isEmpty()) {
            model.addAttribute("error", "Giỏ hàng trống!");
            return "cart";
        }

        model.addAttribute("order", new Orders());
        model.addAttribute("cartItems", cartItems);
        return "checkout-form";
    }

    @RequestMapping(value = "/checkout", method = RequestMethod.POST)
    public String processCheckout(
            @ModelAttribute("order") Orders order,
            HttpSession session,
            Model model
    ) {
        Users user = (Users) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }

        List<Cart_Items> cartItems = cartService.getCartItemsByUserId(user.getId());
        if (cartItems.isEmpty()) {
            model.addAttribute("error", "Giỏ hàng trống!");
            return "cart";
        }
       
        order.setUser(user);
        order.setOrder_date(new Date());
        order.setStatus("Đang xử lý");
      
        BigDecimal totalAmount = BigDecimal.ZERO;

        for (Cart_Items ci : cartItems) {
            Products product = productService.getProductById(ci.getProduct_id());
            if (product != null) {
                // product.getPrice() là BigDecimal
                ci.setPrice(product.getPrice().doubleValue()); 
            }

            BigDecimal itemPrice = BigDecimal.valueOf(ci.getPrice());
            BigDecimal quantity = BigDecimal.valueOf(ci.getQuantity());

            totalAmount = totalAmount.add(itemPrice.multiply(quantity));
        }
        
        order.setTotal_amount(totalAmount);
        
        orderService.saveOrderWithItems(order, cartItems);
       
        cartService.clearCart(user.getId());
                                
        model.addAttribute("message", "Đặt hàng thành công! Mã đơn hàng: " + order.getId());
        return "order-success";
    }
}
