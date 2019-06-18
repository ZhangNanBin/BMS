package web.bms.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.bms.entity.BookBorrowing;
import web.bms.utility.Page;

public interface IBookBorrowingMapper {
	public List<BookBorrowing> getAll(@Param("page") Page page, @Param("bookBarcode") String bookBarcode,
			@Param("readerNumber") String readerNumber, @Param("sendBack") Boolean sendBack,
			@Param("paid") Boolean paid);

	public int count(@Param("bookBarcode") String bookBarcode, @Param("readerNumber") String readerNumber,
			@Param("sendBack") Boolean sendBack, @Param("paid") Boolean paid);

	public BookBorrowing get(int id);

	public void create(BookBorrowing bookBorrowing);
}
