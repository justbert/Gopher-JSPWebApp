package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ErrandDao;
import entities.Errand;

public class BrowseServlet extends javax.servlet.http.HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3792047100550048731L;
	private ErrandDao errandDB = new ErrandDao();
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response){
		//NO POST ACTION
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		List<Errand> errands = errandDB.select12Latest();
		List<Errand> allErrands = errandDB.selectAll(); //this needs to be only all active errands
		//errands = 	errands.subList(0, 10);
		try {
			request.setAttribute("errandList", errands);
			request.setAttribute("allErrands", allErrands);
			request.getRequestDispatcher("WEB-INF/browse.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
}
