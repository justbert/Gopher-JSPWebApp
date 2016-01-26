package code;


import java.sql.Connection;  
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.mysql.jdbc.Driver;


public class DatabaseManager {
	private Connection conn = null;
	
	public DatabaseManager(){
		String url = "jdbc:mysql://127.0.0.1:3306/";  
        String dbName = "test";
        String driver = "com.mysql.jdbc.Driver";  
        String userName = "root";
        String password = "Redeyes0!";
        
        try {
        	Class.forName("com.mysql.jdbc.Driver").newInstance();
        	Driver dr = (Driver) (Class.forName(driver).newInstance());
        	
            conn = DriverManager.getConnection(url, userName, password);  
        } catch (Exception e) { 
        	System.out.println("TEST");
            e.printStackTrace();
        }
	}

	
	public List<WebDevObby> getResultsFromWebDev(){
		List<WebDevObby> results = new ArrayList<WebDevObby>();
		results.add(new WebDevObby(1, "Ian"));
		return results;
	}
}
