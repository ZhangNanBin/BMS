package web.bms.utility;

import java.util.Date;

public class Helper {
	public static boolean isNullOrEmpty(String str) {
		return str == null || "".equals(str);
	}

	public static int differenceDate(Date newDate, Date oldDate) {
		long newTime = newDate.getTime();
		long oldTime = oldDate.getTime();
		int days = (int) ((newTime - oldTime) / (1000 * 60 * 60 * 24));
		return days;
	}
}
