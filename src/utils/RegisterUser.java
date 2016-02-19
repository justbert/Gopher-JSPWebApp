package utils;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

public class RegisterUser {

	public static boolean registerUser(String email, String password) {
		
		DatabaseManager db = DatabaseManager.getDatabaseManager();
		boolean registered = false;
		StringBuilder sb = new StringBuilder();
		String passwordAndSalt[] = new String[2];
		
		sb.append("INSERT INTO users (email, password, salt) VALUES ('");
		sb.append(email);
		sb.append("','");
		
		try {
			passwordAndSalt = Password.encrypt(password);
		} catch (NoSuchAlgorithmException e) {
			
		}
		
		sb.append(passwordAndSalt[0]);
		sb.append("','");
		sb.append(passwordAndSalt[1]);
		sb.append("');");
		
		try {
			if(db.update(sb.toString()) > 0)
				registered = true;
		} catch (SQLException e) {
			
		}
		
		return registered;
	}
	
	public static boolean verifyEmail(String email) {
		return Login.verifyEmail(email);
	}
}
