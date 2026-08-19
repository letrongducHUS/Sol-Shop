package com.letrongduc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.letrongduc.dao.ProductDAO;
import com.letrongduc.model.Products;
import com.letrongduc.service.ProductService;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;

	@Override
	public List<Products> getAllProducts() {
		return productDAO.findAll();
	}

	@Override
	public Products getProductById(int id) {
		return productDAO.findById(id);
	}

	@Override
	public void saveProduct(Products products) {
		if (products.getId() == null || products.getId() == 0) {
			productDAO.save(products);
		} else {
			productDAO.update(products);
		}
	}

	@Override
	public List<Products> getProductsByCategory(String category) {
		return productDAO.findByCategory(category);
	}

	@Override
	public void delete(int id) {
		productDAO.delete(id);
	}

	@Override
	public List<Products> searchProducts(String keyword) {		
		return productDAO.searchProducts(keyword);
	}
}