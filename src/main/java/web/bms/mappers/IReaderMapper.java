package web.bms.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.bms.entity.Reader;
import web.bms.utility.Page;

public interface IReaderMapper {
	public List<Reader> getAll(@Param("page") Page page, @Param("number") String number, @Param("name") String name);

	public int count(@Param("number") String number, @Param("name") String name);

	public Reader get(int id);

	public Reader getByNumber(String number);

	public Reader select(Reader reader); // 查找出自己Id以外数据(按number、idNumber筛选)

	public int create(Reader reader);

	public void update(Reader reader);

	public void delete(int id);

}
