package web.bms.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.bms.entity.Book;
import web.bms.utility.Page;

public interface IBookMapper {
	public List<Book> getAll(@Param("page") Page page, @Param("barcode") String barcode,
			@Param("basicNumber") String basicNumber, @Param("state") Boolean state);

	public int count(@Param("barcode") String barcode, @Param("basicNumber") String basicNumber,
			@Param("state") Boolean state);

	public Book get(int id);

	public Book getByBarcode(String barcode);
	
	public Book select(Book book); // 查找出自己Id以外数据(按barcode筛选)

	public int create(Book book);

	public void update(Book book);

	public void updateState(@Param("barcode") String barcode, @Param("state") boolean state);

	public void delete(int id);
}
