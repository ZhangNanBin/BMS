package web.bms.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.bms.entity.Operator;
import web.bms.services.IOperatorService;
import web.bms.utility.Helper;
import web.bms.utility.Page;

// 告诉spring mvc这是一个控制器类
@Controller
@RequestMapping("Operator")
public class OperatorController extends ControllerBase {
	private IOperatorService operatorService;

	@Autowired
	public OperatorController(IOperatorService operatorService) {
		this.operatorService = operatorService;
	}

	@ResponseBody
	@RequestMapping("getAll")
	public String getAll(String number, String name, int pageNo, int pageSize) {
		Page page = new Page(pageNo, pageSize);
		List<Operator> operators = operatorService.getAll(page, number, name);
		int count = operatorService.count(number, name);
		return Success(operators, count);
	}

	@ResponseBody
	@RequestMapping("get")
	public String get(@RequestParam("id") int id) {
		if (id <= 0) {
			return Error("Id不合法");
		}

		Operator operator = operatorService.get(id);
		return Success(operator);
	}

	@ResponseBody
	@RequestMapping("create")
	public String create(@RequestBody Operator operator) {
		String valid = userValid(operator);

		if (!Helper.isNullOrEmpty(valid)) {
			return valid;
		}

		if (operatorService.select(operator) != null) {
			return Error("编号已存在");
		}

		operatorService.create(operator);
		return Success();
	}

	@ResponseBody
	@RequestMapping("update")
	public String update(@RequestBody Operator operator) {
		if (operator.getId() <= 0) {
			return Error("Id不合法");
		}

		String valid = userValid(operator);

		if (!Helper.isNullOrEmpty(valid)) {
			return valid;
		}

		if (operatorService.select(operator) != null) {
			return Error("编号已存在");
		}
		
		Operator dbData = operatorService.get(operator.getId());

		if (dbData == null) {
			return Error("数据不存在");
		}

		operatorService.update(operator);
		return Success();
	}

	@ResponseBody
	@RequestMapping("delete")
	public String delete(@RequestParam("id") int id) {
		operatorService.delete(id);
		return Success();
	}
}
