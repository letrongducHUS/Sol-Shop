package com.letrongduc.service;

import java.util.List;

import com.letrongduc.model.Products;

public interface ProductService {
	
	List<Products> getAllProducts();
	
	Products getProductById(int id);
	
	void saveProduct(Products products);

	List<Products> getProductsByCategory(String category);

	void delete(int id);
	
	List<Products> searchProducts(String keyword);
}
