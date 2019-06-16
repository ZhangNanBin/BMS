package web.bms.services;

import java.util.List;

import web.bms.entity.Operator;
import web.bms.utility.Page;

public interface IOperatorService {
	
	List<Operator> getAll();
	
	int count();
	
	List<Operator> getAll(Page page,String number,String name);

	int count(String number,String name);
	
	Operator get(int id);
	
	Operator select(Operator operator);
	
	void create(Operator operator);

	void update(Operator operator);

	void delete(int id);
}
