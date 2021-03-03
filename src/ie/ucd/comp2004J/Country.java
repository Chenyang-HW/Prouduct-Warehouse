package ie.ucd.comp2004J;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Country {

	private int countryId;
	private String countryName;
	private float traiffRate;


	public Country(int countryId, String countryName,float traiffRate) {
		super();
		this.countryId = countryId;
		this.countryName = countryName;
		this.traiffRate=traiffRate;
	}
	

	public static List<Country> getAllCountries(){
		List<Country> countries = new ArrayList<Country>();
			
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM country");
			
			while(rs.next()) {
				
				int cid = rs.getInt("country_id");
				String name = rs.getString("name");
				float traiffr = rs.getFloat("traiff_rate");
				
				Country s = new Country(cid, name,traiffr);
				
				countries.add(s);
			}
			
			rs.close();
			st.close();
			conn.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countries;
	}
	
	public static boolean deleteCountryByID(String ids) {
		int pid=Integer.parseInt(ids);
		int success=0;
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement pstmt= (PreparedStatement) conn.prepareStatement("DELETE FROM country WHERE country_id = "+pid);

	        success = pstmt.executeUpdate();
	        pstmt.close();
	        conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success==1;
	}
	
	public static void addCountry(String id, String name,String traiff) {
		 String result = String.format("insert into country values(%s,'%s',%s)",id,name,traiff);

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
		return "country id:"+this.countryId+" name:"+this.countryName+" traiff rate:"+this.traiffRate;
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
	 * @return the countryName
	 */
	public String getCountryName() {
		return countryName;
	}


	/**
	 * @param countryName the countryName to set
	 */
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}


	/**
	 * @return the traiffRate
	 */
	public float getTariffRate() {
		return traiffRate;
	}


	/**
	 * @param traiffRate the traiffRate to set
	 */
	public void setTariffRate(float traiffRate) {
		this.traiffRate = traiffRate;
	}
	
}
