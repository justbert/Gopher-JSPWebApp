package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.UserDao;
import daos.ErrandDao;
import daos.RatingDAO;
import entities.Errand;
import entities.Rating;
import entities.User;

/**
 * Servlet implementation class ProfileServlet
 * @author skyet
 */
@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private User viewUser;
	private UserDao userDao = new UserDao();
	private ErrandDao errandDao = new ErrandDao();
	private RatingDAO ratingDao = new RatingDAO();
       
    /** @see HttpServlet#HttpServlet() */
    public ProfileServlet() {
        super();
    }

	/** @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		
		// Get data for the user who's public profile is being viewed
		viewUser = userDao.getUserForID(Integer.parseInt(request.getParameter("id")));
		
		// Errands for which the user id a Customer
		List<Errand> errandsCustomer = errandDao.selectErrandsForUser(viewUser);
		
		// Errands for which the user is a Gopher
		List<Errand> errandsGopher = errandDao.selectErrandsForGopherId(viewUser);
		
		// All ratings for the user as a Customer
		List<Rating> ratingsCustomer = ratingDao.getAllCustomerRatingsById(viewUser.getId());
		
		// Average rating for the user as a Customer
		Float customerRatingAvg = ratingDao.getRatingAverageForCustomerID(viewUser.getId());
		
		// All ratings for the user as a Customer
		List<Rating> ratingsGopher = ratingDao.getAllGopherRatingsById(viewUser.getId());
				
		// Average rating for the user as a Customer
		Float gopherRatingAvg = ratingDao.getRatingAverageForGopherID(viewUser.getId());
		
		try {
			request.setAttribute("viewUser", viewUser);
			request.setAttribute("errandsCustomer", errandsCustomer);
			request.setAttribute("errandsGopher", errandsGopher);
			request.setAttribute("ratingsCustomer", ratingsCustomer);
			request.setAttribute("customerRatingAvg", customerRatingAvg);
			request.setAttribute("ratingsGopher", ratingsGopher);
			request.setAttribute("gopherRatingAvg", gopherRatingAvg);
			request.getRequestDispatcher("/profile.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	/** @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		//doGet(request, response);
	}

}
