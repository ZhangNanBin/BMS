package web.bms.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.bms.entity.Operator;
import web.bms.services.IOperatorService;
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
	public Map<String, Object> getAll(String number, String name, Boolean isAdmin, int pageNo, int pageSize) {
		Page page = new Page(pageNo, pageSize);
		List<Operator> operators = operatorService.getAll(page, number, name, isAdmin);
		int count = operatorService.count(number, name, isAdmin);
		return Success(operators, count);
	}

	@ResponseBody
	@RequestMapping("get")
	public Map<String, Object> get(@RequestParam("id") int id) {
		if (id <= 0) {
			return Error("Id不合法");
		}

		Operator operator = operatorService.get(id);
		return Success(operator);
	}

	@ResponseBody
	@RequestMapping("create")
	public Map<String, Object> create(@RequestBody Operator operator) {
		Map<String, Object> valid = userValid(operator);

		if (valid != null) {
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
	public Map<String, Object> update(@RequestBody Operator operator) {
		if (operator.getId() == null || operator.getId() <= 0) {
			return Error("Id不合法");
		}

		Map<String, Object> valid = userValid(operator);

		if (valid != null) {
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
	public Map<String, Object> delete(@RequestParam("id") int id) {
		if (id <= 0) {
			return Error("Id不合法");
		}

		Operator dbData = operatorService.get(id);

		if (dbData == null) {
			return Error("数据不存在");
		}

		operatorService.delete(id);
		return Success();
	}
}
