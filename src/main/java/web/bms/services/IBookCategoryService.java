package web.bms.services;

import java.util.List;

import web.bms.entity.BookCategory;
import web.bms.utility.Page;

public interface IBookCategoryService {
	public List<BookCategory> getAll(Page page, String number, String name);

	public int count(String number, String name);

	public BookCategory get(int id);
	
	public BookCategory get(String number);

	public BookCategory select(BookCategory bookCategory);

	public void create(BookCategory bookCategory);

	public void update(BookCategory bookCategory);

	public void delete(int id);
}