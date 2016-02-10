package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class Password {
	
	//Used for user registration
	//Returns a String array with the password, and the salt
	public static String[] encrypt(String pw) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		String[] values = new String[2];
		values[1] = generateSalt();
		
		md.update(values[1].getBytes());
		
		byte[] bytes = md.digest(pw.getBytes());
		
		for(int hashes = 0; hashes < 1234; ++hashes) {
			bytes = md.digest(bytes);
		}
        //This bytes[] has bytes in decimal format;
        //Convert it to hexadecimal format
        StringBuilder sb = new StringBuilder();
        for(int i=0; i< bytes.length ;i++)
        {
            sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
        }
        //Get complete hashed password in hex format
        values[0] = sb.toString();
		
		return values;
	}
	
	//Used for verification of a password
	public static String encrypt(String pw, String salt) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		
		md.update(salt.getBytes());
		
		byte[] bytes = md.digest(pw.getBytes());
		
		for(int hashes = 0; hashes < 1234; ++hashes) {
			bytes = md.digest(bytes);
		}
		
        //This bytes[] has bytes in decimal format;
        //Convert it to hexadecimal format
        StringBuilder sb = new StringBuilder();
        for(int i=0; i< bytes.length ;i++)
        {
            sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
        }
        //Get complete hashed password in hex format
        
        return sb.toString();
	}
	
	private static String generateSalt() throws NoSuchAlgorithmException {
		SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
		byte[] salt = new byte[16];
		sr.nextBytes(salt);
		
		 //This bytes[] has bytes in decimal format;
        //Convert it to hexadecimal format
        StringBuilder sb = new StringBuilder();
        for(int i=0; i< salt.length ;i++)
        {
            sb.append(Integer.toString((salt[i] & 0xff) + 0x100, 16).substring(1));
        }
		
		return sb.toString();
	}
}
