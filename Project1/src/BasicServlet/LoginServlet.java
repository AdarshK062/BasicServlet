package BasicServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId=request.getParameter("userId");
		String password=request.getParameter("password");
		DBConnect db=new DBConnect();
		Employee emp=db.LoginStatus(userId,password);
		if(emp==null) {
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.println("login failed<br>user not found with<br>");
			out.println("userId: "+userId+"<br>");
			out.println("password: "+password+"<br>");
			out.println("<a href='./index.jsp'>login again</a>");
		}
		else {
			HttpSession session= request.getSession(true);
			session.setAttribute("db", db);
			session.setAttribute("emp", emp);
			RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);
		}
	}
}
