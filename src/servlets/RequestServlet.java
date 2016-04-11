package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import daos.AddressDAO;
import daos.ErrandDAO;
import daos.ErrandDao;
import daos.RewardDAO;
import daos.TaskDAO;
import daos.TasksDao;
import entities.Address;
import entities.Errand;
import entities.Errand.ImportanceType;
import entities.Reward;
import entities.Task;
import entities.User;

public class RequestServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4982651932025574846L;

	private ErrandDao errandDAO = new ErrandDao();
	private RewardDAO rewardDAO = new RewardDAO();
	private AddressDAO addressDAO = new AddressDAO();
	private TasksDao taskDAO = new TasksDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/request.jsp").forward(request, response);
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
				rewardToCreate.setId(rewardDAO.addReward(rewardToCreate));
			
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
			int errandID = 0;
			if (errandToCreate != null)
				errandID = errandDAO.addErrand(errandToCreate);
			
			//Loop for the creation of tasks
			if(errandID != 0)
				for(int taskNum = 1; taskNum <= Integer.parseInt(request.getParameter("numTasks")); ++taskNum) {
					Address address = new Address(
								request.getParameter("addressLine1Task" + taskNum),
								request.getParameter("addressLine2Task" + taskNum),
								request.getParameter("cityTask" + taskNum),
								request.getParameter("provinceTask" + taskNum),
								request.getParameter("countryTask" + taskNum),
								request.getParameter("zipTask" + taskNum),
								Double.parseDouble(request.getParameter("latitudeTask" + taskNum)),
								Double.parseDouble(request.getParameter("longitudeTask" + taskNum)),
								((User)session.getAttribute("userObject")).getId()
							);
					
					//Insert address into database and set the address ID
					address.setId(addressDAO.addAddress(address));
					
					Task task = new Task(
							request.getParameter("taskName" + taskNum),
							request.getParameter("taskDescription" + taskNum),
							null,
							null,
							errandID,
							address
							);
					
					taskDAO.addTask(task);
				}
				
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("/dashboard");
	}
	
}
