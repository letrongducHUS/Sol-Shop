package com.letrongduc.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.letrongduc.dao.ProductDAO;
import com.letrongduc.model.Products;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;

@Repository
public class ProductDaoImpl implements ProductDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Products> findAll() {
		CriteriaBuilder criteriaBuilder= sessionFactory.getCurrentSession().getCriteriaBuilder();
		CriteriaQuery<Products> query= criteriaBuilder.createQuery(Products.class);
		Root<Products> root= query.from(Products.class);
		query.select(root);
		return sessionFactory.getCurrentSession().createQuery(query).getResultList();
	}

	@Override
	public Products findById(int id) {
        return sessionFactory.getCurrentSession().get(Products.class, id);
	}

	@Override
	public void save(Products products) {
		sessionFactory.getCurrentSession().save(products);
	}

	@Override
	public void update(Products products) {
		sessionFactory.getCurrentSession().merge(products);
	}

	@Override
	public void delete(int id) {
		sessionFactory.getCurrentSession().delete(findById(id));
	}

	@Override
	public List<Products> findByCategory(String category) {
		CriteriaBuilder criteriaBuilder = sessionFactory.getCurrentSession().getCriteriaBuilder();
	    CriteriaQuery<Products> query = criteriaBuilder.createQuery(Products.class);
	    Root<Products> root = query.from(Products.class);

	    // Thêm điều kiện where category = :category
	    query.select(root)
	         .where(criteriaBuilder.equal(root.get("category"), category));

	    return sessionFactory.getCurrentSession().createQuery(query).getResultList();
	}

	@Override
	public List<Products> searchProducts(String keyword) {
		Session session = sessionFactory.getCurrentSession();
        String hql = "FROM Products p WHERE lower(p.name) LIKE :keyword OR lower(p.description) LIKE :keyword";
        return session.createQuery(hql)
                      .setParameter("keyword", "%" + keyword.toLowerCase() + "%")
                      .list();
	}
}
