package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseManager {
	private static final DatabaseManager db = new DatabaseManager();
	private Connection conn = null;
     
     private DatabaseManager(){
    	 String url = "jdbc:mysql://localhost:3306/";  
         String dbName = "form";  
         String driver = "com.mysql.jdbc.Driver";  
         String userName = "root";  
         String password = "Redeyes0!";
         
         try {
             Class.forName(driver).newInstance();  
             conn = DriverManager.getConnection(url + dbName, userName, password);
         } catch (Exception e) {
             System.out.println(e);
         }
     }
     
     public static DatabaseManager getDatabaseManager(){
    	 return db;
     }
     
	 public ResultSet query(String queryString, String... parameters) throws SQLException{
		 PreparedStatement pst = null;
         pst = conn.prepareStatement(queryString);
         for(int i = 1; i <= parameters.length; i++)
        	 pst.setObject(i, parameters[i]);
         
         return pst.executeQuery();
	 }
	 
	 public ResultSet query(String queryString) throws SQLException{
		 return query(queryString, new String[0]);
	 }
	 
	 public void close() throws SQLException{
		 if(conn != null)
			 conn.close();
	 }
}