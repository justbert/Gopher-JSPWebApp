package utils;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

import models.User;

public class Login {
	
	/*
	 * Verifies if the username supplied has been registered.
	 */
	public static boolean verifyUsername(String username) {
		
		DatabaseManager db = DatabaseManager.getDatabaseManager();
		ResultSet set;
		boolean found = false;
		
		try {
			set = db.query("SELECT id from Gopher.users WHERE username = '" + username + "'");
			found = set.first();
		} catch (SQLException e) {
			
		}
		
		return found;
	}
	
	public static boolean verifyPassword(String username, String password) {
		
		DatabaseManager db = DatabaseManager.getDatabaseManager();
		ResultSet set;
		boolean found = false;
		
		try {
			set = db.query("SELECT password from Gopher.users WHERE username = '" + username + "'");
			
			if(set.first()) {
				found = set.getString(1).equals(password);
			}
		} catch (SQLException e) {
			
		}
		
		return found;
	}
	
	/*
	 * Returns null if user isn't found or password isn't correct
	 */
	public static User getUser(String username, String password) {
		
		DatabaseManager db = DatabaseManager.getDatabaseManager();
		StringBuilder sb = new StringBuilder();
		ResultSet userSet;
		User user = null;
		
		sb.append("SELECT id, password, name_first, name_last,"
				+ " email, address_id_home, address_id_work, phone_home,"
				+ " phone_mobile, phone_work, date_joined"
				+ " FROM Gopher.users WHERE username = '");
		sb.append(username);
		sb.append("'");
		
		try {
			userSet = db.query(sb.toString());
			if(userSet.first()) {
				user.setId(userSet.getInt(1));
				
			}
		} catch (SQLException e) { //exception caused by prepared statment and connection
			
		}
		
		return user;
	}
}
