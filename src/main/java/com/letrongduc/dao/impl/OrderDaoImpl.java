package com.letrongduc.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.letrongduc.dao.OrderDAO;
import com.letrongduc.model.Order_Items;
import com.letrongduc.model.Orders;

@Repository
public class OrderDaoImpl implements OrderDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
    public void saveOrder(Orders order) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(order);
    }

    @Override
    public Orders getOrderById(Integer orderId) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Orders.class, orderId);
    }

    @Override
    public List<Orders> getOrdersByUserId(Integer userId) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("FROM Orders o WHERE o.user.id = :uid ORDER BY o.order_date DESC", Orders.class)
                .setParameter("uid", userId)
                .getResultList();
    }

	@Override
	public List<Orders> getAllOrders() {
		Session session = sessionFactory.getCurrentSession();
        return session.createQuery("FROM Orders", Orders.class).list();
	}

	@Override
	public void saveOrderItem(Order_Items orderItem) {
		Session session = sessionFactory.getCurrentSession();
	    session.save(orderItem);
	}

	@Override
	public List<Order_Items> getOrderItems(Integer orderId) {
		Session session = sessionFactory.getCurrentSession();
	    return session.createQuery(
	    		"FROM Order_Items oi "
	    			      + "JOIN FETCH oi.product p "
	    			      + "WHERE oi.order.id = :order_id", Order_Items.class)
	        .setParameter("order_id", orderId)
	        .getResultList();
	}

//	@Override
//	public void updateOrder(Orders orders) {
//		sessionFactory.getCurrentSession().update(orders);
//	}

	@Override
	public void delete(Integer orderId) {
		Session session = sessionFactory.getCurrentSession();
	    
	    // Xóa trước các Order_Items liên quan
	    Query<?> queryItems = session.createQuery("DELETE FROM Order_Items oi WHERE oi.order.id = :orderId");
	    queryItems.setParameter("orderId", orderId);
	    queryItems.executeUpdate();
	    
	    // Xóa đơn hàng
	    Query<?> queryOrder = session.createQuery("DELETE FROM Orders o WHERE o.id = :orderId");
	    queryOrder.setParameter("orderId", orderId);
	    queryOrder.executeUpdate();
	}
}
