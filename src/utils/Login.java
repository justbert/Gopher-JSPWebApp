package utils;

import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.User;

/**
 * Class which
 * @author Justin
 *
 */
public class Login {
	
	/*
	 * Verifies if the username supplied has been registered.
	 */
	public static boolean verifyEmail(String email) {
		
		DatabaseManager db = DatabaseManager.getDatabaseManager();
		ResultSet set;
		boolean found = false;
		
		try {
			set = db.query("SELECT id from Gopher.users WHERE email = '" + email + "'");
			found = set.first();
		} catch (SQLException e) {
			
		}
		
		return found;
	}
	
	public static boolean verifyPassword(String email, String password) {
		
		DatabaseManager db = DatabaseManager.getDatabaseManager();
		ResultSet set;
		boolean match = false;
		
		try {
			set = db.query("SELECT password, salt from Gopher.users WHERE email = '" + email + "'");
			
			if(set.first()) {
				String dbPW = set.getString(1);
				String salt = set.getString(2);
				match = Password.encrypt(password, salt).equals(dbPW);
			}
		} catch (SQLException | NoSuchAlgorithmException e) {
			
		}
		
		return match;
	}
	
	/*
	 * Returns null if user isn't found or password isn't correct
	 */
	public static User getUser(String email) {
		
		DatabaseManager db = DatabaseManager.getDatabaseManager();
		StringBuilder sb = new StringBuilder();
		ResultSet userSet;
		User user = null;
		
		sb.append("SELECT id, nameFirst, nameLast,"
				+ " email, addressIDHome, addressIDWork, phoneHome,"
				+ " phoneMobile, phoneWork, dateJoined"
				+ " FROM Gopher.users WHERE email = '");
		sb.append(email);
		sb.append("'");
		
		try {
			userSet = db.query(sb.toString());
			if(userSet.first()) {
				user = new User();
				user.setId(userSet.getInt(1));
				
			}
		} catch (SQLException e) { //exception caused by prepared statment and connection
			
		}
		
		return user;
	}
}
