$(function(){
	$("#btn_delete").click(function(){
		
		if(!confirm("정말 삭제하시겠습니까?(취소 불가)")) return false;
		var formData=$("#frm").serialize();
		$.ajax({
			type: "POST",
			url: "adminDeleteGoodsInfo.do" ,
			data: formData, 
			datatype : "text",
			success: function(data) { 
				if(data=="ok"){
					alert("삭제 완료");
					location.href="adminList.do";
				} else {
					alert("삭제 실패");
				}	
			}, 
			error: function() {
				alert("오류 발생");
			}
		});
	});
});