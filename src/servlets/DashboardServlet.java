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
import daos.RatingDAO;
import daos.UserDao;
import entities.User;
import entities.User.UserType;
import entities.Errand;
import entities.Rating;

/**
 * Servlet implementation class DashboardServlet
 * @author skyet
 */
@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
	
	private static final long serialVersionUID = -2915114669209009394L;
	private User user;
	private UserDao userDao = new UserDao();
	private ErrandDao errandDao = new ErrandDao();
	private RatingDAO ratingDao = new RatingDAO();
	
	/** @see HttpServlet#HttpServlet() */
    public DashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	/** @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		// If user isn't logged in, redirect them to login page
		if (session.getAttribute("loggedIn") == null) {
			try {
				response.sendRedirect("login");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		user = (User) session.getAttribute("userObject");
		
		// If user is logged in, continue
		List<Errand> errandsCustomer = errandDao.selectErrandsForUser((User)session.getAttribute("userObject"));
		List<Errand> errandsGopher = errandDao.selectErrandsForGopherId((User)session.getAttribute("userObject"));
		List<Rating> ratingsCustomer = ratingDao.getAllCustomerRatingsById(user.getId());
		
		try {
			request.setAttribute("errandsCustomer", errandsCustomer);
			request.setAttribute("errandsGopher", errandsGopher);
			request.setAttribute("ratingsCustomer",  ratingsCustomer);
			request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	
	/** @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
