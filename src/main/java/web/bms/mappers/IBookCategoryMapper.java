package web.bms.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.bms.entity.BookCategory;
import web.bms.utility.Page;

public interface IBookCategoryMapper {
	public List<BookCategory> getAll(@Param("page") Page page, @Param("number") String number,
			@Param("name") String name);

	public int count(@Param("number") String number, @Param("name") String name);

	public BookCategory get(int id);
	
	public BookCategory getByNumber(String number);

	public BookCategory select(BookCategory bookCategory);

	public int create(BookCategory bookCategory);

	public void update(BookCategory bookCategory);

	public void delete(int id);
}