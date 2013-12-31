package springapp.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
public class EnlacesController extends MultiActionController  {
	
	static Logger logger = Logger.getLogger(EnlacesController.class.getName());
	
	public ModelAndView enlaces(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	 	logger.info("Pasaamos el control a la página enlaces");
        return new ModelAndView("enlaces","","");
    }
	public ModelAndView diferencias(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	 	logger.info("Pasamos el control a la página diferencias");
        return new ModelAndView("diferencias","","");
    }
}
