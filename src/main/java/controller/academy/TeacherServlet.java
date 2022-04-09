package controller.academy;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import db.academy.Login;

/**
 * Servlet implementation class TeacherServlet
 */
public class TeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TeacherServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			PrintWriter out = response.getWriter();
			String delete = request.getParameter("tid");
			String name = request.getParameter("tname");
			String email = request.getParameter("temail");
			String subject = request.getParameter("tSubject");
			if (delete != null) {
				Login log = new Login();
				Connection con = log.dbConnection();
				PreparedStatement ps = con.prepareStatement("delete from teacher where id = ?");
				ps.setInt(1, Integer.parseInt(delete));
				int i = ps.executeUpdate();
				if (i > 0) {

					out.println("<script type=\"text/javascript\">");
					out.println("alert('Record Deleted');");
					out.println("location='Teacher.jsp';");
					out.println("</script>");
				}

			} else {

				Login log = new Login();
				Connection con = log.dbConnection();
				System.out.println("teacher add servlet before execute query");
				PreparedStatement ps = con.prepareStatement("insert into teacher values(?,?,?)");
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, subject);
				int i = ps.executeUpdate();
				if (i > 0) {
					RequestDispatcher rd = request.getRequestDispatcher("/Teacher.jsp");
					rd.forward(request, response);
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
