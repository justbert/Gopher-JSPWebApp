package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import utils.DatabaseManager;

import javax.servlet.http.HttpServletRequest;

/**
 * Test Servlet to test our the Database Manager class. Does not actually represent any data.
 * @author Ian
 *
 */
public class MyTableServlet extends HttpServlet{
	String query = "SELECT * FROM gopher.mytable;"; /* Sample query to get sample data from sample table */
	DatabaseManager db = DatabaseManager.getDatabaseManager(); /* Get DB connection */
	
	
	@Override
	/**
	 * Basic post to test Database Manager class
	 * @param req
	 * @param resp
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		 String n = req.getParameter("username");
	     String p = req.getParameter("userpass");
	     
	     try(ResultSet rs = db.query(query)){
			while(rs.next()){
				System.out.println(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}