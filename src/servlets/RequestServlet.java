package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import daos.ErrandDao;
import daos.RewardDAO;
import entities.Errand;
import entities.Errand.ImportanceType;
import entities.Reward;
import entities.User;

public class RequestServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4982651932025574846L;

	private ErrandDao errand = new ErrandDao();
	private RewardDAO reward = new RewardDAO();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/request.jsp").forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		HttpSession session = request.getSession();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		
		Errand errandToCreate = null;
		Reward rewardToCreate = null;
		
		try {
			
			// Get form data to create reward object
			rewardToCreate = new Reward(
					request.getParameter("rewardName"),
					request.getParameter("rewardDescription"),
					Integer.parseInt(request.getParameter("rewardValue"))
				);
			
			// Insert reward object in database, retrieve and set auto-generated id (needed by errand object)
			if (rewardToCreate != null)
				rewardToCreate.setId(reward.addReward(rewardToCreate));
			
			// Get form data to create errand object
			errandToCreate = new Errand(
					request.getParameter("errandName"),
					request.getParameter("errandDescription"),
					fmt.parse(request.getParameter("deadline")),
					ImportanceType.getImportanceType(Integer.parseInt(request.getParameter("importance"))),
					(User)session.getAttribute("userObject"),
					rewardToCreate
				);
			
			// Insert errand object in database
			if (errandToCreate != null)
				errand.addErrand(errandToCreate);
			
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
	}
	
}
