package web.bms.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.bms.entity.Book;
import web.bms.services.IBasicInfoBookService;
import web.bms.services.IBookService;
import web.bms.utility.Helper;
import web.bms.utility.Page;

@Controller
@RequestMapping("Book")
public class BookController extends ControllerBase {
	private IBookService bookService;
	private IBasicInfoBookService basicInfoBookService;

	@Autowired
	public BookController(IBookService bookService, IBasicInfoBookService basicInfoBookService) {
		this.bookService = bookService;
		this.basicInfoBookService = basicInfoBookService;
	}

	@ResponseBody
	@RequestMapping("getAll")
	public Map<String, Object> getAll(String barcode, String basicNumber, Boolean state, int pageNo, int pageSize) {
		Page page = new Page(pageNo, pageSize);
		List<Book> books = bookService.getAll(page, barcode, basicNumber, state);
		int count = bookService.count(barcode, basicNumber, state);
		return Success(books, count);
	}

	@ResponseBody
	@RequestMapping("get")
	public Map<String, Object> get(@RequestParam("id") int id) {
		if (id <= 0) {
			return Error("Id不合法");
		}

		bookService.updateState("A100-01", false);
		;
		Book books = bookService.get(id);
		return Success(books);
	}

	@ResponseBody
	@RequestMapping("create")
	public Map<String, Object> create(@RequestBody Book book) {
		Map<String, Object> valid = validBook(book);

		if (valid != null) {
			return valid;
		}

		bookService.create(book);
		return Success();
	}

	@ResponseBody
	@RequestMapping("update")
	public Map<String, Object> update(@RequestBody Book book) {
		if (book.getId() == null || book.getId() <= 0) {
			return Error("Id不合法");
		}

		Map<String, Object> valid = validBook(book);

		if (valid != null) {
			return valid;
		}

		Book dbData = bookService.get(book.getId());

		if (dbData == null) {
			return Error("数据不存在");
		}

		bookService.update(book);
		return Success();
	}

	@ResponseBody
	@RequestMapping("delete")
	public Map<String, Object> delete(@RequestParam("id") int id) {
		if (id <= 0) {
			return Error("Id不合法");
		}

		Book dbData = bookService.get(id);

		if (dbData == null) {
			return Error("数据不存在");
		}

		bookService.delete(id);
		return Success();
	}

	private Map<String, Object> validBook(Book book) {
		if (Helper.isNullOrEmpty(book.getBarcode())) {
			return Error("图书条形码不能为空");
		}

		if (Helper.isNullOrEmpty(book.getBasicNumber())) {
			return Error("图书编号不能为空");
		}

		if (bookService.select(book) != null) {
			return Error("编号已存在");
		}

		if (basicInfoBookService.get(book.getBasicNumber()) == null) {
			return Error("图书编号不存在");
		}

		return null;
	}
}