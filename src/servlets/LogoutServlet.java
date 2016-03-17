package servlets;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3792047100550048731L;
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response){
		//NO POST ACTIONs
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		
		if((Boolean)session.getAttribute("loggedIn")) {
			Enumeration<String> names = session.getAttributeNames();
			
			while(names.hasMoreElements()) {
				session.removeAttribute(names.nextElement());
			}
			session.invalidate();
			try {
				response.sendRedirect("index");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
