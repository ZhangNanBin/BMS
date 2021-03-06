package web.bms.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.bms.entity.BookCategory;
import web.bms.services.IBookCategoryService;
import web.bms.utility.Helper;
import web.bms.utility.Page;

@Controller
@RequestMapping("BookCategory")
public class BookCategoryController extends ControllerBase {
	private IBookCategoryService bookCategoryService;

	@Autowired
	public BookCategoryController(IBookCategoryService bookCategoryService) {
		this.bookCategoryService = bookCategoryService;
	}

	@ResponseBody
	@RequestMapping("getAll")
	public Map<String, Object> getAll(String number, String name, int pageNo, int pageSize) {
		Page page = new Page(pageNo, pageSize);
		List<BookCategory> bookCategories = bookCategoryService.getAll(page, number, name);
		int count = bookCategoryService.count(number, name);
		return Success(bookCategories, count);
	}

	@ResponseBody
	@RequestMapping("get")
	public Map<String, Object> get(@RequestParam("id") int id) {
		if (id <= 0) {
			return Error("Id不合法");
		}

		BookCategory bookCategory = bookCategoryService.get(id);
		return Success(bookCategory);
	}

	@ResponseBody
	@RequestMapping("create")
	public Map<String, Object> create(@RequestBody BookCategory bookCategory) {
		Map<String, Object> valid = validBookCategory(bookCategory);

		if (valid != null) {
			return valid;
		}

		bookCategoryService.create(bookCategory);
		return Success();
	}

	@ResponseBody
	@RequestMapping("update")
	public Map<String, Object> update(@RequestBody BookCategory bookCategory) {
		if (bookCategory.getId() == null || bookCategory.getId() <= 0) {
			return Error("Id不合法");
		}

		Map<String, Object> valid = validBookCategory(bookCategory);

		if (valid != null) {
			return valid;
		}

		BookCategory dbData = bookCategoryService.get(bookCategory.getId());

		if (dbData == null) {
			return Error("数据不存在");
		}

		bookCategoryService.update(bookCategory);
		return Success();
	}

	@ResponseBody
	@RequestMapping("delete")
	public Map<String, Object> delete(@RequestParam("id") int id) {
		if (id <= 0) {
			return Error("Id不合法");
		}
		
		BookCategory dbData = bookCategoryService.get(id);

		if (dbData == null) {
			return Error("数据不存在");
		}
		
		bookCategoryService.delete(id);
		return Success();
	}

	private Map<String, Object> validBookCategory(BookCategory bookCategory) {
		if (Helper.isNullOrEmpty(bookCategory.getNumber())) {
			return Error("编号不能为空");
		}

		if (Helper.isNullOrEmpty(bookCategory.getName())) {
			return Error("类别名称不能为空");
		}

		if (bookCategory.getBorrowableDays() <= 0) {
			return Error("可借天数不合法");
		}

		if (bookCategory.getFinesAmount() <= 0) {
			return Error("罚款金额不合法");
		}

		if (bookCategoryService.select(bookCategory) != null) {
			return Error("编号已存在");
		}

		return null;
	}
}
