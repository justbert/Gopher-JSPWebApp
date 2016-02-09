package tests;

import static org.junit.Assert.*;

import java.security.NoSuchAlgorithmException;

import org.junit.Test;

import utils.Password;

public class Password_tests {

	@Test
	public void test() {
		
		String password = "PasswordTesting1";
		String[] returns = new String[2];
		
		try{
			returns = Password.encrypt(password);
		} catch (NoSuchAlgorithmException e) {
			
		}
		
		System.out.println("Encrypted password: " + returns[0]);
		System.out.println("Salt: "+returns[1]);
		System.out.println();
		
		String encrypted = new String();
		
		try {
			encrypted = Password.encrypt(password, returns[1]);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("ReEncrypted password: " + encrypted);
		
		if(returns[0].equals(encrypted)) {
			System.out.println("Encryption of passwords match.");
		} else {
			System.out.println("Encryption of passwords does not match.");
		}
	}

}
