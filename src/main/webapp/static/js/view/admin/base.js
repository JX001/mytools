//修改——转换日期格式(时间戳转换为datetime格式)
function changeDateFormat(cellval) {
	if (cellval != null) {
		var d = new Date(cellval);
		var times = d.getFullYear() + '-' + (d.getMonth() + 1) + '-'
				+ d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':'
				+ d.getSeconds();
		return times;
	} else {
		return cellval;
	}
}
function idFormatter(value, row, index){
	//alert(row.page);
    return index+1;
}
$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};