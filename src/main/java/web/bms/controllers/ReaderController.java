package web.bms.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.bms.entity.Reader;
import web.bms.services.IReaderService;
import web.bms.utility.Helper;
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
	public String getAll(String number, String name, int pageNo, int pageSize) {
		Page page = new Page(pageNo, pageSize);
		List<Reader> readers = readerService.getAll(page, number, name);
		int count = readerService.count(number, name);
		return Success(readers, count);
	}

	@ResponseBody
	@RequestMapping("get")
	public String get(@RequestParam("id") int id) {
		if (id <= 0) {
			return Error("Id不合法");
		}

		Reader reader = readerService.get(id);
		return Success(reader);
	}

	@ResponseBody
	@RequestMapping("create")
	public String create(@RequestBody Reader reader) {
		String valid = userValid(reader);

		if (!Helper.isNullOrEmpty(valid)) {
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
	public String update(@RequestBody Reader reader) {
		if (reader.getId() <= 0) {
			return Error("Id不合法");
		}

		String valid = userValid(reader);

		if (!Helper.isNullOrEmpty(valid)) {
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
	public String delete(@RequestParam("id") int id) {
		readerService.delete(id);
		return Success();
	}
}
