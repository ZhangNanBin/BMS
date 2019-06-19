package web.bms.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import web.bms.entity.StatisticalDTO;
import web.bms.entity.StatisticalReport;
import web.bms.services.IStatisticalReportService;

@Controller
@RequestMapping("StatisticalReport")
public class StatisticalReportController extends ControllerBase {
	private IStatisticalReportService statisticalReportService;

	@Autowired
	public StatisticalReportController(IStatisticalReportService statisticalReportService) {
		this.statisticalReportService = statisticalReportService;
	}

	@ResponseBody
	@RequestMapping("getStatisticalReport")
	public Map<String, Object> getStatisticalReport() {
		List<StatisticalDTO> readerStatisticalDTOs = statisticalReportService.readerRanking();
		List<StatisticalDTO> basicInfoBookStatisticalDTOs = statisticalReportService.basicInfoBookRanking();
		return Success(new StatisticalReport(readerStatisticalDTOs, basicInfoBookStatisticalDTOs));
	}
}
