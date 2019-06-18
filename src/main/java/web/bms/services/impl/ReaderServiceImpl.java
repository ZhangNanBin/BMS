package web.bms.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.bms.entity.Reader;
import web.bms.mappers.IReaderMapper;
import web.bms.services.IReaderService;
import web.bms.utility.Page;

@Service
public class ReaderServiceImpl implements IReaderService {
	private IReaderMapper readerMapper;

	@Autowired
	public ReaderServiceImpl(IReaderMapper readerMapper) {
		this.readerMapper = readerMapper;
	}

	@Override
	public List<Reader> getAll(Page page, String number, String name) {
		return readerMapper.getAll(page, number, name);
	}

	@Override
	public int count(String number, String name) {
		return readerMapper.count(number, name);
	}

	@Override
	public Reader get(int id) {
		return readerMapper.get(id);
	}

	@Override
	public Reader get(String number) {
		return readerMapper.getByNumber(number);
	}

	@Override
	public Reader select(Reader reader) {
		return readerMapper.select(reader);
	}

	@Override
	public void create(Reader reader) {
		readerMapper.create(reader);
	}

	@Override
	public void update(Reader reader) {
		readerMapper.update(reader);

	}

	@Override
	public void delete(int id) {
		readerMapper.delete(id);
	}
}
