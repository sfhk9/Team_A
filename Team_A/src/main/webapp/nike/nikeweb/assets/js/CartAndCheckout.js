
/* 숫자 자릿수 표기*/
function fn_comma(money){
	var str = String(money).split("").reverse();
	
	var tmp="";
	var cnt=0;
	for(var i=0;i<str.length;i++){
		cnt++;
		tmp=str[i]+tmp;
		if(cnt%3==0&&cnt!=str.length){
			tmp=","+tmp;
		}
	}
	
	return tmp;
}