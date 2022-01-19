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
		var filename="";
		if(file!=null){
			if(typeof(file)=="string") filename=file;
			else filename=file.name;
			divNames.push(filename);		
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
		var img="";
		var filename="";
		var del="";
		//var img="nike/images/sho.png";
		
		if(typeof(file)=="string"){
			img=$("#goodsPath").val()+"/"+file;
			filename=file;

			// 삭제 버튼 색깔 다르게 만들기
			del="fileDel";
		} else {
			img=URL.createObjectURL(file);
			filename=file.name;
			del="del";
		}
	
		html+="<p>"
			 +"<img src='"+img+"' class='listIMG' onclick='fn_preview(\""+img+"\")'> "
			 +filename
			 +" <button type='button' onclick='fn_new(\"up\",\""+id+"\",\""+i+"\")'>up</button>"
			 +" <button type='button' onclick='fn_new(\"down\",\""+id+"\",\""+i+"\")'>down</button>"
			 +" <button type='button' onclick='fn_new(\""+del+"\",\""+id+"\",\""+i+"\")'>X</button>"
			 +"</p>";
		URL.revokeObjectURL(file);
	});
	
	if(divList.length==0) html="비어있습니다";
	
	
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
	} else if(str=="fileDel"){
		if(confirm("정말 삭제하시겠습니까?(취소 불가)")) fn_fileDel(id,arr,i);
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
} );

function fn_addList(imgName,id){
	// 저장되는 배열 결정
	var divList="";
	if(id=="thumbnails") divList=tList;
	if(id=="goodsImgs") divList=gList;
	
	divList.push(imgName);
}

function fn_fileDel(id,arr,i){
	if(arr.length<=1){
		alert("삭제불가 : 최소 한장은 존재해야합니다.");
		return false;
	}
	
	$.ajax({
			type: "POST",
			url: "adminDeleteFile.do" ,
			data: {
				"unq":$("#unq").val(),
				"filename" : arr[i]
			}, 
			datatype : "text",
			success: function(data) {
				if(data=="ok"){
					alert("삭제 성공");
					fn_new("del",id,i);
				} else if(data=="er1"){
					alert("(오류) DB 삭제 실패 / 파일 삭제 성공 ");
				} else if(data=="er2"){
					alert("(오류) 파일 삭제 실패");
				} else if(data=="er3"){
					alert("삭제 실패");
				}
			}, 
			error: function() {
				alert("오류 발생");
			}
	});
}
