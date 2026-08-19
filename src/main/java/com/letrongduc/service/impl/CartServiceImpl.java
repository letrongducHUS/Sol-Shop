package com.letrongduc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letrongduc.dao.CartDAO;
import com.letrongduc.model.Cart_Items;
import com.letrongduc.service.CartService;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cartDAO;

	@Override
	public List<Cart_Items> getCartItemsByUserId(int userId) {
		return cartDAO.getCartItemsByUserId(userId);
	}

	@Override
	public void addCartItem(Cart_Items items) {
		cartDAO.addCartItem(items);
	}

	@Override
	public void removeCartItem(int id, int userId) {
		cartDAO.removeCartItem(id, userId);
	}

	@Override
	public void clearCart(Integer id) {
		List<Cart_Items> items = getCartItemsByUserId(id);
	    for (Cart_Items item : items) {
	        removeCartItem(item.getId(), id);
	    }
	}
}