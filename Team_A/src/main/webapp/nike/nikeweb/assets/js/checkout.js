$(function(){
	$("#btn_save").click(function(){
		
		var formdata = $("#frm").serialize();
		
		$.ajax({
			type:"post",
			url:"checkoutSave.do",
			data:formdata,
			
			datatype:"text",
			success : function(data){
				if(data=="ok"){
					alert("주문이 접수되었습니다.\n 결제가 확인되면 배송이 진행됩니다.");
					location.href="/main.do";
				} else{
					
				}
			},
			error:function(){
				alert("오류 발생");
			}
		});
	});
});