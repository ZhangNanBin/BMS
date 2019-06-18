package web.bms.services.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.bms.entity.BookBorrowing;
import web.bms.mappers.IBookBorrowingMapper;
import web.bms.services.IBookBorrowingService;
import web.bms.utility.Page;

@Service
public class BookBorrowingServiceImpl implements IBookBorrowingService {
	private IBookBorrowingMapper bookBorrowingMapper;

	@Autowired
	public BookBorrowingServiceImpl(IBookBorrowingMapper bookBorrowingMapper) {
		this.bookBorrowingMapper = bookBorrowingMapper;
	}

	@Override
	public List<BookBorrowing> getAll(Page page, String bookBarcode, String readerNumber, Boolean sendBack,
			Boolean paid) {
		return bookBorrowingMapper.getAll(page, bookBarcode, readerNumber, sendBack, paid);
	}

	@Override
	public int count(String bookBarcode, String readerNumber, Boolean sendBack, Boolean paid) {
		return bookBorrowingMapper.count(bookBarcode, readerNumber, sendBack, paid);
	}

	@Override
	public void create(BookBorrowing bookBorrowing) {
		bookBorrowingMapper.create(bookBorrowing);
	}

	@Override
	public BookBorrowing get(int id) {
		return bookBorrowingMapper.get(id);
	}

	@Override
	public BookBorrowing select(String barcode, boolean sendBack) {
		return bookBorrowingMapper.select(barcode, sendBack);
	}

	@Override
	public void sendBack(String barcode, Date returnDate, double arrears) {
		bookBorrowingMapper.sendBack(barcode, returnDate, arrears);
	}
}
