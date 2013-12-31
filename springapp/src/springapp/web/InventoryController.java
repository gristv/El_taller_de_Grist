package springapp.web;

import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import springapp.domain.Product;
import springapp.service.NewProducto;
import springapp.service.NewProductoValidator;
import springapp.service.ProductManager;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


/**
 * @author Daniel
 * 
 * En Spring Web MVC, Controller maneja las solicitudes y devuelve un objeto ModelAndView - en este caso, 
 * uno llamado 'hello.jsp' el cual es ademas el nombre del archivo JSP que vamos a crear a continuacion. El 
 * modelo que esta clase devuelve es resuelto via ViewResolver. Puesto que no hemos definido explicitamente 
 * un ViewResolver, vamos a obtener uno por defecto de Spring que simplemente redigira a una direccion URL 
 * que coincida con el nombre de la vista especificada. Mas tarde modificaremos esto. 
 * Ademas, hemos especificado un logger de manera que podemos verificar que pasamos por el manejador en cada 
 * momento. Usando Tomcat, estos mensajes de log deben mostrarse en el arhivo de log 'catalina.out' que puede 
 * ser encontrado en el directorio '${appserver.home}/log' de tu instalacion de Tomcat. 
 * 
 * */

public class InventoryController extends MultiActionController {
	
	static final Logger logger = Logger.getLogger(InventoryController.class.getName());
    private ProductManager productManager; 
    public BindingResult errors;
    
    @Override
    protected void bind(HttpServletRequest request, Object command)
    		throws Exception {
    		/**
    		 * Pasamos los datos del  formulario (representado por 'command', nombre por defecto si no hemos dado commandName en el formulario)
    		 * al request del controller.  
    		 */
    		ServletRequestDataBinder binder = createBinder(request,command);
    		binder.bind(request);
    		errors = binder.getBindingResult();    		
    }
    
    public ModelAndView hello(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {	
        String now = (new Date()).toString();
        Map<String, Object> myModel = new HashMap<String, Object>();
        myModel.put("now", now);
        myModel.put("products", this.productManager.getProducts());
        logger.info("Returning hello view with " + now);
        return new ModelAndView("hello", "model", myModel);
    }
    
    public ModelAndView cargaProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	try{
    	/** Recuperamos el id del registro que queremos recuperar*/
	    int rowId = ServletRequestUtils.getIntParameter(request, "secretValue");
	    /** Load the record based on the rowId paramrter, using your DAO*/
	    Product product = productManager.getProduct(rowId);
	    /** Creamos un modelo nuevo con para la vista,saveproduct, que carga el producto*/
	    ModelAndView mv=new ModelAndView("saveproduct");
	    NewProducto command = (NewProducto)newCommandObject(NewProducto.class);
	    /** Añadimos el producto recuperado al modelo*/
	    //NewProducto producto = new NewProducto();
	    command.setId(product.getId());
	    command.setDescripcion(product.getDescription());
	    command.setPrecio(product.getPrice());
	    mv.addObject("command",command);
	    logger.info("Returning saveproduct view: "+product.getDescription()+" "+product.getPrice());
	    /** Retornamos a la vista*/
	    return mv;
    	}catch (Exception e){
    		logger.info(e);
    		return new ModelAndView("hello");
    	}
    }
    
    public ModelAndView cargaNewProducto(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException,IOException,Exception{
	    logger.info("Returning newproduct view.");
	    /** Creamos un nuevo modelo y creammos un objeto 'command' que representa el formulario que pintamos en esa página */
	    return new ModelAndView("newproduct", "command", newCommandObject(NewProducto.class));
    }
    
    public ModelAndView saveProduct(HttpServletRequest request, HttpServletResponse response,NewProducto producto)
    		throws ServletException,IOException{
    	validate(producto);
    	if(errors.hasErrors()){
    		logger.debug("Error Handling : "+errors.getFieldErrors());
			return new ModelAndView("saveproduct", errors.getModel());
    	}
    	int id = ((NewProducto)producto).getId();
    	String descripcion = ((NewProducto)producto).getDescripcion();
		double precio = ((NewProducto)producto).getPrecio();
		Product productoDao = new Product();
		productoDao.setId(id);
		productoDao.setDescription(descripcion);
		productoDao.setPrice(precio);
		productManager.saveProduct(productoDao);
		logger.info("returning from SaveProductoView to hello.htm");
		return new ModelAndView(new RedirectView("hello.htm"));
    }    
    
    public ModelAndView saveNewProduct(HttpServletRequest request, HttpServletResponse response, NewProducto newProduct)
    		throws ServletException,IOException{
    	try {
    		validate(newProduct);
    		if (errors.hasErrors()) {
    			logger.debug("Error Handling : "+errors.getFieldErrors());
    			return new ModelAndView("newproduct", errors.getModel());
	    	}
	    	String descripcion = ((NewProducto)newProduct).getDescripcion();
			double precio = ((NewProducto)newProduct).getPrecio();
			Product producto = new Product();
			producto.setDescription(descripcion);
			producto.setPrice(precio);
			productManager.crearProduco(producto);
			logger.info("Returning from NewProductoView to hello.htm");
			return new ModelAndView(new RedirectView("hello.htm"));
    	} catch (Exception expObj) {
			logger.info(expObj);
			return new ModelAndView("newproduct");
		}
    }    
    
    public void validate(Object command) {
    	Validator[] validators = getValidators();
    	if (validators != null) {
    		for(int index = 0; index < validators.length;index++) {
    			Validator validator = validators[index];
    			if(validator instanceof NewProductoValidator) {
    				if(((NewProductoValidator)validator).supports(command.getClass())) {
    					ValidationUtils.invokeValidator(validators[index],command,errors);
    				}
    			} else if (validator.supports(command.getClass())) {
    					ValidationUtils.invokeValidator(validators[index], command,errors);
    			}
    		}
    	}
    }
    
    public void setProductManager(ProductManager productManager) {
        this.productManager = productManager;
    }

	public BindingResult getErrors() {
		return errors;
	}

	public void setErrors(BindingResult errors) {
		this.errors = errors;
	}
}