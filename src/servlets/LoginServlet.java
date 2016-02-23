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

	private UserDao user = new UserDao();

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		if(email != null) {
			if(user.verifyEmail(email)) {
				if(user.verifyPassword(email, request.getParameter("password"))) {
					User current = user.getUser(email);
					if(current != null) {
						session.setAttribute("userObject", current);
					}
					response.sendRedirect("dashboard.jsp");
				} else {
					
					out.print("<script type=\"text/javascript\">");
					out.print("alert(\"Password is incorrect. Please try again.\");");
							out.print("</script>");
					
				}
			} else if(email.equals("")) {
				
				out.print("<script type=\"text/javascript\">");
						out.print("alert(\"Please enter an email.\");");
								out.print("</script>");
				
			} else {
				
				out.print("<script type=\"text/javascript\">");
				out.print("alert(\"This email has not been registered.\");");
				out.print("</script>");
				
			}
		}
	}
}
