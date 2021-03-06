package web.bms.mappers;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.bms.entity.BookBorrowing;
import web.bms.entity.FineRecord;
import web.bms.utility.Page;

public interface IBookBorrowingMapper {
	public List<BookBorrowing> getAll(@Param("page") Page page, @Param("bookBarcode") String bookBarcode,
			@Param("readerNumber") String readerNumber, @Param("sendBack") Boolean sendBack,
			@Param("paid") Boolean paid);

	public int count(@Param("bookBarcode") String bookBarcode, @Param("readerNumber") String readerNumber,
			@Param("sendBack") Boolean sendBack, @Param("paid") Boolean paid);

	public BookBorrowing get(int id);

	public BookBorrowing select(@Param("bookBarcode") String bookBarcode, @Param("sendBack") boolean sendBack);

	public void create(BookBorrowing bookBorrowing);

	public void sendBack(@Param("bookBarcode") String bookBarcode, @Param("returnDate") Date returnDate,
			@Param("arrears") double arrears);

	public List<FineRecord> getFineRecord(@Param("page") Page page, @Param("readerNumber") String readerNumber,
			@Param("readerName") String readerName);

	public int fineCount(@Param("readerNumber") String readerNumber, @Param("readerName") String readerName);

	public void updatePaid(String readerNumber);
}
