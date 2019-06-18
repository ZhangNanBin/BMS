package web.bms.services;

import java.util.List;

import web.bms.entity.Book;
import web.bms.utility.Page;

public interface IBookService {
	public List<Book> getAll(Page page, String barcode, String basicNumber, Boolean state);

	public int count(String barcode, String basicNumber, Boolean state);

	public Book get(int id);

	public Book get(String barcode);
	
	public Book select(Book book);

	public int create(Book book);

	public void update(Book book);

	public void updateState(String barcode, boolean state);

	public void delete(int id);
}
