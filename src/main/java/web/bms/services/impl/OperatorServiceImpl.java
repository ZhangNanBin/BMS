package web.bms.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.bms.entity.Operator;
import web.bms.mappers.IOperatorMapper;
import web.bms.services.IOperatorService;
import web.bms.utility.Page;

@Service
public class OperatorServiceImpl implements IOperatorService {
	private IOperatorMapper operatorMapper;

	@Autowired
	public OperatorServiceImpl(IOperatorMapper operatorMapper) {
		this.operatorMapper = operatorMapper;
	}

	@Override
	public List<Operator> getAll(Page page, String number, String name) {
		return operatorMapper.getAll(page, number, name);
	}

	@Override
	public int count(String number, String name) {
		return operatorMapper.count(number, name);
	}

	@Override
	public Operator get(int id) {
		return operatorMapper.get(id);
	}

	@Override
	public Operator select(Operator operator) {
		return operatorMapper.select(operator);
	}

	@Override
	public void create(Operator operator) {
		operatorMapper.create(operator);
	}

	@Override
	public void update(Operator operator) {
		operatorMapper.update(operator);
	}

	@Override
	public void delete(int id) {
		operatorMapper.delete(id);
	}
}
