package servlets;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.ErrandDao;
import entities.User;

public class RequestServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4982651932025574846L;

	private ErrandDao errand = new ErrandDao();
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
	}
	
}
