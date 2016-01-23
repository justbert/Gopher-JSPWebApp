package code;


import java.sql.Connection;  
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.mysql.jdbc.Driver;


public class DatabaseManager {
	private static DatabaseManager db = new DatabaseManager();
	private Connection conn = null;  
	
	private DatabaseManager(){
		String url = "jdbc:mysql://localhost:3306/";  
        String dbName = "test";  
        String driver = "com.mysql.jdbc.Driver";  
        String userName = "root";  
        String password = "Redeyes0!";
        
        try {  
            Driver d = new Driver();
            conn = DriverManager.getConnection(url + dbName, userName, password);  
        } catch (Exception e) {  
            e.printStackTrace();
        }
	}
	
	public static DatabaseManager getDatabaseManager(){
		return db;
	}
	
	public List<WebDevObby> getResultsFromWebDev(){
		List<WebDevObby> results = new ArrayList<WebDevObby>();
		ResultSet rs = null;
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM test.webdev;");
			ps.executeQuery();
			rs = ps.getResultSet();
			while(rs.next()){
				results.add(new WebDevObby(rs.getInt(1), rs.getString(2)));
			}
			if(rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return results;
	}
}
