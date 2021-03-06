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
 * Servlet implementation class SaveServlet
 */
@WebServlet("/SaveServlet")
public class SaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveServlet() {
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
		WorkProgress wpr=null;
		int i=1;
		String projectId=request.getParameter("projectId"+i);
		while(projectId!=null) {
			String projectName=request.getParameter("projectName"+i);
			String projectDesc=request.getParameter("projectDesc"+i);
			String WPDate=request.getParameter("WPDate"+i);
			String status=request.getParameter("status"+i);
			String PDC=request.getParameter("PDC"+i);
			wpr=new WorkProgress(emp.persno,WPDate,projectId,projectName,projectDesc,status,PDC);
			db.AddWorkProgress(wpr);
			i++;
			projectId=request.getParameter("projectId"+i);
		}
		RequestDispatcher rd=request.getRequestDispatcher("index1.jsp");
		rd.forward(request, response);
	}
}
