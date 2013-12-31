package springapp.service;

import java.util.List;

import springapp.domain.Product;
import springapp.repository.ProductDao;

@SuppressWarnings("serial")
public class SimpleProductManager implements ProductManager {

	private ProductDao productDao;

	@Override
	public List<Product> getProducts() {
		return productDao.getProductList();
	}
	
	public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }

	@Override
	public void crearProduco(Product producto) {
		productDao.newProduct(producto);
	}

	@Override
	public Product getProduct(int id) {
		 return productDao.getProduct(id);
		
	}

	@Override
	public void saveProduct(Product producto) {
		productDao.saveProduct(producto);
	}
}
