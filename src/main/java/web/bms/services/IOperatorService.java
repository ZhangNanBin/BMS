package web.bms.services;

import java.util.List;

import web.bms.entity.Operator;

public interface IOperatorService {
	
	List<Operator> getAll();
	
	Operator get(int id);
	
	void create(Operator operator);

	void update(Operator operator);

	void delete(int id);
}
