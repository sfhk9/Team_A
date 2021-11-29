package egov.service;

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
	private int g_unq;				
	private String category; 		// CLS : 옷, SHO : 신발
	private String ctg_type; 		//SPT : 스포츠, LES : 레저, LIF : 일상  
	private String ctg_gender; 		// N : 무관, M : 남성용, F : 여성용
	private String csize;			//옷사이즈
	private String color;
	private String thumbnail;
	private int price;

	//장바구니 CART     //반품 ORDERCANCEL
	private int c_unq;
	private String reason;		//반품사유
	//나머진 상품정보에서 받아옴
	
	//주문배송 ORDERLIST
	private int o_unq;
	private int stmt;	
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
	private int r_unq;
	private String title;
	private String content;
	private String img;
	private int mark;

	//상품문의 QNA
	private int q_unq;
	private int gid;
	private String gthread;
	
	//사용자>관리자 문의 FAQ_USER
	private int fu_unq;
	//NOTICE 공지사항
	private int n_unq;
	private String filename;

	//FAQ 자주찾는 질문
	private int f_unq;

	//페이징용 변수
	private int page_unit = 10;
	private int page_size = 10;
	
	private int page_no = 1;
	
	private int total = 1;
	private int total_page = 1;
	private int rownum = 1;
	
	private int s_no = 1;
	private int e_no = 10;
	
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
	public int getG_unq() {
		return g_unq;
	}
	public void setG_unq(int g_unq) {
		this.g_unq = g_unq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCtg_type() {
		return ctg_type;
	}
	public void setCtg_type(String ctg_type) {
		this.ctg_type = ctg_type;
	}
	public String getCtg_gender() {
		return ctg_gender;
	}
	public void setCtg_gender(String ctg_gender) {
		this.ctg_gender = ctg_gender;
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
	public int getC_unq() {
		return c_unq;
	}
	public void setC_unq(int c_unq) {
		this.c_unq = c_unq;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getO_unq() {
		return o_unq;
	}
	public void setO_unq(int o_unq) {
		this.o_unq = o_unq;
	}
	public int getStmt() {
		return stmt;
	}
	public void setStmt(int stmt) {
		this.stmt = stmt;
	}
	public int getR_unq() {
		return r_unq;
	}
	public void setR_unq(int r_unq) {
		this.r_unq = r_unq;
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
	public int getQ_unq() {
		return q_unq;
	}
	public void setQ_unq(int q_unq) {
		this.q_unq = q_unq;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getGthread() {
		return gthread;
	}
	public void setGthread(String gthread) {
		this.gthread = gthread;
	}
	public int getFu_unq() {
		return fu_unq;
	}
	public void setFu_unq(int fu_unq) {
		this.fu_unq = fu_unq;
	}
	public int getN_unq() {
		return n_unq;
	}
	public void setN_unq(int n_unq) {
		this.n_unq = n_unq;
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
}
