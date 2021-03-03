package ie.ucd.comp2004J;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class City {
	
	private int cityId;
	private String cityName;
	private int countryId;


	public City(int cityId, String cityName,int countryId) {
		super();
		this.cityId = cityId;
		this.cityName = cityName;
		this.countryId=countryId;
	}
	

	public static List<City> getAllCities(){
		List<City> cities = new ArrayList<City>();
			
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM origin_city");
			
			while(rs.next()) {
				
				int ciid = rs.getInt("city_id");
				String name = rs.getString("name");
				int coid = rs.getInt("country_id");
				
				City s = new City(ciid, name,coid);
				
				cities.add(s);
			}
			
			rs.close();
			st.close();
			conn.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cities;
	}
	
	public static boolean deleteCityByID(String ids) {
		int pid=Integer.parseInt(ids);
		int success=0;
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement pstmt= (PreparedStatement) conn.prepareStatement("DELETE FROM origin_city WHERE city_id = "+pid);

	        success = pstmt.executeUpdate();
	        pstmt.close();
	        conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success==1;
	}
	
	public static void addCity(String id, String name,String coid) {
		 String result = String.format("insert into origin_city values(%s,'%s',%s)",id,name,coid);

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
		return "city id:"+cityId+" city name:"+cityName+" in country:"+countryId;
	}
	
	
	/**
	 * @return the countryId
	 */
	public int getCountryId() {
		return countryId;
	}


	/**
	 * @param countryId the countryId to set
	 */
	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}


	/**
	 * @return the cityId
	 */
	public int getCityId() {
		return cityId;
	}


	/**
	 * @param cityId the cityId to set
	 */
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}


	/**
	 * @return the cityName
	 */
	public String getCityName() {
		return cityName;
	}


	/**
	 * @param cityName the cityName to set
	 */
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

}
