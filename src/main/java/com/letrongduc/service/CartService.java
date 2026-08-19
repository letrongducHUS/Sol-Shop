package com.letrongduc.service;

import java.util.List;

import com.letrongduc.model.Cart_Items;

public interface CartService {
	
	List<Cart_Items> getCartItemsByUserId(int userId);
	
    void addCartItem(Cart_Items cart_Items);
    
    void removeCartItem(int id, int userId);

	void clearCart(Integer id);
}