package com.letrongduc.service;

import java.util.List;

import com.letrongduc.model.Cart_Items;
import com.letrongduc.model.Order_Items;
import com.letrongduc.model.Orders;

public interface OrderService {
	
	void saveOrder(Orders order);
	
    Orders getOrderById(int id);
    
    List<Orders> getAllOrders();
    
    List<Orders> getOrdersByUserId(int userId);

	void saveOrderWithItems(Orders order, List<Cart_Items> cartItems);
	
	List<Order_Items> getOrder_Items(int orderId);

//	void updateOrder(Orders order);

	void deleteOrder(int orderId);
	
	void saveOrderItem(Order_Items item);
}