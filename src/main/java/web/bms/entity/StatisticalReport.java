package web.bms.entity;

import java.util.List;

public class StatisticalReport {
	private List<StatisticalDTO> readers;
	private List<StatisticalDTO> basicInfoBooks;
	private Object other;

	public StatisticalReport(List<StatisticalDTO> readers, List<StatisticalDTO> basicInfoBooks) {
		this.readers = readers;
		this.basicInfoBooks = basicInfoBooks;
	}

	public StatisticalReport(List<StatisticalDTO> readers, List<StatisticalDTO> basicInfoBooks, Object other) {
		this(readers, basicInfoBooks);
		this.other = other;
	}

	public List<StatisticalDTO> getReaders() {
		return readers;
	}

	public void setReaders(List<StatisticalDTO> readers) {
		this.readers = readers;
	}

	public List<StatisticalDTO> getBasicInfoBooks() {
		return basicInfoBooks;
	}

	public void setBasicInfoBooks(List<StatisticalDTO> basicInfoBooks) {
		this.basicInfoBooks = basicInfoBooks;
	}

	public Object getOther() {
		return other;
	}

	public void setOther(Object other) {
		this.other = other;
	}
}
