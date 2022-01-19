function fn_count(e,cnt){
	var content=e.val();
	if (content.length > cnt){
        alert("최대 "+cnt+"자까지 입력 가능합니다.");
        e.val(content.substring(0, cnt));
        
		if(e==$("#messaage")){	
			$('#message_label').html("("+cnt+" / "+cnt+")");	
		}
 	}
}

$(function(){
	// 가져오기
	$("#btn_import").click(function(){
		fn_import();
	});
	
	// message 글자 수 검사
	$("#message").keyup(function(){
		var content = $(this).val();
		$("#message_label").html("("+content.length+" / 3000)");
		
		fn_count($("#message"),3000);
	});
		
	// 주문 접수
	$("#btn_save").click(function(){
		var pattern="";
		
		/* 이름 유효성 검사 */
		if($("#name").val()==""){
			alert("이름을 입력해주세요");
			$("#name").focus();
			return false;
		}
				
		/* 우편번호 유효성 검사 */
		if($("#zipcode").val()==""){
			alert("우편번호를 검색해주세요");
			$("#zipcode").focus();
			return false;
		}
		
		/* 주소 유효성 검사 */
		if($("#addr1").val()==""){
			alert("주소를 검색해주세요");
			$("#address1").focus();
			return false;
		}
		
		/* 휴대폰 번호 유효성 검사 */
		if($("#phone").val()==""){
			alert("휴대폰 번호를 입력해주세요");
			$("#phone").focus();
			return false;
		}
		
		pattern=RegExp(/01[016789][^0][0-9]{2,3}[0-9]{3,4}/);
		if(!pattern.test($("#phone").val())){
			alert("올바른 휴대폰 번호를 입력해주세요");
			return false;
		}

		
		/* 이메일 유효성 검사 */
		if($("#email").val()==""){
			alert("이메일을 입력해 주세요");
			$("#email").focus();
			return false;
		}
		
		pattern=RegExp(/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/);
		if(!pattern.test($("#email").val())){
			alert($("#email").val());
			alert("올바른 이메일 주소를 입력해주세요");
			return false;
		}
		
		/* message 글자수 검사 */
		fn_count($("#message"),3000);
		
		// detailAddr + extraAddr => address2
		var addr2=$("#detailAddr").val();
		if($("#extraAddr").val()!=""){
			addr2+=" "+$("#extraAddr").val();
		}
		$("#address2").val(addr2);	
		
		var formdata = $("#frm").serialize();
		
		$.ajax({
			type:"post",
			url:"checkoutSave.do",
			data:formdata,
			
			datatype:"text",
			success : function(data){
				if(data=="ok"){
					alert("주문이 접수되었습니다.\n 결제가 확인되면 배송이 진행됩니다.");
					location.href="/orderList.do";
				} else if(data=="er1"){
					alert("오류 : 장바구니 목록 삭제 오류");
				} else if(data=="er2"){
					alert("오류 : 주문 접수 오류");
				} else if(data=="er3"){
					alert("오류 : 주문 접수 및 장바구니 목록 삭제 오류");
				} else {
					alert("저장 오류");
				}
			},
			error:function(){
				alert("오류 발생");
			}
		});
	});
});