package ie.ucd.comp2004J;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
	
	public static List<User> getAllUsers() {
		List<User> users = new ArrayList<User>();
			
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM database_manager");
			
			while(rs.next()) {
				int id=rs.getInt("id");
				String name = rs.getString("name");
				String password = rs.getString("password");
				
				User u = new User(name,password,id);
				
				users.add(u);
			}
			
			rs.close();
			st.close();
			conn.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return users;
	}
	
	

	public static boolean deleteUserByID(String ids) {
		int pid=Integer.parseInt(ids);
		int success=0;
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement pstmt= (PreparedStatement) conn.prepareStatement("DELETE FROM database_manager WHERE id = "+pid);

	        success = pstmt.executeUpdate();
	        pstmt.close();
	        conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success==1;
	}
	
	public static boolean insertUser(String name,String password,String id) {
		int success=0;
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement pstmt= (PreparedStatement) conn.prepareStatement("INSERT INTO database_manager (name, password,id) VALUES('"+name+"','"+password+"','"+id+"')");

	        success = pstmt.executeUpdate();
	        pstmt.close();
	        conn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return success==1;
	}
	
	public static User login(String username, String password) {
		User input=new User(username,password,1);
		List<User> users = UserDAO.getAllUsers();
		for (User u : users) {
			if(u.equals(input))
				return u;
		}
		
		return null;
	}

}
