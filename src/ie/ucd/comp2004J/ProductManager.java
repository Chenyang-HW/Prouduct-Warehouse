package ie.ucd.comp2004J;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ProductManager {
	
	private int managerId;
	private String name;
	private String sex;
	private String enrollDate;

	public ProductManager(int id, String name,String sex,String enrollDate) {
		super();
		this.managerId=id;
		this.name=name;
		this.sex=sex;
		this.enrollDate=enrollDate;
	}
	

	public static List<ProductManager> getAllManager(){
		List<ProductManager> managers = new ArrayList<ProductManager>();
			
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM manager");
			
			while(rs.next()) {
				
				int id = rs.getInt("manager_id");
				String name = rs.getString("name");
				String enrollDate=rs.getString("enroll_date");
				String sex = rs.getString("sex");
				
				ProductManager p = new ProductManager(id, name,sex,enrollDate);
				
				managers.add(p);
			}
			
			rs.close();
			st.close();
			conn.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//System.out.println("all right");
		return managers;
	}
	
	public static boolean deleteManagerByID(String ids) {
		int pid=Integer.parseInt(ids);
		int success=0;
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement pstmt= (PreparedStatement) conn.prepareStatement("DELETE FROM manager WHERE manager_id = "+pid);

	        success = pstmt.executeUpdate();
	        pstmt.close();
	        conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success==1;
	}
	
	public static void addManager(String pid,String sex, String name,String enrollDate) {
		int id=Integer.parseInt(pid);
		 String result = String.format("insert into manager values(%s,'%s','%s','%s')",id,sex,name,enrollDate);

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
		return "id:"+managerId+" sex:"+isMale()+" name:"+name+" enroll date:"+enrollDate;
	}


	/**
	 * @return the managerId
	 */
	public int getManagerId() {
		return managerId;
	}

	/**
	 * @param managerId the managerId to set
	 */
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the male
	 */
	public String isMale() {
		return sex;
	}

	/**
	 * @param male the male to set
	 */
	public void setMale(String sex) {
		this.sex = sex;
	}

	/**
	 * @return the enrollDate
	 */
	public String getEnrollDate() {
		return enrollDate;
	}

	/**
	 * @param enrollDate the enrollDate to set
	 */
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
}
