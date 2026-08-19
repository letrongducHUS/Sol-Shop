package com.letrongduc.dao;

import java.util.List;

import com.letrongduc.model.Order_Items;
import com.letrongduc.model.Orders;

public interface OrderDAO {
	
	void saveOrder(Orders order);
	
    Orders getOrderById(Integer orderId);
    
    List<Orders> getOrdersByUserId(Integer userId);
    
    List<Orders> getAllOrders();
    
    void saveOrderItem(Order_Items orderItem);
    
    List<Order_Items> getOrderItems(Integer orderId);
    
//    void updateOrder(Orders orders);
    
    void delete(Integer orderId);
}
