package web.bms.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.bms.entity.Operator;
import web.bms.utility.Page;

public interface IOperatorMapper {
	public List<Operator> getAll(@Param("page") Page page, @Param("number") String number, @Param("name") String name,
			@Param("isAdmin") Boolean isAdmin);

	public int count(@Param("number") String number, @Param("name") String name, @Param("isAdmin") Boolean isAdmin);

	public Operator get(int id);

	public Operator select(Operator operator); // 查找出自己Id以外数据(按number、idNumber筛选)

	public int create(Operator operator);

	public void update(Operator operator);

	public void delete(int id);
}