package ie.ucd.comp2004J;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Product {
	
	private int productId;
	private int amount;
	private String productName;
	private String madeDate;
	private String category;
	private int cityId;
	private int managerId;
	
	
	public Product(int productId, int amount, String productName,String madeDate,String category,int cityId,int managerId) {
		super();
		this.productId=productId;
		this.amount=amount;
		this.productName=productName;
		this.madeDate = madeDate;
		this.category=category;
		this.cityId = cityId;
		this.managerId=managerId;
	}
	
	public static List<Product> getAllProduct(){
		List<Product> products = new ArrayList<Product>();
			
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM product");
			
			while(rs.next()) {
				
				int id = rs.getInt("product_id");
				int amount = rs.getInt("amount");
				String name = rs.getString("name");
				String madedate=rs.getString("made_date");
				String category = rs.getString("category");
				int city_id = rs.getInt("city_id"); 
				int manager_id = rs.getInt("manager_id");
				
				Product p = new Product(id, amount, name,madedate,category, city_id, manager_id);
				
				products.add(p);
			}
			
			rs.close();
			st.close();
			conn.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return products;
	}
	
	public static boolean deleteProductByID(String ids) {
		int pid=Integer.parseInt(ids);
		int success=0;
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement pstmt= (PreparedStatement) conn.prepareStatement("DELETE FROM product WHERE product_id = "+pid);

	        success = pstmt.executeUpdate();
	        pstmt.close();
	        conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success==1;
	}
	
	public static void addProduct(String id, String amount,String name,String made_date,String category,String city,String manager) {
		 String result = String.format("insert into product values(%s,%s,'%s','%s','%s',%s,%s)",id,amount,name, made_date,category,city,manager);

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
		return "id:"+productId+" amount:"+amount+" name:"+productName+" madedate:"+madeDate+" category:"+category+" cityid:"+cityId+" managerid:"+managerId;
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
	 * @return the amount
	 */
	public int getAmount() {
		return amount;
	}


	/**
	 * @param amount the amount to set
	 */
	public void setAmount(int amount) {
		this.amount = amount;
	}


	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}


	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}


	/**
	 * @return the madeDate
	 */
	public String getMadeDate() {
		return madeDate;
	}


	/**
	 * @param madeDate the madeDate to set
	 */
	public void setMadeDate(String madeDate) {
		this.madeDate = madeDate;
	}


	/**
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}


	/**
	 * @param category the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}


	/**
	 * @return the cityId
	 */
	public int getcityId() {
		return cityId;
	}


	/**
	 * @param cityId the cityId to set
	 */
	public void setcityId(int cityId) {
		this.cityId = cityId;
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
	

}
