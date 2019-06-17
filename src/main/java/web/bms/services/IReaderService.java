package web.bms.services;

import java.util.List;

import web.bms.entity.Reader;
import web.bms.utility.Page;

public interface IReaderService {
	public List<Reader> getAll(Page page, String number, String name);

	public int count(String number, String name);

	public Reader get(int id);

	public Reader select(Reader reader);

	public void create(Reader reader);

	public void update(Reader reader);

	public void delete(int id);
}