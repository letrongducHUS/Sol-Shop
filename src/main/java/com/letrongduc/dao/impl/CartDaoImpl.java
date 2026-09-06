package com.letrongduc.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.letrongduc.dao.CartDAO;
import com.letrongduc.model.Cart_Items;

import jakarta.transaction.Transactional;

@Repository
@Transactional
public class CartDaoImpl implements CartDAO {

	@Autowired
	private SessionFactory sessionFactory;

    @Override
    public List<Cart_Items> getCartItemsByUserId(int userId) {
    	Session session = sessionFactory.getCurrentSession();
    	String hql = "SELECT c, p.name FROM Cart_Items c JOIN Products p ON c.product_id = p.id WHERE c.user_id = :userId";
    	List<Object[]> results = session.createQuery(hql)
                .setParameter("userId", userId)
                .getResultList();

		// Chuyển sang List<Cart_Items> với productName
		List<Cart_Items> cartItems = new ArrayList<>();
		for (Object[] row : results) {
		Cart_Items c = (Cart_Items) row[0];
		c.setProductName((String) row[1]);
		cartItems.add(c);
		}
		return cartItems;
    }

    @Override
    public void addCartItem(Cart_Items item) {
    	Session session = sessionFactory.getCurrentSession();
    	// Kiểm tra sản phẩm đã tồn tại trong giỏ của user chưa
        String hql = "FROM Cart_Items WHERE user_id = :userId AND product_id = :productId";
        Cart_Items existingItem = session.createQuery(hql, Cart_Items.class)
                .setParameter("userId", item.getUser_id())
                .setParameter("productId", item.getProduct_id())
                .uniqueResult();

        if (existingItem != null) {
            // Nếu đã có, tăng số lượng
            existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
            session.update(existingItem);
        } else {
            // Nếu chưa có, thêm mới
            session.save(item);
        }
    }

    @Override
    public void removeCartItem(int id, int userId) {
    	Session session = sessionFactory.getCurrentSession();
        Cart_Items item = session.createQuery(
                "FROM Cart_Items WHERE id = :id AND user_id = :userId", Cart_Items.class)
                .setParameter("id", id)
                .setParameter("userId", userId)
                .uniqueResult();
        if (item != null) {
            session.delete(item);
        }
    }
}
