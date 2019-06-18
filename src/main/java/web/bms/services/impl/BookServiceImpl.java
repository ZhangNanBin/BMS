package web.bms.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import web.bms.entity.Book;
import web.bms.mappers.IBookMapper;
import web.bms.services.IBookService;
import web.bms.utility.Page;

@Service
public class BookServiceImpl implements IBookService {
	private IBookMapper bookMapper;

	@Autowired
	public BookServiceImpl(IBookMapper bookMapper) {
		this.bookMapper = bookMapper;
	}

	@Override
	public List<Book> getAll(Page page, String barcode, String basicNumber, Boolean state) {
		return bookMapper.getAll(page, barcode, basicNumber, state);
	}

	@Override
	public int count(String barcode, String basicNumber, Boolean state) {
		return bookMapper.count(barcode, basicNumber, state);
	}

	@Override
	public Book get(int id) {
		return bookMapper.get(id);
	}
	
	@Validated
	public Book get(String barcode) {
		return bookMapper.getByBarcode(barcode);
	}

	@Override
	public Book select(Book book) {
		return bookMapper.select(book);
	}

	@Override
	public int create(Book book) {
		return bookMapper.create(book);
	}

	@Override
	public void update(Book book) {
		bookMapper.update(book);
	}

	@Override
	public void updateState(String barcode, boolean state) {
		bookMapper.updateState(barcode, state);
	}

	@Override
	public void delete(int id) {
		bookMapper.delete(id);
	}

}
