package utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;


/**
 * 
 * @author Ian
 *
 */
/*
 * MODIFIED BY JUSTIN
 * Made it so that you can keep a local severConfig.txt with the info for connecting to your server.
 * Make a text file with the following info:
 * 
 * url
 * dbname
 * driver
 * username
 * password
 * 
 * Example:
	jdbc:mysql://localhost:8888/
	gopher
	com.mysql.jdbc.Driver
	GopherAdmin
	Gophers
	
	File locations (for when stuff gets repulled):
	Justin's file location:
	C:/Users/Justin/Dropbox/College/Level 5/Web Application Dev/Project/serverConfig.txt
 */
public class DatabaseManager {
	private static final DatabaseManager db = new DatabaseManager(); /* thread-safe singletop instatiation of connection */
	private Connection conn = null;
     
     private DatabaseManager(){
    	 
    	String url, dbName, driver, userName, password;
    	 
		try(Scanner input = new Scanner(new FileReader(new File("C:/Users/Justin/Dropbox/College/Level 5/Web Application Dev/Project/serverConfig.txt")))) {
			url = input.nextLine();  
			
			System.out.println("URL: " + url);
	        dbName = input.nextLine();  
	        driver = input.nextLine();  
	        userName = input.nextLine();
	        password = input.nextLine();
	         
	        Class.forName(driver).newInstance();  /* Reflect database driver */
            conn = DriverManager.getConnection(url + dbName, userName, password); 
            
		} catch(FileNotFoundException ex) {
			System.out.println("File not found: " + ex.getMessage());
		} catch(IOException ex) {
			System.out.println("IOException: " + ex.getMessage());
		} catch(Exception e) {
			
		} 
        
     }
     
     public static DatabaseManager getDatabaseManager(){
    	 return db;
     }
     
     /**
      * Wrapper method for any raw SQL query, wraps the SQL in prepared statements
      * to protect against injection.
      * @param queryString
      * @param parameters Variable length parameters as strings
      * @return ResultSet of the query
      * @throws SQLException
      */
	 public ResultSet query(String queryString, String... parameters) throws SQLException{
		 /*
		  * should a pst be passed as a parameter so that it can be reused multiple times if the
		  * class performing the search can use it multiple times, or is it stashed on the DB
		  * somehow?
		  */
		 PreparedStatement pst = null;
         pst = conn.prepareStatement(queryString);
         for(int i = 1; i <= parameters.length; i++)
        	 pst.setObject(i, parameters[i]);
         
         return pst.executeQuery();
	 }
	 
	 /**
	  * Query overload for no parameters
	  * @param queryString
	  * @return
	  * @throws SQLException
	  */
	 public ResultSet query(String queryString) throws SQLException{
		 return query(queryString, new String[0]);
	 }
	 
	 /**
	  * close the connection
	  * @throws SQLException
	  */
	 public void close() throws SQLException{
		 if(conn != null)
			 conn.close();
	 }
	 
	 public int update(String updateString) throws SQLException {
		 PreparedStatement pst = null;
         pst = conn.prepareStatement(updateString);
         
         return pst.executeUpdate();
	 }
}