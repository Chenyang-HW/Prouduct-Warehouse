package ie.ucd.comp2004J;

public class User {
	
	private String username;
	private String password;
	private int id;
	
	public User(String username, String password, int id) {
		super();
		this.username = username;
		this.password = password;
		this.id=id;
	}
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}


	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}


	public String toString() {
		return id+":"+username+","+password;
	}
	
	public boolean equals(User u) {
		return (u.getUsername().equals(username)&&u.getPassword().equals(password));
	}
}
