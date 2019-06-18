package web.bms.services;

import java.util.List;

import web.bms.entity.BookBorrowing;
import web.bms.utility.Page;

public interface IBookBorrowingService {
	public List<BookBorrowing> getAll(Page page,String bookBarcode, String readerNumber, Boolean sendBack, Boolean paid);

	public int count(String bookBarcode, String readerNumber, Boolean sendBack, Boolean paid);

	public BookBorrowing get(int id);

	public void create(BookBorrowing bookBorrowing);
}
