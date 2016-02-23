package daos;

import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;

import entities.User;
import utils.DatabaseManager;
import utils.Password;

public class UserDao extends DatabaseManager {
	private static final String select_VerifyEmail = "SELECT id from Gopher.users WHERE email = ?";
	private static final String select_VerifyPassword = "SELECT password, salt from Gopher.users WHERE email = ?";
	private static final String insert_RegisterUser = "INSERT INTO users (email, password, salt) VALUES (?, ?, ?)";
	private static final String select_getUser = "SELECT id, nameFirst, nameLast, email, addressIDHome, addressIDWork, phoneHome, phoneMobile, phoneWork, dateJoined FROM Gopher.users WHERE email = ?";
	
	/*
	 * Verifies if the username supplied has been registered.
	 */
	public boolean verifyEmail(String email) {

		//DatabaseManager db = DatabaseManager.getDatabaseManager();
		ResultSet set;
		boolean found = false;

		try(ResultSet rs = query(select_VerifyEmail, email)){
			return rs.first();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return found;
	}

	public boolean verifyPassword(String email, String password) {
		try(ResultSet set = query(select_VerifyPassword, email)){
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
	
	public boolean registerUser(String email, String password) {
		boolean registered = false;
		StringBuilder sb = new StringBuilder();
		String passwordAndSalt[] = new String[2];
		
		try {
			passwordAndSalt = Password.encrypt(password);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		try {
			if(update(insert_RegisterUser, email, passwordAndSalt[0], passwordAndSalt[1]) > 0)
				registered = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return registered;
	}

	/*
	 * Returns null if user isn't found or password isn't correct
	 */
	public User getUser(String email) {
		StringBuilder sb = new StringBuilder();
		User user = null;

		try(ResultSet userSet = query(select_getUser)){
			if(userSet.first()) {
				user = new User();
				user.setId(userSet.getInt(1));
			}
		} catch (SQLException e) { //exception caused by prepared statment and connection
			e.printStackTrace();
		}
		return user;
	}

}