package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import daos.UserDao;
import entities.User;

/**
 * Class which
 * @author Justin
 *
 */
public class LoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private UserDao userDAO = new UserDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int id;
		
		request.removeAttribute("email");
		request.removeAttribute("password");
		
		//Make sure there is an email entered
		if(email.equals("")) {
			session.setAttribute("error", "Please enter a username, or an email.");
			request.getRequestDispatcher("/WEB-INF/login").forward(request, response);
		}
		
		//Verify if the username or password are correct. Actually checking if they aren't valid.
		if((id = userDAO.verifyEmail(email)) == Integer.MIN_VALUE && 
				(id = userDAO.verifyUsername(email)) == Integer.MIN_VALUE) {
			session.setAttribute("error", "The email or username supplied have not been registered.");
			
		}
		
		if(userDAO.verifyPassword(Integer.toString(id), password)) {
			session.setAttribute("loggedIn", true);
			session.setAttribute("userObject", userDAO.getUser(Integer.toString(id)));
			request.getRequestDispatcher("dashboard").forward(request, response);
		} else {
			session.setAttribute("error", "The password supplied is not correct.");
			request.getRequestDispatcher("/login").forward(request, response);
		}
		
	}
}
