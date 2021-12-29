/* 
	* 추후 Controller에서 대체해서 처리 가능한 것들은 Controller로 옮기기
	* 특히 fn_before() / fn_compare()
	* 속도 측면에서 DB로 검색, 비교하는게 훨씬 빠를 것으로 보임
	* vo를 새로 만드는 것을 추천
*/

// update 용 ArrayList 객체들
var beforeList=new Array();
var afterList=new Array();


/*마지막으로 저장된 List (현재 DB에 올라와 있는 리스트) */
function fn_before(){
	var len=$('#cartTable >tbody tr').length;
	for(var i=0;i<len;i++){
		var unq=$("tbody").children().eq(i).find("#unq").val();		
		var qty=$("tbody").children().eq(i).find("#qty").val();
			
		// 객체 생성
		var data = new Object();
		data.unq=unq;
		data.qty=qty;
			
		// 리스트에 생성된 객체 삽입
		beforeList.push(data);	
	}
}

/* 리스트 변동여부 체크 (비교)*/
function fn_compare(check){
	var cnt=0;			// DB와 현재 리스트 비교 후 차이 판단 변수
	var result="original";

	// 장바구니가 비워져 있지 않으면
	if(typeof check!="undefined"){
		// 현재 장바구니 리스트도 변경 사항에 추가
		// 만약 삭제된 목록이 있다면, fn_delete통해서 이미 afterList에 들어간 상태
		// json 데이터 생성하기
		var len=$('#cartTable >tbody tr').length;
		for(var i=0;i<len;i++){
			var unq=$("tbody").children().eq(i).find("#unq").val();		
			var qty=$("tbody").children().eq(i).find("#qty").val();
			
			// 객체 생성
			var data = new Object();
			data.unq=unq;
			data.qty=qty;
			
			// 리스트에 생성된 객체 삽입
			afterList.push(data);	
		}
	}

	for(var j=0;j<beforeList.length;j++){
		var obj1=beforeList[j];
		var isHere=false;		// DB의 unq값이 리스트에 있는지 여부를 판단
		
		for(var k=0;k<afterList.length;k++){
			var obj2=afterList[k];
			
			// DB의 unq를 리스트에서 발견한 상황
			if(Object.is(obj1.unq,obj2.unq)){
				isHere=true;
				
				// 해당 unq의 qty값이 DB의 것과 리스트의 것이 다른 상황
				if(!Object.is(obj1.qty,obj2.qty)) cnt+=1;
			}
			
		}
		
		// DB의 unq를 리스트에서 발견하지 못한 상황
		if(isHere==false) cnt+=1;
	}
	
	if(cnt>0) result="changed";
	return result;
}


/* 리스트가 공백 여부를 체크, 공백일 경우 아래의 내용들을 출력 */
function fn_rowCheck(){
	if($('#cartTable >tbody tr').length==0){
		
		// th 부분 길이 유지하기 위한 colgroup 추가
		var addColgroup = $("#cartTable").html();
		addColgroup="<colgroup>"
			   +"<col width='150px' />"
			   +"<col width='435px' />"
			   +"<col width='435px' />"
			   +"<col width='435px' />"
			   +"<col width='*' />"
			   +"<col width='100px' />"
		   +"</colgroup>"
		   +addColgroup;
		   
		$("#cartTable").html(addColgroup);
		
		// 장바구니가 비어있을 경우 출력할 문구
		var Empty="<tr>"
			      +"<td colspan='6' class='text-center' style='width:1455px;'>장바구니가 비어있습니다.</td>"
			  +"</tr>"
		$("#cartTable >tbody").html(Empty);
	}
}

/* 수량 입력의 유효성 검사 */
function fn_qtychk(ths){

	var q = ths.val();
	var chk= /\d/ ;

	var total=ths.parents("tr").find("#total");
	var msg="";
	
	if(chk.test(q)&&q>=0){
		fn_change(ths);
		return false;
	} else if(q<0){
		msg="수량을 확인해주세요";		
	} else {
		msg = "잘못된 입력입니다.";
	}

	// 버튼 못누르게 해야함
	
	alert(msg);		
	total.html("올바른 입력 필요");
}

/* 수량 버튼 클릭시 상품별 총 가격, 모든 상품 총 가격 계산, 변동 내용을 화면에 출력*/
// e : 수량 증가, 감소 버튼 객체를 받아옴
function fn_change(ths){
	
	/* 상품별 총가격 계산, 화면 출력*/
	// 버튼의 부모 객체인 <div class="cart-plus-minus"> 안의 자식 객체 중 input 즉, id=qty인 객체의 값을 가지고 옴
	var qty=ths.parent().find("input").val();
	
	// 버튼의 상위 부모 객체 중 <td>의 자식 요소 중 id값이 price인 것의 값을 가지고 옴
	var price=ths.parents("td").find("#price").val();
	// 그리고서 "상품*수량 = 한 항목의 총 가격"을 계산
	var price_total=price*qty;
	price_total=fn_comma(price_total);
	
	// 버튼의 상위 부모 객체 중 <tr>의 자식 요소 중 id값이 total인 객체를 total 변수에 담음
	// 해당 객체의 innerHTML을 위에서 계산한 price_total로 변경
	var total=ths.parents("tr").find("#total");
	total.html(price_total);
	
	fn_cartTotal();
}


/* 명세서에 모든 상품의 총가격 계산, 반영해서 화면에 출력 */
function fn_cartTotal(){	
	var cnt=$('#cartTable >tbody tr').length;
	var tr=$("tbody").children();
	var check = tr.find("#price").val();
	
	var cartTotal=0;
	var grandTotal=0;
	
	if(typeof check!="undefined"){		
		for(var i=0;i<cnt;i++){
			var price = tr.eq(i).find("#price").val();
			var qty = tr.eq(i).find("#qty").val();
			cartTotal+=(price*qty);
		}	
	}
	
	
	/*배송비 관련 체크박스 확인 후, 값을 더할 예정*/
	grandTotal=cartTotal+0;
	
	cartTotal=fn_comma(cartTotal);
	grandTotal=fn_comma(grandTotal);
	
	$("#cartTotal").html(cartTotal);
	$("#grandTotal").html(grandTotal);
}

/* 상품 항목 삭제 버튼 */
function fn_delete(ths){	
	var unq = ths.parents("tr").find("#unq");
	
	// 삭제용 객체 생성
	var data = new Object();
	data.unq=unq.val();
	data.qty=0;

	afterList.push(data);

    // 화면에서 한 행 삭제
    ths.parents("tr").remove();
    
    // 한 행 삭제 후 리스트가 비었는지 검사
    fn_rowCheck();
    fn_cartTotal();
}

/* 수량 0 여부 확인 */
function fn_isZero(q){
	if(q.val()==0){
		return true;
	} else {
		return false;
	}
}

$(function(){
	var check;
	// db에 저장된 List 가져오기
	fn_before();
	
	// 리스트 공백 여부 체크
	fn_rowCheck();
	
	// 총 가격 계산, 출력
	fn_cartTotal();
	
	// 수량 감소 버튼
	var zero=false;
	$(".dec.qtybutton").on("click",function() {
		var q = $(this).parent().find("input");
		
		if(zero==true){
			alert("최저 수량은 0개 입니다.");
		}
		
		zero=fn_isZero(q);
		
		fn_change($(this));

	});
	
	
	// 수량 증가 버튼
	$(".inc.qtybutton").on("click",function() {
		fn_change($(this));
	});
	
	// CONTINUE 버튼
	$("#btn_continue").click(function(){
		var check = $("tbody").children().find("#price").val();	
		var test=fn_compare(check);
		
		if(test=="changed"){
			if(confirm("변경사항이 있습니다. 저장하시겠습니까?")){
				$("#btn_save").trigger("click");
			}				
		}
		
		location.href="/goodsList.do";
	});
	
	// UPDATE 버튼
	$("#btn_save").click(function(){
		var check = $("tbody").children().find("#price").val();
		var test=fn_compare(check);
				
		// 장바구니는 비워져 있는데, 변경 사항이 없었다면 -> update 할 필요가 없는 경우
		if(test!="changed") {
			var msg="변경된 내용이 없습니다.";
			
			// 변경사항이 없고, 장바구니도 비워져 있는 상황 -> 즉, 원래부터 텅빈 상태
			if(typeof check=="undefined") msg="장바구니가 비어있습니다.";
				
			alert(msg);
			return false;	
		}


		// String 형태로 변환
		var jsonData = JSON.stringify(afterList);
		
		$.ajax({
			type:"post",
			url:"cartSave.do",
			data:jsonData,
			traditional: true ,
			contentType:"application/json",
			
			datatype:"text",
			success:function(data){
				if(data=="ok"){
					alert("저장 성공");
					document.location.reload();
				} else if(data=="err1"){
					alert("입력 수량에서 문제가 있습니다");
				} else {
					alert("저장 실패");
				}
			},
			error:function(){
				alert("오류 발생");
			}
		});
	});
	
	
	// Clear 버튼
	$("#btn_clear").click(function(){
		check = $("tbody").children().find("#price").val();
		var test=fn_compare(check);
				
		var msg="정말로 전부 삭제하시겠습니까?";
		var msg2="장바구니를 비웠습니다";
		
		
		// 본래 목록이 있었지만, delete해서 목록을 비운 상태
		if((test=="changed") && (typeof check=="undefined")) msg="장바구니가 비워져있습니다.\n저장하시겠습니까?";
		if(!confirm(msg)) return false;
	
		$.ajax({
			type:"post",
			url:"cartClear.do",
			data:"clear",
			
			datatype:"text",
			success:function(data){
				if(data=="ok"){
					if(typeof check=="undefined") mag2="비워진 장바구니를 저장했습니다."; 
					alert(msg2);
					document.location.reload();
				} else if(data=="er1"){
					alert("장바구니가 비어있습니다");
				} else {
					alert("삭제 오류 발생")
				}
			},
			error:function(){
				alert("오류 발생");
			}
		});
	});
	
	
	// CheckOut(결제) 버튼
	$("#checkout").click(function(){
		check = $("tbody").children().find("#price").val();
		var test=fn_compare(check);
		
		if(test=="changed"){
			if(confirm("변경사항이 있습니다. 저장하시겠습니까?")){
				$("#btn_save").trigger("click");
			} else {
				alert("변경내역을 저장하거나, 목록을 새로고침 해야 진행이 가능합니다.");
				return false;
			}
		}

		if(typeof check=="undefined"){
			alert("장바구니가 비어있습니다.");
			return false;
		}
	});

});