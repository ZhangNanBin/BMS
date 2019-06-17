package web.bms.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.bms.entity.BasicInfoBook;
import web.bms.services.IBasicInfoBookService;
import web.bms.services.IBookCategoryService;
import web.bms.utility.Helper;
import web.bms.utility.Page;

@Controller
@RequestMapping("BasicInfoBook")
public class BasicInfoBookController extends ControllerBase {
	private IBasicInfoBookService basicInfoBookService;
	private IBookCategoryService bookCategoryService;

	@Autowired
	public BasicInfoBookController(IBasicInfoBookService basicInfoBookService,
			IBookCategoryService bookCategoryService) {
		this.basicInfoBookService = basicInfoBookService;
		this.bookCategoryService = bookCategoryService;
	}

	@ResponseBody
	@RequestMapping("getAll")
	public String getAll(String number, String name, String categoryNumber, int pageNo, int pageSize) {
		Page page = new Page(pageNo, pageSize);
		List<BasicInfoBook> bookCategories = basicInfoBookService.getAll(page, number, name, categoryNumber);
		int count = basicInfoBookService.count(number, name, categoryNumber);
		return Success(bookCategories, count);
	}

	@ResponseBody
	@RequestMapping("get")
	public String get(@RequestParam("id") int id) {
		if (id <= 0) {
			return Error("Id不合法");
		}

		BasicInfoBook basicInfoBook = basicInfoBookService.get(id);
		return Success(basicInfoBook);
	}

	@ResponseBody
	@RequestMapping("create")
	public String create(@RequestBody BasicInfoBook basicInfoBook) {
		String valid = validBasicInfoBook(basicInfoBook);

		if (!Helper.isNullOrEmpty(valid)) {
			return valid;
		}

		basicInfoBookService.create(basicInfoBook);
		return Success();
	}

	@ResponseBody
	@RequestMapping("update")
	public String update(@RequestBody BasicInfoBook basicInfoBook) {
		if (basicInfoBook.getId() <= 0) {
			return Error("Id不合法");
		}

		String valid = validBasicInfoBook(basicInfoBook);

		if (!Helper.isNullOrEmpty(valid)) {
			return valid;
		}

		BasicInfoBook dbData = basicInfoBookService.get(basicInfoBook.getId());

		if (dbData == null) {
			return Error("数据不存在");
		}

		basicInfoBookService.update(basicInfoBook);
		return Success();
	}

	@ResponseBody
	@RequestMapping("delete")
	public String delete(@RequestParam("id") int id) {
		basicInfoBookService.delete(id);
		return Success();
	}

	private String validBasicInfoBook(BasicInfoBook basicInfoBook) {
		if (Helper.isNullOrEmpty(basicInfoBook.getNumber())) {
			return Error("编号不能为空");
		}

		if (Helper.isNullOrEmpty(basicInfoBook.getName())) {
			return Error("名称不能为空");
		}

		if (Helper.isNullOrEmpty(basicInfoBook.getCategoryNumber())) {
			return Error("类别编号不能为空");
		}
		
		if (bookCategoryService.get(basicInfoBook.getCategoryNumber()) == null) {
			return Error("类别编号不存在");
		}
		
		if(basicInfoBookService.select(basicInfoBook)!=null) {
			return Error("编号已存在");
		}

		return null;
	}
}
