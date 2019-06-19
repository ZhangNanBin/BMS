package web.bms.mappers;

import java.util.List;

import web.bms.entity.StatisticalDTO;

public interface IStatisticalReportMapper {
	public List<StatisticalDTO> readerRanking();

	public List<StatisticalDTO> basicInfoBookRanking();
}
