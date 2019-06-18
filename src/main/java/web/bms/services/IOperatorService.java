package web.bms.services;

import java.util.List;

import web.bms.entity.Operator;
import web.bms.utility.Page;

public interface IOperatorService {
	public List<Operator> getAll(Page page, String number, String name, Boolean isAdmin);

	public int count(String number, String name, Boolean isAdmin);

	public Operator get(int id);

	public Operator select(Operator operator);

	public void create(Operator operator);

	public void update(Operator operator);

	public void delete(int id);
}