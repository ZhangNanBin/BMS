package web.bms.services;

import java.util.List;

import web.bms.entity.Reader;
import web.bms.utility.Page;

public interface IReaderService {
	List<Reader> getAll();

	int count();

	List<Reader> getAll(Page page, String number, String name);

	int count(String number, String name);

	Reader get(int id);

	Reader select(Reader reader);

	void create(Reader reader);

	void update(Reader reader);

	void delete(int id);
}
