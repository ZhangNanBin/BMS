package web.bms.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.bms.entity.Operator;
import web.bms.mappers.IOperatorMapper;
import web.bms.services.IOperatorService;

@Service
public class OperatorServiceImpl  implements IOperatorService{
	@Autowired
	IOperatorMapper operatorMapper;
	
	
	@Override
	public List<Operator> getAll(){
		return operatorMapper.getAll();
	}


	@Override
	public Operator get(int id) {
		return operatorMapper.get(id);
	}


	@Override
	public void update(Operator operator) {
		operatorMapper.update(operator);
	}


	@Override
	public void delete(int id) {
		operatorMapper.delete(id);
	}

	@Override
	public void create(Operator operator) {
		operatorMapper.create(operator);
	}
}
