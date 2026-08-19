package com.letrongduc.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.letrongduc.model.Products;
import com.letrongduc.service.ProductService;

@Controller
@RequestMapping("/products")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/form")
    public String showForm(@RequestParam(value = "id", required = false) Integer id, Model model) { 				
        Products product = (id != null) ? productService.getProductById(id) : new Products();
        model.addAttribute("product", product);
        return "product-form";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveProduct(@ModelAttribute("product") Products product,@RequestParam("imageFile") MultipartFile imageFile) throws IOException {
    	
    	String uploadDir = "E:/uploads/";

        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
        File destination = new File(dir, fileName);
      
        imageFile.transferTo(destination);

        product.setImage(fileName);

        productService.saveProduct(product);
        return "redirect:/products";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String listProductsByCategory(@RequestParam(value = "category", required = false) String category, Model model) {
        List<Products> products;
        if (category != null && !category.isEmpty()) {
            products = productService.getProductsByCategory(category);
            model.addAttribute("products", products);
            model.addAttribute("categoryName", category);
            return "product-list-filter-by-category";
        } else {
            products = productService.getAllProducts();
            
            products.sort((p1, p2) -> Integer.compare(p2.getId(), p1.getId()));
            model.addAttribute("categoryName", "Tất cả sản phẩm");
            model.addAttribute("products", products);
        }
        return "product-list"; 
    }
    
    @RequestMapping(value = "/deleteByCategory", method = RequestMethod.GET)
    public String deleteProductByCategory(
            @RequestParam("id") int id,
            @RequestParam(value = "category", required = false) String category) {

        productService.delete(id);
        if (category != null && !category.isEmpty()) {
            return "redirect:/products?category=" + category;
        } else {
            return "redirect:/products";
        }
    }
    
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteProduct(@RequestParam("id") int id) {
        productService.delete(id);
        return "redirect:/products";
    }
    
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam("keyword") String keyword, Model model) {
    	List<Products> products = productService.searchProducts(keyword);
    	
    	products.sort((p1, p2) -> Integer.compare(p2.getId(), p1.getId()));
    	model.addAttribute("products", products);
    	model.addAttribute("keyword", keyword);
    	return "product-list";
    } 
}
