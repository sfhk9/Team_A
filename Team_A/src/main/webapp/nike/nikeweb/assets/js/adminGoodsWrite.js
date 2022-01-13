// 화면 리스트 갱신용 변수들
var fileList = new Object();
var html="";

function fn_size(){
	var category = $("#category").val();
	var cnt=0;
	/*옷 사이즈 옵션들*/
	var cls=""
	for(var i=75;i<115;i+=5){
		cls+="<input type='checkbox' name='csize' value='"+i+"' style='width:15px; height:15px;'> "+i+"&nbsp";
		if(i<100) cls+="&nbsp";		// 2자리수이면 공백을 추가하기
		cnt++;
		if(cnt%5==0) cls+="<br>";	// 5개 출력 후 줄바꿈
	}
	cnt=0;
	
	/*신발 사이즈 옵션들*/
	var sho=""
	for(var i=220;i<285;i+=5){
		sho+="<input type='checkbox' name='csize' value='"+i+"' style='width:15px; height:15px;'> "+i+"&nbsp";
		cnt++;
		if(cnt%5==0) sho+="<br>";	// 5개 출력 후 줄바꿈
	}

	if(category=="CLS"){
		$("#sizeDiv").html(cls);	
	} else if(category=="SHO"){
		$("#sizeDiv").html(sho);
	} else {
		$("#sizeDiv").html("카테고리를 선택해주세요");
	}
}

function fn_list(target,list){
	fileList = target[0].files;
	const dataTranster = new DataTransfer();
	html="";
	$.each(fileList,function(i){
		var file=fileList[i];
		var img=URL.createObjectURL(file);
		// 파일 존재 여부를 업로드하기 전에 체크하는 함수 필요할듯
		html+="<p>"
			 +"<img src='"+img+"' class='listIMG' onclick='fn_preview("+img+")'> "
			 +file.name
			 +" <button type='button' onclick='fn_listUp("+i+")'>up</button>"
			 +" <button type='button' onclick='fn_listDown("+i+")'>down</button>"
			 +" <button type='button' onclick='fn_listDel("+i+",fileList,$(this))'>X</button>"
			 +"</p>";
	});
	
	list.html(html);
}

function fn_preview(target){
	var img = new Image();
	img.src=target;
	var top = screen.height/2-150;
	var left = screen.width/2-150;
	
	var openWindow = window.open("","img","width=300,height:300,top="+top+",left="+left);
	//openWindow.document.write("")
}

function fn_listDel(i,fileList,e){
	var test=  Array.from(fileList);
	test.splice(i,1);
	
	$.each(test,function(i,file){
		dataTransfer.item.add(file);
	});
	alert("1");
	//document.querySelector('#thumbnail').files=dataTransfer.files;
	e.parent().remove();
	return dataTransfer;
}

function fn_listDown(e){

	
	//if문
}

function fn_listUp(e){
}

$( function() {
	
	$("#thumbnails").change(function(){
		fn_list($(this),$("#imgList1"));
	});
	
	$("#goodsImgs").change(function(){
		fn_list($(this),$("#imgList2"));
	});
	
	
	$("#btn_save").click(function(){

		// 상품명 유효성 검사
		/*if($.trim($("#name").val())==""){
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

		 
		var fileCheck="";
		
		// 썸네일 유효성 검사
		fileCheck = document.getElementById("thumbnails").value;
	    if(!fileCheck){
	        alert("썸네일을 첨부해 주세요");
	        return false;
	    }

		// 상품 이미지(설명용) 유효성 검사
		fileCheck = document.getElementById("goodsImgs").value;
		
	    if(!fileCheck){
	        alert("상품 설명용 이미지를 첨부해 주세요");
	        return false;
	    }
		*/
		var formData = new FormData(document.getElementById('frm'));
		
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
					location='fileboardList.do';
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