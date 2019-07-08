/**
 * 2019.05.13 by KH
 */
function dateString(mSec) {
	var d = new Date(mSec); // mSec : 밀리세컨드
	var year = d.getFullYear(); // 년도
	var month = d.getMonth(); // 월
	var date = d.getDate(); // 일
	var hour = d.getHours(); // 시간
	var minute = d.getMinutes(); // 분
	var sec = d.getSeconds(); // 초
	
	return 	year + "-" + 
			make2Digits(month) + "-" + 
			make2Digits(date) + " " +
	        make2Digits(hour) + ":" + 
	        make2Digits(minute)
	        + ":" + make2Digits(sec);
	
}

function make2Digits(digit) {
	if (digit < 10) {
		return "0" + digit;
	} else {
		return digit;
	}
}

