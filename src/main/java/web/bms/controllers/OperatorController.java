package web.bms.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import web.bms.entity.Operator;
import web.bms.services.IOperatorService;

// 告诉spring mvc这是一个控制器类
@Controller
@RequestMapping("Operator")
public class OperatorController extends ControllerBase {
	@Autowired
	IOperatorService operatorService;
	
    @ResponseBody
    @RequestMapping("/getAll")
    public String getAll() {
		List<Operator> operators= operatorService.getAll();
		return Success(operators);
    }
    
    @ResponseBody
    @RequestMapping("/get")
    public String get(int id) {
		Operator operator= operatorService.get(id);
		return Success(operator);
    }
}
