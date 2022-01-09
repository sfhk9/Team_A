function fn_size(){
	var category = $("#category").val();

	/*옷 사이즈 옵션들*/
	var cls= "<input type='checkbox' name='csize' value='100' style='width:15px; height:15px;'> 100 "
			+"<input type='checkbox' name='csize' value='150' style='width:15px; height:15px;'> 150 "
			+"<input type='checkbox' name='csize' value='200' style='width:15px; height:15px;'> 200 "
			+"<input type='checkbox' name='csize' value='' style='width:15px; height:15px;'>";
	
	/*신발 사이즈 옵션들*/
	/*반복문으로 만들 수 있음*/
	var sho = "<input type='checkbox' name='csize' value='100' style='width:15px; height:15px;'> 240 "
			 +"<input type='checkbox' name='csize' value='150' style='width:15px; height:15px;'> 250 "
			 +"<input type='checkbox' name='csize' value='200' style='width:15px; height:15px;'> 260 ";
	
	if(category=="CLS"){
		$("#sizeDiv").html(cls);	
	} else if(category=="SHO"){
		$("#sizeDiv").html(sho);
	} else {
		$("#sizeDiv").html("카테고리를 선택해주세요");
	}
}

function fn_thumbnail(){
	var str="";
	var input=document.querySelector('input');
	var files=$("#thumbnail").get(0).files[1];
	alert(files.find("name"));
	//alert(files.get("name"));
//	for(var file of files){
	//	alert(files);
		//alert($("#thumbnail").eq(i).val());
		//str+=
	//}
	// $("#tetest").html();
}

$( function() {
	$("#btn_save").click(function(){
		/*
		// 상품명 유효성 검사
		if($.trim($("#name").val())==""){
			alert("상품명을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		
		// 카테고리 유효성 검사
		if($("#category").val()==""){
			alert("카테고리를 선택해주세요.");
			return false;
		}
		
		// 타입 유효성 검사
		if($("#ctgtype").val()==""){
			alert("타입을 선택해주세요.");
			return false;
		}
		
		// 성별 유효성 검사
		if($("#ctggender").val()==""){
			alert("성별을 선택해주세요.");
			return false;
		}
		
		// 가격 유효성 검사
		if($("#price").val()==""){
			alert("가격을 입력해주세요.");
			$("#price").focus();
			return false;
		}
		*/
		
		// 공통 변수
		var chk="";
		var checked="";
		
		// 사이즈 유효성 검사
		var csize="";
		checked=$("input[name='csize']:checked");
		checked.each(function(){
				chk=$(this).val();
				csize+=chk;
				
				// 체크된 목록의 마지막 값이 현재의 값과 같은 경우 -> 즉, 마지막에 / 붙이지 않기
				if(chk!=checked.last().val()){
					csize+="/";
				}

		});
		
		if($.trim(csize)==""){
			alert("사이즈를 선택해주세요.");
			return false;
		}
		
		
		// 색상 유효성 검사
		checked=$("input[name='color']:checked");
		var color="";
		checked.each(function(){
				chk=$(this).val();
				color+=chk;
				
				// 체크된 목록의 마지막 값이 현재의 값과 같은 경우 -> 즉, 마지막에 / 붙이지 않기
				if(chk!=checked.last().val()){
					color+="/";
				}

		});
		
		if($.trim(color)==""){
			alert("색상을 선택해주세요.");
			return false;
		}
		
		// 상품 설명 유효성 검사
		
		// 썸네일 유효성 검사 
		
		// 상품 이미지(설명용) 유효성 검사
		
		
		/*	
		var formdata=new FormData(document.getElementById('frm'));
		
		$.ajax({
			type :"post",
			url	 :"adminGoodsWrite.do",
			data :formdata,
			
			processData:false,
			contentType:false,
			
			datatype : "text",
			success : function(data){
				// var datas=JSON.parsse(data);
				
				if(data.filename!=""){
					alert("저장완료");
					location='fileboardList.do';
				} else {
					alert("저장실패");
				}
			},
			error : function(){
				alert("오류발생");
			}
		});
		*/
	});
} );