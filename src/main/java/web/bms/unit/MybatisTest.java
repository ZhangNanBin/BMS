package web.bms.unit;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.github.pagehelper.PageInfo;

import web.bms.entity.Operator;
import web.bms.mappers.IOperatorMapper;
import web.bms.utility.Page;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class MybatisTest {

	@Autowired
	private IOperatorMapper operatorMapper;

	@Test
	public void testList() {
		Page page = new Page(1, 10);
		List<Operator> cs = operatorMapper.getAll(page, null, null,null);
		System.out.println(cs.getClass());
		for (Operator c : cs) {
			System.out.println(c.getName());
		}
		System.out.println(new PageInfo<Operator>(cs).getTotal());
	}

}
