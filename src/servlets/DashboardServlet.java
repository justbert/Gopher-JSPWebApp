package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.UserDao;
import entities.User;

/**
 * Servlet implementation class DashboardServlet
 * @author skyet
 */
@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
	
	private static final long serialVersionUID = -2915114669209009394L;
	private UserDao userDao = new UserDao();
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		
		// Until login capabilities, just grab a "logged in" user by userId (1-100)
		User user = userDao.getUserForID(5);	
		
		try {
			request.setAttribute("user", user);
			request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
