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
 * Servlet implementation class SaveServlet1
 */
@WebServlet("/SaveServlet1")
public class SaveServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveServlet1() {
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
		Fabrication fb=null;
		int i=1;
		String name=request.getParameter("name"+i);
		while(name!=null) {
			String date=request.getParameter("date"+i);
			String purpose=request.getParameter("purpose"+i);
			fb=new Fabrication(emp.persno,date,name,purpose);
			db.AddFabrication(fb);
			i++;
			name=request.getParameter("name"+i);
		}
		RequestDispatcher rd=request.getRequestDispatcher("index4.jsp");
		rd.forward(request, response);
	}

}
