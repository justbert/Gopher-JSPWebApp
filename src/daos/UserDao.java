package daos;

import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;

import entities.User;
import entities.User.UserType;
import utils.DatabaseManager;
import utils.Password;

public class UserDao extends DatabaseManager {
	private static final String select_VerifyEmail = "SELECT id from gopher.users WHERE email = ?";
	private static final String select_VerifyUsername = "SELECT id from gopher.users WHERE username = ?";
	private static final String select_VerifyPassword = "SELECT password, salt from gopher.users WHERE id = ?";
	private static final String insert_RegisterUser = "INSERT INTO users (username, email, password, salt, userTypeId) VALUES (?, ?, ?, ?, ?)";
	private static final String select_getUser = "SELECT id, nameFirst, nameLast, email, addressIDHome, addressIDWork, phoneHome, phoneMobile, phoneWork, dateJoined FROM Gopher.users WHERE email = ?";
	
	private static final String select_getUserForID = "Select * from users where id = ?";

	/*
	 * Verifies if the email supplied has been registered.
	 * Returns the ID of the user found, MIN_Value if not.
	 */
	public int verifyEmail(String email) {

		//DatabaseManager db = DatabaseManager.getDatabaseManager();
		//ResultSet set;
		
		try(ResultSet rs = query(select_VerifyEmail, email)){
			if(rs.first())
				return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return Integer.MIN_VALUE;
	}
	
	/*
	 * Verifies if the username supplied has been registered.
	 * Returns the ID of the user found, MIN_Value if not.
	 */
	public int verifyUsername(String username) {

		//DatabaseManager db = DatabaseManager.getDatabaseManager();
		//ResultSet set;
		
		try(ResultSet rs = query(select_VerifyUsername, username)){
			if(rs.first())
				return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return Integer.MIN_VALUE;
	}

	public boolean verifyPassword(String id, String password) {
		try(ResultSet set = query(select_VerifyPassword, id)){
			if(set.first()) {
				String dbPW = set.getString(1);
				String salt = set.getString(2);
				return Password.encrypt(password, salt).equals(dbPW);
			}
		} catch (SQLException | NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean registerUser(String username, String email, String password, String userTypeId) {
		boolean registered = false;
		StringBuilder sb = new StringBuilder();
		String passwordAndSalt[] = new String[2];
		
		try {
			passwordAndSalt = Password.encrypt(password);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		try {
			if(update(insert_RegisterUser, username,  email, passwordAndSalt[0], passwordAndSalt[1], userTypeId) > 0)
				registered = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return registered;
	}

	/*
	 * Returns null if user isn't found or password isn't correct
	 */
	public User getUser(String id) {
		//StringBuilder sb = new StringBuilder();
		User user = null;

		try(ResultSet userSet = query(select_getUser, id)){
			if(userSet.first()) {
				user = new User();
				user.setId(Integer.parseInt(id));
				user.setNameFirst(userSet.getString(1));
				user.setNameLast(userSet.getString(2));
				user.setUsername(userSet.getString(3));
				user.setEmail(userSet.getString(4));
				user.setPhoneHome(userSet.getString(5));
				user.setPhoneWork(userSet.getString(6));
				user.setPhoneMobile(userSet.getString(7));
				user.setDateJoined(userSet.getTimestamp(8));
			}
		} catch (SQLException e) { //exception caused by prepared statement and connection
			e.printStackTrace();
		}
		return user;
	}
	public User getUserForID(int id){
		User user = null;

		try(ResultSet rs = query(select_getUserForID, id)){
			while(rs.next())
				user = new User(rs.getInt("id"), 
						rs.getString("nameFirst"), 
						rs.getString("nameLast"), 
						rs.getString("username"),
						rs.getString("email"), 
						rs.getString("phoneHome"), 
						rs.getString("phoneMobile"),
						rs.getString("phoneWork"),  
						rs.getDate("joinDate"), 
						UserType.getUserType(rs.getInt("userTypeId")));
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
		return user;
	}

}