package daos;

import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;

import entities.User;
import utils.DatabaseManager;
import utils.Password;

public class UserDao extends DatabaseManager {

	//protected DatabaseManager db = DatabaseManager.getDatabaseManager();
	/*
	 * Verifies if the username supplied has been registered.
	 */
	public boolean verifyEmail(String email) {

		//DatabaseManager db = DatabaseManager.getDatabaseManager();
		ResultSet set;
		boolean found = false;

		try {
			set = query("SELECT id from Gopher.users WHERE email = '" + email + "'");
			found = set.first();
		} catch (SQLException e) {

		}

		return found;
	}

	public boolean verifyPassword(String email, String password) {

		//DatabaseManager db = DatabaseManager.getDatabaseManager();
		ResultSet set;
		boolean match = false;

		try {
			set = query("SELECT password, salt from Gopher.users WHERE email = '" + email + "'");

			if(set.first()) {
				String dbPW = set.getString(1);
				String salt = set.getString(2);
				match = Password.encrypt(password, salt).equals(dbPW);
			}
		} catch (SQLException | NoSuchAlgorithmException e) {

		}

		return match;
	}

	public boolean registerUser(String email, String password) {


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
		
		
		
//PROBLEMATIC CODE, UPDATE IS NOT A THING
//		try {
//			if(update(sb.toString()) > 0)
//				registered = true;
//		} catch (SQLException e) {
//
//		}

		return registered;
	}

	/*
	 * Returns null if user isn't found or password isn't correct
	 */
	public User getUser(String email) {

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
			userSet = query(sb.toString());
			if(userSet.first()) {
				user = new User();
				user.setId(userSet.getInt(1));

			}
		} catch (SQLException e) { //exception caused by prepared statment and connection

		}

		return user;
	}

}