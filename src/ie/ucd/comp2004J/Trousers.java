package ie.ucd.comp2004J;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Trousers {
	
	private int productId;
	private int length;
	
	
	public Trousers(int productId, int length) {
		super();
		this.productId = productId;
		this.length = length;
	}


	public static List<Trousers> getAllProduct(){
		List<Trousers> trousers = new ArrayList<Trousers>();
			
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM trousers");
			
			while(rs.next()) {
				
				int id = rs.getInt("product_id");
				int length = rs.getInt("length");
				
				Trousers s = new Trousers(id, length);
				
				trousers.add(s);
			}
			
			rs.close();
			st.close();
			conn.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return trousers;
	}
	
	public static boolean deleteTrousersByID(String ids) {
		int pid=Integer.parseInt(ids);
		int success=0;
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement pstmt= (PreparedStatement) conn.prepareStatement("DELETE FROM trousers WHERE product_id = "+pid);

	        success = pstmt.executeUpdate();
	        pstmt.close();
	        conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success==1;
	}
	
	public static void addTrousers(String id, String length) {
		 String result = String.format("insert into trousers values(%s,%s)",id,length);

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
		return "id:"+productId+" size:"+length;
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
	 * @return the length
	 */
	public int getLength() {
		return length;
	}


	/**
	 * @param length the length to set
	 */
	public void setLength(int length) {
		this.length = length;
	}

}
