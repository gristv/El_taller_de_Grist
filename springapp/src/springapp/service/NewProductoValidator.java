package springapp.service;

import org.apache.log4j.Logger;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class NewProductoValidator implements Validator{

	private int DEFAULT_MIN_PERCENTAGE = 0;
	/** Logger for this class and subclasses */
	static final Logger logger = Logger.getLogger(NewProductoValidator.class.getName());
	
	
	@Override
	public boolean supports(@SuppressWarnings("rawtypes") Class clazz) {
		// No tengo ni idea que hace esto
		return NewProducto.class.equals(clazz);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		NewProducto np = (NewProducto) obj;
		if (np == null) {
			errors.rejectValue("descripcion", "error.not-specified", null, "Value required.");
		}else {
			logger.info("Validating with " + np + ": " + np.getDescripcion() + " _ " + np.getPrecio());
			if (np.getPrecio() < DEFAULT_MIN_PERCENTAGE){
				errors.rejectValue("precio", "error.precio.too-low",
				new Object[] {new Integer(DEFAULT_MIN_PERCENTAGE)}, "Value too low.");
			}
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "descripcion", "error.required");
			
			ValidationUtils.rejectIfEmpty(errors, "precio", "error.required");
		}
		
	}

}
