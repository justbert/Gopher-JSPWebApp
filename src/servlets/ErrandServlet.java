package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.ErrandDao;
import daos.RatingDAO;
import entities.Errand;
import entities.Rating;

public class ErrandServlet extends javax.servlet.http.HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ErrandDao errandDB = new ErrandDao();
	private RatingDAO ratingDAO = new RatingDAO();
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response){

	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		try {
			//request.setAttribute("errand", errand);
			Errand errand = errandDB.selectById((Integer.parseInt(request.getParameter("id"))));
			request.setAttribute("errand", errand);
			
			//List<Rating> ratings = ratingDAO.getAllRatingsForErrandID(errand.getId());
			//request.setAttribute("ratingsList", ratings);
			
			// Get all ratings for the customer who requested the errand
			List<Rating> ratings = ratingDAO.getAllCustomerRatingsById(errand.getUserIdCustomer().getId());
			request.setAttribute("ratingsList", ratings);
			
			//Float errandRatingAvg = ratingDAO.getRatingAverageForCustomerID(errand.getId());
			//request.setAttribute("errandAverage", errandRatingAvg);
			
			// Get the average rating for the customer who requested the errand
			Integer customerRatingAvg = ratingDAO.getRatingAverageForCustomerID(errand.getUserIdCustomer().getId());
			request.setAttribute("customerAverage", customerRatingAvg);
			
			request.getRequestDispatcher("/errand.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}
