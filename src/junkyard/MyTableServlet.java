package junkyard;

import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import daos.UserDao;
import javax.servlet.http.HttpServletRequest;

/**
 * Test Servlet to test our the Database Manager class. Does not actually represent any data.
 * THIS CLASS IS USELESS SHIT
 * THIS CLASS IS USELESS SHIT
 * THIS CLASS IS USELESS SHIT
 * THIS CLASS IS USELESS SHIT
 * THIS CLASS IS USELESS SHIT
 * THIS CLASS IS USELESS SHIT
 * THIS CLASS IS USELESS SHIT
 * @author Ian
 *
 */
public class MyTableServlet extends HttpServlet{
	String query = "SELECT * FROM gopher.users;"; /* Sample query to get sample data from sample table */
	//DatabaseManager db = DatabaseManager.getDatabaseManager(); /* Get DB connection */
	
	private UserDao user = new UserDao();
	
	@Override
	/**
	 * Basic post to test Database Manager class
	 * @param req
	 * @param resp
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException{
//		 String n = req.getParameter("username");
//	     String p = req.getParameter("userpass");
//	     
//	     try(ResultSet rs = query(query)){
//			while(rs.next()){
//				System.out.println(rs.getString(1));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
	}
	
}