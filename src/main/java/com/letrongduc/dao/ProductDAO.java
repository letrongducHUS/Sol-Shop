package com.letrongduc.dao;

import java.util.List;

import com.letrongduc.model.Products;

public interface ProductDAO {
	
	List<Products> findAll();
	
	Products findById(int id);
	
	void save(Products products);
	
	void update(Products products);
	
	void delete(int id);

	List<Products> findByCategory(String category);
	
	List<Products> searchProducts(String keyword);
}
