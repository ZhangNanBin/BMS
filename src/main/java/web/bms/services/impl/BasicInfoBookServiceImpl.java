package web.bms.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.bms.entity.BasicInfoBook;
import web.bms.mappers.IBasicInfoBookMapper;
import web.bms.services.IBasicInfoBookService;
import web.bms.utility.Page;

@Service
public class BasicInfoBookServiceImpl implements IBasicInfoBookService {
	private IBasicInfoBookMapper basicInfoBookMapper;

	@Autowired
	public BasicInfoBookServiceImpl(IBasicInfoBookMapper basicInfoBookMapper) {
		this.basicInfoBookMapper = basicInfoBookMapper;
	}

	@Override
	public List<BasicInfoBook> getAll(Page page, String number, String name, String categoryNumber) {
		return basicInfoBookMapper.getAll(page, number, name, categoryNumber);
	}

	@Override
	public int count(String number, String name, String categoryNumber) {
		return basicInfoBookMapper.count(number, name, categoryNumber);
	}

	@Override
	public BasicInfoBook get(int id) {
		return basicInfoBookMapper.get(id);
	}
	
	@Override
	public BasicInfoBook get(String number) {
		return basicInfoBookMapper.getByNumber(number);
	}

	@Override
	public BasicInfoBook select(BasicInfoBook basicInfoBook) {
		return basicInfoBookMapper.select(basicInfoBook);
	}

	@Override
	public void create(BasicInfoBook basicInfoBook) {
		basicInfoBookMapper.create(basicInfoBook);

	}

	@Override
	public void update(BasicInfoBook basicInfoBook) {
		basicInfoBookMapper.update(basicInfoBook);
	}

	@Override
	public void delete(int id) {
		basicInfoBookMapper.delete(id);
	}

	@Override
	public void updateTotal(String number) {
		basicInfoBookMapper.updateTotal(number);
	}

	@Override
	public void updateBorrowed(String number, int quantity) {
		basicInfoBookMapper.updateBorrowed(number, quantity);
	}
}