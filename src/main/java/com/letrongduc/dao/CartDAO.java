package com.letrongduc.dao;

import java.util.List;

import com.letrongduc.model.Cart_Items;

public interface CartDAO {
	
	List<Cart_Items> getCartItemsByUserId(int userId);
	
    void addCartItem(Cart_Items item);
    
    void removeCartItem(int id, int userId);
}