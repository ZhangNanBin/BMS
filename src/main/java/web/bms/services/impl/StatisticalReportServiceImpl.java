package web.bms.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.bms.entity.StatisticalDTO;
import web.bms.mappers.IStatisticalReportMapper;
import web.bms.services.IStatisticalReportService;

@Service
public class StatisticalReportServiceImpl implements IStatisticalReportService {
	private IStatisticalReportMapper statisticalReportMapper;

	@Autowired
	public StatisticalReportServiceImpl(IStatisticalReportMapper statisticalReportMapper) {
		this.statisticalReportMapper = statisticalReportMapper;
	}

	@Override
	public List<StatisticalDTO> readerRanking() {
		return statisticalReportMapper.readerRanking();
	}

	@Override
	public List<StatisticalDTO> basicInfoBookRanking() {
		return statisticalReportMapper.basicInfoBookRanking();
	}

}
