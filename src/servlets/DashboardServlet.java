package servlets;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.ErrandDao;
import daos.UserDao;
import entities.User;
import entities.User.UserType;
import entities.Errand;

/**
 * Servlet implementation class DashboardServlet
 * @author skyet
 */
@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
	
	private static final long serialVersionUID = -2915114669209009394L;
	private UserDao userDao = new UserDao();
	private ErrandDao errandDao = new ErrandDao();
	
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
		HttpSession session = request.getSession();
		
		// Until login, just grab a "logged in" user by userId (1-100)
		User user = userDao.getUserForID(5);
				
		List<Errand> errands = errandDao.selectAll();	// Need to implement select user's errands
		errands = 	errands.subList(0, 10);
		
		try {
			request.setAttribute("user", user);
			request.setAttribute("errand", errands);
			request.getRequestDispatcher("dashboard").forward(request, response);
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
