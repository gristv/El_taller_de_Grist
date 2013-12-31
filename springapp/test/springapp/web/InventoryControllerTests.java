package springapp.web;

import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import springapp.service.SimpleProductManager;
import springapp.web._InventoryController;
import junit.framework.TestCase;

public class InventoryControllerTests extends TestCase {

    public void testHandleRequestView() throws Exception{
    	 _InventoryController controller = new _InventoryController();
      //   controller.setProductManager(new SimpleProductManager());
         ModelAndView modelAndView = controller.handleRequest(null, null);
         assertEquals("hello", modelAndView.getViewName());
         assertNotNull(modelAndView.getModel());
         @SuppressWarnings("rawtypes")
		 Map modelMap = (Map) modelAndView.getModel().get("model");
         String nowValue = (String) modelMap.get("now");
         assertNotNull(nowValue);
    }
}