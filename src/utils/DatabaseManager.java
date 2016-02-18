package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 
 * @author Ian
 *
 */
public class DatabaseManager {
	private static final DatabaseManager db = new DatabaseManager(); /* thread-safe singletop instatiation of connection */
	private Connection conn = null;
     
     private DatabaseManager(){
    	 String url = "jdbc:mysql://localhost:8888/";  
         String dbName = "gopher";  
         String driver = "com.mysql.jdbc.Driver";  
         String userName = "GopherAdmin";  	/* Temporary Login */
         String password = "Gophers"; /* Temporary Password*/ 
         
         try {
             Class.forName(driver).newInstance();  /* Reflect database driver */
             conn = DriverManager.getConnection(url + dbName, userName, password); 
         } catch (Exception e) {
             System.out.println(e);
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
}