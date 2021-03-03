package ie.ucd.comp2004J;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Hat {
	
	private int productId;
	private String style;
	

	public static List<Hat> getAllProduct(){
		List<Hat> hat = new ArrayList<Hat>();
			
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM hat");
			
			while(rs.next()) {
				
				int id = rs.getInt("product_id");
				String style = rs.getString("style");
				
				Hat s = new Hat(id, style);
				
				hat.add(s);
			}
			
			rs.close();
			st.close();
			conn.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hat;
	}
	
	public static boolean deleteHatByID(String ids) {
		int pid=Integer.parseInt(ids);
		int success=0;
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement pstmt= (PreparedStatement) conn.prepareStatement("DELETE FROM hat WHERE product_id = "+pid);

	        success = pstmt.executeUpdate();
	        pstmt.close();
	        conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success==1;
	}
	
	public static void addHat(String id, String style) {
		 String result = String.format("insert into hat values(%s,'%s')",id,style);

			try {
				Connection conn = JDBCTool.getConnection();
				PreparedStatement pstmt= (PreparedStatement) conn.prepareStatement(result);

		        pstmt.executeUpdate();
		        pstmt.close();
		        conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
	
	}
	

	public String toString() {
		return "id:"+productId+" style:"+style;
	}
	
	
	public Hat(int productId, String style) {
		super();
		this.productId = productId;
		this.style = style;
	}


	/**
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}


	/**
	 * @param productId the productId to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}


	/**
	 * @return the style
	 */
	public String getStyle() {
		return style;
	}


	/**
	 * @param style the style to set
	 */
	public void setStyle(String style) {
		this.style = style;
	}

}
