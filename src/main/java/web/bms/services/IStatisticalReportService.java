package web.bms.services;

import java.util.List;

import web.bms.entity.StatisticalDTO;

public interface IStatisticalReportService {
	public List<StatisticalDTO> readerRanking();

	public List<StatisticalDTO> basicInfoBookRanking();
}
