package web.bms.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.bms.entity.BookCategory;
import web.bms.mappers.IBookCategoryMapper;
import web.bms.services.IBookCategoryService;
import web.bms.utility.Page;

@Service
public class BookCategoryServiceImpl implements IBookCategoryService{
	private IBookCategoryMapper bookCategoryMapper;

	@Autowired
	public BookCategoryServiceImpl(IBookCategoryMapper readerMapper) {
		this.bookCategoryMapper = readerMapper;
	}

	@Override
	public List<BookCategory> getAll(Page page, String number, String name) {
		return bookCategoryMapper.getAll(page, number, name);
	}

	@Override
	public int count(String number, String name) {
		return bookCategoryMapper.count(number, name);
	}

	@Override
	public BookCategory get(int id) {
		return bookCategoryMapper.get(id);
	}

	@Override
	public BookCategory select(BookCategory reader) {
		return bookCategoryMapper.select(reader);
	}

	@Override
	public void create(BookCategory reader) {
		bookCategoryMapper.create(reader);
	}

	@Override
	public void update(BookCategory reader) {
		bookCategoryMapper.update(reader);

	}

	@Override
	public void delete(int id) {
		bookCategoryMapper.delete(id);
	}
}