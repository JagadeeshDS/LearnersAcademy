package controller.academy;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import db.academy.Login;

/**
 * Servlet implementation class SubjectServlet
 */
public class SubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside Subject add servlet");
		String name = request.getParameter("Sname");
		String time = request.getParameter("Stime");
		try {
			Login log = new Login();
			Connection con = log.dbConnection();
			PreparedStatement ps = con.prepareStatement("insert into subject values(?,?)");
			ps.setString(1, name);
			ps.setString(2, time);
			int i = ps.executeUpdate();
			if (i>0) {
				RequestDispatcher rd = request.getRequestDispatcher("/Subject.jsp");
				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
