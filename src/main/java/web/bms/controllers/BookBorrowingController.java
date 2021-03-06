package web.bms.controllers;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.bms.entity.BasicInfoBook;
import web.bms.entity.Book;
import web.bms.entity.BookBorrowing;
import web.bms.entity.BookCategory;
import web.bms.entity.FineRecord;
import web.bms.entity.Reader;
import web.bms.entity.User;
import web.bms.services.IBasicInfoBookService;
import web.bms.services.IBookBorrowingService;
import web.bms.services.IBookCategoryService;
import web.bms.services.IBookService;
import web.bms.services.IReaderService;
import web.bms.services.ISecurityService;
import web.bms.utility.Helper;
import web.bms.utility.Page;

@Controller
@RequestMapping("BookBorrowing")
public class BookBorrowingController extends ControllerBase {
	private IBookBorrowingService bookBorrowingService;
	private IBookService bookService;
	private IReaderService readerService;
	private ISecurityService securityService;
	private IBasicInfoBookService basicInfoBookService;
	private IBookCategoryService bookCategoryService;

	@Autowired
	public BookBorrowingController(IBookBorrowingService bookBorrowingService, IBookService bookService,
			IReaderService readerService, ISecurityService securityService, IBasicInfoBookService basicInfoBookService,
			IBookCategoryService bookCategoryService) {
		this.bookBorrowingService = bookBorrowingService;
		this.bookService = bookService;
		this.readerService = readerService;
		this.securityService = securityService;
		this.basicInfoBookService = basicInfoBookService;
		this.bookCategoryService = bookCategoryService;
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
			return Error("Id?????????");
		}
		BookBorrowing bookBorrowing = bookBorrowingService.get(id);
		return Success(bookBorrowing);
	}

	@ResponseBody
	@RequestMapping("borrowing")
	public Map<String, Object> borrowing(HttpServletRequest request, @RequestBody BookBorrowing bookBorrowing) {
		if (Helper.isNullOrEmpty(bookBorrowing.getBookBarcode())) {
			return Error("???????????????????????????");
		}

		if (Helper.isNullOrEmpty(bookBorrowing.getReaderNumber())) {
			return Error("????????????????????????");
		}

		Book book = bookService.get(bookBorrowing.getBookBarcode());

		if (book == null) {
			return Error("??????????????????");
		}

		if (book.getState()) {
			return Error("???????????????????????????????????????");
		}

		Reader reader = readerService.get(bookBorrowing.getReaderNumber());

		if (reader == null) {
			return Error("??????????????????");
		}

		int count = bookBorrowingService.count("", bookBorrowing.getReaderNumber(), false, null);

		if (reader.getMaxNumber() <= count) {
			return Error("????????????????????????????????????");
		}

		int userType = (int) request.getSession().getAttribute("UserType");
		User user = securityService.getSession(request);

		if (!(userType == 0 && user != null)) {
			return Error("??????????????????");
		}

		bookBorrowing.setOperatorNumber(user.getNumber());
		bookBorrowing.setBorrowingDate(new Date());
		bookBorrowingService.create(bookBorrowing);
		bookService.updateState(bookBorrowing.getBookBarcode(), true);
		return Success();
	}

	@ResponseBody
	@RequestMapping("sendBack")
	public Map<String, Object> sendBack(String bookBarcode) {
		if (Helper.isNullOrEmpty(bookBarcode)) {
			return Error("???????????????????????????");
		}

		Book book = bookService.get(bookBarcode);

		if (book == null) {
			return Error("??????????????????");
		}

		BookBorrowing bookBorrowing = bookBorrowingService.select(bookBarcode, false);

		if (bookBorrowing == null) {
			return Error("?????????????????????????????????????????????");
		}

		BasicInfoBook basicInfoBook = basicInfoBookService.get(book.getBasicNumber());
		BookCategory bookCategory = bookCategoryService.get(basicInfoBook.getCategoryNumber());

		int days = Helper.differenceDate(new Date(), bookBorrowing.getBorrowingDate());
		double arrears = 0d;
		if (days > bookCategory.getBorrowableDays()) {
			arrears = (days - bookCategory.getBorrowableDays()) * bookCategory.getFinesAmount();
		}

		bookBorrowingService.sendBack(bookBarcode, new Date(), arrears);
		bookService.updateState(bookBarcode, false);
		return Success();
	}

	@ResponseBody
	@RequestMapping("getFineRecord")
	public Map<String, Object> getFineRecord(String readerNumber, String readerName, int pageNo, int pageSize) {
		Page page = new Page(pageNo, pageSize);
		List<FineRecord> fineRecords = bookBorrowingService.getFineRecord(page, readerNumber, readerName);

		int count = 0;
		if (fineRecords.size() > 0) {
			count = bookBorrowingService.fineCount(readerNumber, readerName);
		}
		
		return Success(fineRecords, count);
	}

	@ResponseBody
	@RequestMapping("repayment")
	public Map<String, Object> repayment(String readerNumber) {
		if (Helper.isNullOrEmpty(readerNumber)) {
			return Error("????????????????????????");
		}

		Reader reader = readerService.get(readerNumber);

		if (reader == null) {
			return Error("??????????????????");
		}

		bookBorrowingService.updatePaid(readerNumber);
		return Success();
	}
}
