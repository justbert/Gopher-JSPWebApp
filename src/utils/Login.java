package utils;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

import models.User;

public class Login implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6644701565716079079L;

	public static User login(String username, String password) {
		
		DatabaseManager db = DatabaseManager.getDatabaseManager();
		StringBuilder sb = new StringBuilder();
		ResultSet userSet;
		
		sb.append("SELECT password FROM Gopher.users WHERE username = '");
		sb.append(username);
		
		try {
			userSet = db.query(sb.toString());
		} catch (SQLException e) {
			
		}
		
		userSet.
		
		return null;
	}
}
