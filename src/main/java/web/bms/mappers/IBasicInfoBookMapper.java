package web.bms.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.bms.entity.BasicInfoBook;
import web.bms.utility.Page;

public interface IBasicInfoBookMapper {
	public List<BasicInfoBook> getAll(@Param("page") Page page, @Param("number") String number,
			@Param("name") String name, @Param("categoryNumber") String categoryNumber);

	public int count(@Param("number") String number, @Param("name") String name,
			@Param("categoryNumber") String categoryNumber);

	public BasicInfoBook get(int id);

	public BasicInfoBook getByNumber(String number);

	public BasicInfoBook select(BasicInfoBook basicInfoBook);

	public int create(BasicInfoBook basicInfoBook);

	public void update(BasicInfoBook basicInfoBook);

	public void delete(int id);
	
	public void updateTotal(String number);
	
	public void updateBorrowed(@Param("number") String number,@Param("quantity") int quantity);
}
