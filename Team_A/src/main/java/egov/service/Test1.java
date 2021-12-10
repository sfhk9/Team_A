package egov.service;

public class Test1 {

	public static void main(String[] args) {

		
		String ctgtype2 = "";
		
		
		String[] ctgtype;
		String ctgtype_sql = "( ";
		if ( !ctgtype2.equals("") ) {
			ctgtype = ctgtype2.split(",");

			for (int i=0; i<ctgtype.length; i++) {
				ctgtype_sql += "ctgtype=" + ctgtype[i];
				if ( ctgtype.length-1 != i ) {
					ctgtype_sql += " or ";
				} else {
					ctgtype_sql += " )";
				}
				
			}
		}
		System.out.println(ctgtype_sql);
		
		
		
		
		/*
		 * String csize2 = ""; String[] csize = csize2.split(",");
		 * 
		 * 
		 * String csize_sql = "( ";
		 * 
		 * if ( csize.length > 0 ) { for (int i=0; i<csize.length; i++) { csize_sql +=
		 * "color LIKE '%" + csize[i] + "%'"; if ( csize.length-1 != i ) { csize_sql +=
		 * " or "; } else { csize_sql += " )"; } } }
		 * 
		 * System.out.println(csize_sql);
		 */	
		
		
	}

}
