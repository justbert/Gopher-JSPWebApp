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
     
     protected DatabaseManager(){
    	 
    	String url, dbName, driver, userName, password;
    	 
		try(Scanner input = new Scanner(new FileReader("C:/RemoteServerConfig.txt"))) {

			url = input.nextLine(); 
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
     
     protected static DatabaseManager getDatabaseManager(){
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
     protected ResultSet query(String queryString, Object... parameters) throws SQLException{
		 /*
		  * should a pst be passed as a parameter so that it can be reused multiple times if the
		  * class performing the search can use it multiple times, or is it stashed on the DB
		  * somehow?
		  */
		 PreparedStatement pst = null;
         pst = conn.prepareStatement(queryString);
         for(int i = 1; i <= parameters.length; i++)
        	 if (parameters[i-1] != null)
        		 pst.setObject(i, parameters[i - 1]);
         
         return pst.executeQuery();
	 }
	 
	 /**
	  * Query overload for no parameters
	  * @param queryString
	  * @return
	  * @throws SQLException
	  */
	 protected ResultSet query(String queryString) throws SQLException{
		 return query(queryString, new String[0]);
	 }
	 
	 /**
	  * Update for DELETE, INSERT, UPDATE functionality that returns int # of rows effected.
	  * @param queryString
	  * @param parameters
	  * @return
	  * @throws SQLException
	  */
	 protected int update(String queryString, String... parameters) throws SQLException{
		 /*
		  * Since delete, insert, and update don't return result sets, they return an int for number of rows effected.
		  * Thus, executeUpdate is needed instead of executeQuery for these operations.
		  */
		 PreparedStatement pst = null;
         pst = conn.prepareStatement(queryString);
         for(int i = 1; i <= parameters.length; i++)
        	 pst.setObject(i, parameters[i-1]);
         
         return pst.executeUpdate();
	 }
	 
	 /**
	  * Update for INSERT functionality that returns int # of rows effected.
	  * Accepts an Object[] composed of the data to map to the new database entry
	  * @param queryString Defines the query with placeholder for Object data
	  * @param parameters The Object containing the values to insert into the database
	  * @return the number of rows effected
	  * @throws SQLException
	  */
	 protected int update(String queryString, Object... parameters) throws SQLException{
		 PreparedStatement pst = null;
         pst = conn.prepareStatement(queryString);
         for(int i = 1; i <= parameters.length; i++)
        	 pst.setObject(i, parameters[i-1]);
         
         return pst.executeUpdate();
	 }
	 
	 /**
	  * close the connection
	  * @throws SQLException
	  */
	 protected void close() throws SQLException{
		 if(conn != null)
			 conn.close();
	}
}
