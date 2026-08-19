package com.letrongduc.service.impl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letrongduc.dao.OrderDAO;
import com.letrongduc.model.Cart_Items;
import com.letrongduc.model.Order_Items;
import com.letrongduc.model.Orders;
import com.letrongduc.service.OrderService;
import com.letrongduc.service.ProductService;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private ProductService productService;
	
	@Override
    public void saveOrder(Orders order) {
        orderDAO.saveOrder(order);
    }

    @Override
    public Orders getOrderById(int id) {
        return orderDAO.getOrderById(id);
    }

    @Override
    public List<Orders> getAllOrders() {
        return orderDAO.getAllOrders();
    }

    @Override
    public List<Orders> getOrdersByUserId(int userId) {
        return orderDAO.getOrdersByUserId(userId);
    }

	@Override
	public void saveOrderWithItems(Orders order, List<Cart_Items> cartItems) {
		
		BigDecimal totalPrice = BigDecimal.ZERO;
		for (Cart_Items ci : cartItems) {
			BigDecimal price = BigDecimal.valueOf(ci.getPrice());
	        BigDecimal quantity = BigDecimal.valueOf(ci.getQuantity());
	        totalPrice = totalPrice.add(price.multiply(quantity));
		}
		order.setTotal_amount(totalPrice);
		
		orderDAO.saveOrder(order);
	    for (Cart_Items ci : cartItems) {
	        Order_Items detail = new Order_Items();
	        detail.setOrder(order);
	        detail.setProduct(productService.getProductById(ci.getProduct_id()));
	        detail.setQuantity(ci.getQuantity());
	        orderDAO.saveOrderItem(detail);
	    }
	}

	@Override
	public List<Order_Items> getOrder_Items(int orderId) {
		return orderDAO.getOrderItems(orderId);
	}

//	@Override
//	public void updateOrder(Orders order) {
//		orderDAO.updateOrder(order);
//	}

	@Override
	public void deleteOrder(int orderId) {
		orderDAO.delete(orderId);
	}

	@Override
	public void saveOrderItem(Order_Items item) {
		orderDAO.saveOrderItem(item);
	}
}