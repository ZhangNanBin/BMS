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
import web.bms.entity.BookBorrowing;
import web.bms.entity.Reader;
import web.bms.services.IBookBorrowingService;
import web.bms.services.IBookService;
import web.bms.services.IReaderService;
import web.bms.utility.Helper;
import web.bms.utility.Page;

@Controller
@RequestMapping("BookBorrowing")
public class BookBorrowingController extends ControllerBase {
	private IBookBorrowingService bookBorrowingService;
	private IBookService bookService;
	private IReaderService readerService;

	@Autowired
	public BookBorrowingController(IBookBorrowingService bookBorrowingService, IBookService bookService,
			IReaderService readerService) {
		this.bookBorrowingService = bookBorrowingService;
		this.bookService = bookService;
		this.readerService = readerService;
	}

	@ResponseBody
	@RequestMapping("getAll")
	public Map<String, Object> getAll(String bookBarcode, String readerNumber, Boolean sendBack, Boolean paid,
			int pageNo, int pageSize) {
		Page page = new Page(pageNo, pageSize);
		List<BookBorrowing> bookBorrowings = bookBorrowingService.getAll(page, bookBarcode, readerNumber, sendBack,
				paid);
		int conut = bookBorrowingService.count(bookBarcode, readerNumber, sendBack, paid);
		return Success(bookBorrowings, conut);
	}

	@ResponseBody
	@RequestMapping("get")
	public Map<String, Object> get(@RequestParam("id") int id) {
		if (id <= 0) {
			return Error("Id不合法");
		}
		BookBorrowing bookBorrowing = bookBorrowingService.get(id);
		return Success(bookBorrowing);
	}

	@ResponseBody
	@RequestMapping("create")
	public Map<String, Object> create(@RequestBody BookBorrowing bookBorrowing) {
		if (Helper.isNullOrEmpty(bookBorrowing.getBookBarCodeString())) {
			return Error("图书条形码不能为空");
		}

		if (Helper.isNullOrEmpty(bookBorrowing.getReaderNumber())) {
			return Error("读者编号不能为空");
		}

		Book book = bookService.get(bookBorrowing.getBookBarCodeString());

		if (book == null) {
			return Error("该图书不存在");
		}

		if (book.getState()) {
			return Error("该书外借中，不允许再次外借");
		}

		Reader reader = readerService.get(bookBorrowing.getReaderNumber());

		if (reader == null) {
			return Error("读者不存在");
		}

		int count = bookBorrowingService.count(null, bookBorrowing.getReaderNumber(), false, null);

		if (reader.getMaxNumber() <= count) {
			return Error("当前读者已到达最大借书量");
		}
		
		bookBorrowingService.create(bookBorrowing);
		return Success();
	}
}
