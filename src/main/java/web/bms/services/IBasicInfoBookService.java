package web.bms.services;

import java.util.List;

import web.bms.entity.BasicInfoBook;
import web.bms.utility.Page;

public interface IBasicInfoBookService {
	public List<BasicInfoBook> getAll(Page page, String number, String name, String categoryNumber);

	public int count(String number, String name, String categoryNumber);

	public BasicInfoBook get(int id);
	
	public BasicInfoBook get(String number);

	public BasicInfoBook select(BasicInfoBook basicInfoBook);

	public void create(BasicInfoBook basicInfoBook);

	public void update(BasicInfoBook basicInfoBook);

	public void delete(int id);
	
	public void updateTotal(String number);
	
	public void updateSurplus(String number,int quantity);
}
