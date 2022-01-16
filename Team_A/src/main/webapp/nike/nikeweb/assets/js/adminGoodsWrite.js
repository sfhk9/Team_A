var tList = new Array();	// thumbnails List	/ formData에 담기는 리스트
var gList = new Array();	// goods Image List / formData에 담기는 리스트

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

function fn_list(id,fileList){
	var target = $("#"+id);
	var divNames=new Array();				// 파일 이름 담는 배열
	var overlap=new Array();				// 중복된 파일 이름 담는 배열
	var divList=new Array();				// 전송할 배열을 앝은 복사할 배열
	
	// 배열 얕은 복사
	if(id=="thumbnails"){
		divList=tList;
	} else {
		divList=gList;
	}	

	// 파일 이름 담기
	$.each(divList,function(i,file){
		if(file!=null){
			divNames.push(file.name);		
		}
	});
	
	$.each(fileList,function(i,file){
		
		if(file!=null){
			var filename=file.name;
			
			// 중복된 이름의 파일명 검사
			if(divNames.indexOf(filename)<0){
				// 중복 X -> input의 파일을 전송할 리스트에 추가
				divList.push(file);	
			} else {
				// 중복 -> 파일 이름 담기 (중복 파일명 배열에)
				overlap.push(file.name);
			}
		}

	});
	
	// 중복된 파일명 알림
	if(overlap.length>0){
		var content="중복된 파일 "+overlap.length+"개는 제외됩니다."
		$.each(overlap,function(i,name){
			content += "\n **"+name;
		});
				   
		alert(content);
	}
	
	var html="총 "+divList.length+"개"
			+"<h5>------이미지 클릭시 확대됨------</h5>";
	$.each(divList,function(i){
		var file=divList[i];
		var img=URL.createObjectURL(file);
		//var img="nike/images/sho.png";
		// 파일 존재 여부를 업로드하기 전에 체크하는 함수 필요할듯
	
		html+="<p>"
			 +"<img src='"+img+"' class='listIMG' onclick='fn_preview(\""+img+"\")'> "
			 +file.name
			 +" <button type='button' onclick='fn_new(\"up\",\""+id+"\",\""+i+"\")'>up</button>"
			 +" <button type='button' onclick='fn_new(\"down\",\""+id+"\",\""+i+"\")'>down</button>"
			 +" <button type='button' onclick='fn_new(\"del\",\""+id+"\",\""+i+"\")'>X</button>"
			 +"</p>";
	});
	
	// divList 화면에 띄우기
	$("#"+id+"List").html(html);
}


// 차후 화면 크기, 이미지 크기에 따라 변하도록 확장시키기
function fn_preview(target){
	
	var top = screen.height/2-300;
	var left = screen.width/2-200;
	
	var openWindow = window.open("","_blank","width=600,height=400,top="+top+",left="+left);
	openWindow.document.write("<img src='"+target+"' style='width:98%;height:98%;'>");
}

function fn_new(str,id,i){
	var arr= new Array();
	var fileList = new Array();
	if(id=="thumbnails"){
		arr=tList;
	} else {
		arr=gList;
	}
	
	//여기 안에서 함수 실행 판단
	if(str=="up"){
		fn_listUp(arr,i);
	} else if(str=="down"){
		fn_listDown(arr,i);
	} else if(str=="del"){
		fn_listDel(arr,i);
	}

	fn_list(id,fileList);
}

function fn_listUp(arr,i){
	var tmp="";
	i=Number(i);	// 그냥 사용하면 문자열로 처리됨 (-는 괜찮지만, +는 문자열끼리 더해버림)
	if(i>0){
		tmp=arr[i-1];
		arr[i-1]=arr[i];
		arr[i]=tmp;
	}
}

function fn_listDown(arr,i){
	var tmp="";
	var len=arr.length-1;
	i=Number(i);	// 그냥 사용하면 문자열로 처리됨 (-는 괜찮지만, +는 문자열끼리 더해버림)

	if(i<len){
		tmp=arr[i];
		arr[i]=arr[i+1];
		arr[i+1]=tmp;
	}
}


function fn_listDel(arr,i){
	arr.splice(i,1);
}

$( function() {
	
	$("#thumbnails").change(function(){
		var fileList = $(this)[0].files;			// input File List
		fn_list("thumbnails",fileList);
	});	
	
	$("#goodsImgs").change(function(){
		var fileList = $(this)[0].files;			// input File List
		fn_list("goodsImgs",fileList);
	});
	
	
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