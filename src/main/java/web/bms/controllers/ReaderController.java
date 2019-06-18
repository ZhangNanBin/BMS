package web.bms.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.bms.entity.Reader;
import web.bms.services.IReaderService;
import web.bms.utility.Page;

@Controller
@RequestMapping("Reader")
public class ReaderController extends ControllerBase {
	private IReaderService readerService;

	@Autowired
	public ReaderController(IReaderService readerService) {
		this.readerService = readerService;
	}

	@ResponseBody
	@RequestMapping("getAll")
	public Map<String, Object> getAll(String number, String name, int pageNo, int pageSize) {
		Page page = new Page(pageNo, pageSize);
		List<Reader> readers = readerService.getAll(page, number, name);
		int count = readerService.count(number, name);
		return Success(readers, count);
	}

	@ResponseBody
	@RequestMapping("get")
	public Map<String, Object> get(@RequestParam("id") int id) {
		if (id <= 0) {
			return Error("Id不合法");
		}

		Reader reader = readerService.get(id);
		return Success(reader);
	}

	@ResponseBody
	@RequestMapping("create")
	public Map<String, Object> create(@RequestBody Reader reader) {
		Map<String, Object> valid = userValid(reader);

		if (valid != null) {
			return valid;
		}

		if (reader.getMaxNumber() <= 0) {
			return Error("最大借书数量不合法");
		}

		if (readerService.select(reader) != null) {
			return Error("编号已存在");
		}

		readerService.create(reader);
		return Success();
	}

	@ResponseBody
	@RequestMapping("update")
	public Map<String, Object> update(@RequestBody Reader reader) {
		if (reader.getId() == null || reader.getId() <= 0) {
			return Error("Id不合法");
		}

		Map<String, Object> valid = userValid(reader);

		if (valid != null) {
			return valid;
		}

		if (reader.getMaxNumber() <= 0) {
			return Error("最大借书数量不合法");
		}

		if (readerService.select(reader) != null) {
			return Error("编号已存在");
		}

		Reader dbData = readerService.get(reader.getId());

		if (dbData == null) {
			return Error("数据不存在");
		}

		readerService.update(reader);
		return Success();
	}

	@ResponseBody
	@RequestMapping("delete")
	public Map<String, Object> delete(@RequestParam("id") int id) {
		if (id <= 0) {
			return Error("Id不合法");
		}

		Reader dbData = readerService.get(id);

		if (dbData == null) {
			return Error("数据不存在");
		}
		readerService.delete(id);
		return Success();
	}
}
