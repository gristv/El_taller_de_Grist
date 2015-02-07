package springapp.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcDaoSupport;

import springapp.domain.Product;


/**
 * @author Administrador
 * 
 * Spring dispone de un framework de abstraccion JDBC que vamos a usar. La mayor diferencia 
 * entre usar JDBC directamente y el framework JDBC de Spring es que no tienes que preocuparte 
 * de abrir o cerrar conexiones, o cualquier c�digo similar. Todo esto es manejado de manera 
 * automatica. Otra ventaja es que no tienes que capturar ninguna excepcion, a menos que 
 * quieras. Spring envuelve todas las excepciones de tipo SQLException en un familia de excepciones 
 * de tipo unchecked que heredan de DataAccessException. Si lo deseas, puedes capturar esta excepcion, 
 * pero puesto que muchas excepciones de base de datos son imposibles de recuperar de ninguna manera, 
 * puedes simplemente dejar que esta excepcion se propague hacia un nivel superior. La clase 
 * SimpleJdbcDaoSupport provee el acceso necesario para obtener un previamente configurado objeto 
 * SimpleJdbcTemplate, por lo que podemos heredar de esta clase. Todo lo que tenemos que proveer en 
 * el contexto de la aplicacion es un DataSource convenientemente configurado.
 * 
 * Puesto que estamos extendiendo SimpleJdbcSupport disponemos de un objeto SimpleJdbcTemplate preparado 
 * y listo para usar. Este objeto es accedido llamando al metodo getSimpleJdbcTemplate().
 * 
 * Comentario de prueba para git
 */

public class JdbcProductDao extends SimpleJdbcDaoSupport implements ProductDao {

	/** Logger for this class and subclasses */
	static final Logger logger = Logger.getLogger(JdbcProductDao.class.getName());
	
	/**
	 * El m�todo, getProductList() ejecuta una consulta usando SimpleJdbcTemplate. Para ello incluimos en el una 
	 * sentencia SQL y una clase que pueda manejar el mapeo entre el el ResultSet y la clase Product. En nuestro caso 
	 * este mapeador es una clase llamada ProductMapper que hemos definido como una clase interna del DAO. Por supuesto 
	 * que esta clase no sera usada fuera del DAO por lo que hacerla interna es una buena solucion.
	 * 
	 * ProductMapper implementa la interface ParameterizedRowMapper que define un unico metodo llamado mapRow , y que 
	 * por tanto debe ser implementado. Este metodo mapeara los datos de cada fila de la base de datos a una clase que 
	 * representa la entidad que estas recuperando con tu consulta. Puesto que RowMapper es parametizado, el metodo mapRow 
	 * devuelve el mismo tipo que ha creado.
	 */
	
	@Override
	public List<Product> getProductList() {
		logger.info("Getting products!");
        List<Product> products = getSimpleJdbcTemplate().query(
                "select id, description, price from products", 
                new ProductMapper());
        return products;
	}
	
	/**
	 * El metodo saveProduct tambien usa SimplJdbcTemplate. Esta vez hacemos un update pasando la correspondiente sentencia 
	 * SQL junto con el valor de los parametros mediante un objeto MapSqlParameterSource. Usar MapSqlParameterSource nos permite 
	 * usar parametros con nombre en lugar de los caracteres "?" que hubieras necesitado para escribir una sentencia SQL. Los parametros 
	 * con nombre hacen tu codigo mas explicito y evitan problemas causados por parametros con valores incorrectos (debido a errores de 
	 * ordenacion, etc). El metodo update devuelve el numero de filas afectadas en la base de datos.
	 */
	
	@Override
	public void saveProduct(Product prod) {
		logger.info("Saving product: " + prod.getDescription());
        int count = getSimpleJdbcTemplate().update(
            "update products set description = :description, price = :price where id = :id",
            new MapSqlParameterSource().addValue("description", prod.getDescription())
                .addValue("price", prod.getPrice())
                .addValue("id", prod.getId()));
        logger.info("Rows affected: " + count);
	}
	
	@Override
	public void newProduct(Product prod) {
		logger.info("New product: " + prod.getDescription());
		int count =getSimpleJdbcTemplate().update(
			"insert into products (id, description, price) values(NULL, :description, :price)",
			 new MapSqlParameterSource().addValue("description", prod.getDescription())
			 	.addValue("price", prod.getPrice())
			 	.addValue("id", prod.getId()));
		logger.info("Rows affected: " + count);
		
	}
	
	@Override
	public Product getProduct(int id) {
		logger.info("Getting one product!");
		List<Product> products = getSimpleJdbcTemplate().query(
                "select id, description, price from products where id = :id",
                new ProductMapper(),
                new MapSqlParameterSource().addValue("id",id)); 
		
		if ( products.isEmpty() ){
		  return null;
		}else { 
		  return products.get(0);
		} 
		
	}
	
	private static class ProductMapper implements ParameterizedRowMapper<Product> {
        public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
            Product prod = new Product();
            prod.setId(rs.getInt("id"));
            prod.setDescription(rs.getString("description"));
            prod.setPrice(new Double(rs.getDouble("price")));
            return prod;
        }
    }

}
