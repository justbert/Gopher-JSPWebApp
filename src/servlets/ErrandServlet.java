package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		//NO POST ACTION
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		try {
			//request.setAttribute("errand", errand);
			Errand errand = errandDB.selectById((Integer.parseInt(request.getParameter("id"))));
			request.setAttribute("errand", errand);
			
			List<Rating> ratings = ratingDAO.getAllRatingsForErrandID(errand.getId());
			request.setAttribute("ratingsList", ratings);
			
			Float errandRatingAvg = ratingDAO.getRatingAverageForErrandID(errand.getId());
			request.setAttribute("errandAverage", errandRatingAvg);
			
			request.getRequestDispatcher("/errand.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}
