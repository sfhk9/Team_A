$( function() {
	$("#btn_save").click(function(){

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
		if(document.getElementById("info").value.length==0){
			alert("상품 설명을 입력해주세요");
			return false;
		}

		 
		// 썸네일 유효성 검사
	    if(tList.length<=0){
	        alert("썸네일을 첨부해 주세요");
	        return false;
	    }

		// 상품 이미지(설명용) 유효성 검사
	    if(gList.length<=0){
	        alert("상품 설명용 이미지를 첨부해 주세요");
	        return false;
	    }
		
		var formData = new FormData(document.getElementById('frm'));


		/*
			jsp 파일에서 만약, form 안에 input이 들어있다면
			<input type="file" name="thumbnails[]">
			이렇게 배열 형식의 name 값을 주고나서 javascript에서 아래의 중복 전송 방지를 해야한다
		 */
			
		// 중복 전송 방지
		//formData.delete("thumbnailes[]");
		//formData.delete("goodsImg[]");
	
		// 실질적인 thumbnails, goodsImag 파일 목록을 formData에 추가
		for(var i=0; i<tList.length;i++){
			formData.append("thumbnails",tList[i]);
		}
		
		for(var i=0; i<gList.length;i++){
			formData.append("goodsImgs",gList[i]);
		}
		
		$.ajax({
			type: "POST", 
			enctype: 'multipart/form-data', // 필수
			url: "adminGoodsWriteSave.do" ,
			data: formData, // 필수 
			processData: false, // 필수 
			contentType: false, // 필수
			datatype : "text",
			success: function(data) { 
				if(data=="ok"){
					alert("전송 성공");	
					location.href="adminList.do"
				} else if(data=="er1"){
					alert("동일한 unq를 이름으로 사용하는 경로가 존재합니다");
				} else if(data=="er2"){
					alert("이미지 파일이 비어있습니다");
				} else {
					alert("전송 실패");
				}
			}, 
			error: function() {
				alert("오류 발생");
			}
		});
	});
} );