package BasicServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession s= request.getSession(true);
		Employee emp=(Employee) s.getAttribute("emp");
		DBConnect db=(DBConnect)s.getAttribute("db");
		
		WorkProgress wpr=new WorkProgress(emp.persno,(String)request.getParameter("wpd"),(String)request.getParameter("projectId"),(String)request.getParameter("projectName"),(String)request.getParameter("projectDesc"),(String)request.getParameter("status"),(String)request.getParameter("PDC"));
		db.UpdateWorkProgress(wpr);
		RequestDispatcher rd=request.getRequestDispatcher("index3.jsp");
		rd.forward(request, response);
	}

}
