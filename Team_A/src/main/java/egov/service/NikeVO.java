package egov.service;

import java.util.List;

public class NikeVO {
	

	//유저 데이터 USERINFO
	private String userid;

	private String pass;
	private String name;
	private String birth;
	private String phone;
	private String email;
	private String zipcode;
	private String address1;
	private String address2;
	private String rdate;
	private String udate;

	//상품정보 GOODSINFO	
	private int unq;
	private String category; 		// CLS : 옷, SHO : 신발
	private String ctgtype; 		// SPT : 스포츠, LES : 레저, LIF : 일상  
	private String ctggender; 		// N : 무관, M : 남성용, F : 여성용
	private String csize;			// 옷사이즈
	private String color;
	private String thumbnail;		// 썸네일
	private String goodsimg;		// 상품 정보 (이미지)
	private String info;			// 상품 정보 (텍스트)
	
	private int price = 0;
	private int pricemin = 0;
	private int pricemax = 0;
	private int pricesale = 0;		// 할인된 가격
	private String sale; 				// 세일용 코드 (할인 코드)

	private int hits;
	
	private String sql;
	
	
	private String search;

	private String goodsname;

	private int off;


	// 관리자 ADMININFO
	private String adminid;
	private String adminpass;

	// 이미지 파일 리스트
	private List<String> tList;
	private List<String> gList;
	
	//장바구니 CART
	private int qty;
	
	//반품 ORDERCANCEL
	private String reason;		//반품사유
	//나머진 상품정보에서 받아옴
	
	//주문배송 ORDERLIST
	private int goodsunq;
	private int stmt;
	private String message;
	/*
	-- 0 : 결제 대기 
	-- 1 : 결제 취소
	-- 2 : 결제 완료
	-- 3 : 배송 준비
	-- 4 : 배송중
	-- 5 : 배송완료
	-- 6 : 거래완료
	-- 7 : 반송
	-- 8 : 오류
	*/
	//나머진 장바구니에서 받아옴
	
	//리뷰 REVIEW
	private String title;
	private String content;
	private String img;
	private int mark;

	//상품문의 QNA
	private int gid;
	
	//사용자>관리자 문의 FAQ_USER
	//NOTICE 공지사항
	private String filename;

	//FAQ 자주찾는 질문
	private int f_unq;

	//페이징용 변수
	private int page_unit = 10;
	private int page_size = 10;
	
	private int total = 1;
	private int total_page = 1;
	private int rownum = 1;
	
	private int page_no = 1;
	private int s_no = 1;
	private int e_no = 12;
	
	//검색변수
	private String s_field;
	private String s_text;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getUdate() {
		return udate;
	}
	public void setUdate(String udate) {
		this.udate = udate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCtgtype() {
		return ctgtype;
	}
	public void setCtgtype(String ctgtype) {
		this.ctgtype = ctgtype;
	}
	public String getCtggender() {
		return ctggender;
	}
	public void setCtggender(String ctggender) {
		this.ctggender = ctggender;
	}
	public String getCsize() {
		return csize;
	}
	public void setCsize(String csize) {
		this.csize = csize;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getUnq() {
		return unq;
	}
	public void setUnq(int unq) {
		this.unq = unq;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getStmt() {
		return stmt;
	}
	public void setStmt(int stmt) {
		this.stmt = stmt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getMark() {
		return mark;
	}
	public void setMark(int mark) {
		this.mark = mark;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getF_unq() {
		return f_unq;
	}
	public void setF_unq(int f_unq) {
		this.f_unq = f_unq;
	}
	public int getPage_unit() {
		return page_unit;
	}
	public void setPage_unit(int page_unit) {
		this.page_unit = page_unit;
	}
	public int getPage_size() {
		return page_size;
	}
	public void setPage_size(int page_size) {
		this.page_size = page_size;
	}
	public int getPage_no() {
		return page_no;
	}
	public void setPage_no(int page_no) {
		this.page_no = page_no;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getTotal_page() {
		return total_page;
	}
	public void setTotal_page(int total_page) {
		this.total_page = total_page;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public String getS_field() {
		return s_field;
	}
	public void setS_field(String s_field) {
		this.s_field = s_field;
	}
	public String getS_text() {
		return s_text;
	}
	public void setS_text(String s_text) {
		this.s_text = s_text;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	
	public int getPricemin() {
		return pricemin;
	}
	public void setPricemin(int pricemin) {
		this.pricemin = pricemin;
	}
	public int getPricemax() {
		return pricemax;
	}
	public void setPricemax(int pricemax) {
		this.pricemax = pricemax;
	}
	public String getGoodsimg() {
		return goodsimg;
	}
	public void setGoodsimg(String goodsimg) {
		this.goodsimg = goodsimg;
	}

	
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	

	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getAdminpass() {
		return adminpass;
	}
	public void setAdminpass(String adminpass) {
		this.adminpass = adminpass;
	}
	public List<String> gettList() {
		return tList;
	}
	public void settList(List<String> tList) {
		this.tList = tList;
	}
	public List<String> getgList() {
		return gList;
	}
	public void setgList(List<String> gList) {
		this.gList = gList;
	}
	public int getOff() {
		return off;
	}
	public void setOff(int off) {
		this.off = off;
	}

	public int getPricesale() {
		return pricesale;
	}
	public void setPricesale(int pricesale) {
		this.pricesale = pricesale;
	}
	public String getSale() {
		return sale;
	}
	public void setSale(String sale) {
		this.sale = sale;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getGoodsunq() {
		return goodsunq;
	}
	public void setGoodsunq(int goodsunq) {
		this.goodsunq = goodsunq;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
