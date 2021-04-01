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
 * Servlet implementation class UpdateServlet1
 */
@WebServlet("/UpdateServlet1")
public class UpdateServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet1() {
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
		
		Fabrication fb=new Fabrication(emp.persno,(String)request.getParameter("visit_date"),(String)request.getParameter("industry"),(String)request.getParameter("purpose"));
		db.UpdateFabrication(fb);
		s.setAttribute("upd", 1);
		RequestDispatcher rd=request.getRequestDispatcher("index6.jsp");
		rd.forward(request, response);
	}

}
