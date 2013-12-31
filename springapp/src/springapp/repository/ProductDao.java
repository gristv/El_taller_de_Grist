package springapp.repository;

import java.util.List;

import springapp.domain.Product;

public interface ProductDao {
	
	public List<Product> getProductList();
	public void saveProduct(Product prod);
	public void newProduct(Product prod);
	public Product getProduct(int id);
}
