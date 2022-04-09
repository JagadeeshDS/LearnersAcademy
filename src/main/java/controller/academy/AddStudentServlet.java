package controller.academy;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.academy.Student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import db.academy.Login;

/**
 * Servlet implementation class AddStudentServlet
 */
public class AddStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con;
	Statement st;
	ServletContext context;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddStudentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		try {
			context = config.getServletContext();
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(context.getInitParameter("url"), context.getInitParameter("username"),
					context.getInitParameter("password"));
			st = con.createStatement();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String delete = request.getParameter("stuid");
		if (delete != null) {
			try {
				PreparedStatement ps = con.prepareStatement("delete from student where id = ?");
				ps.setInt(1, Integer.parseInt(delete));
				int i = ps.executeUpdate();
				if (i > 0) {

					out.println("<script type=\"text/javascript\">");
					out.println("alert('Record Deleted');");
					out.println("location='Student.jsp';");
					out.println("</script>");
				}

			} catch (Exception e) {
				// TODO: handle exception
			}

		} else {
			String name = request.getParameter("sname");
			String age = request.getParameter("sage");
			String location = request.getParameter("slocation");
			String state = request.getParameter("sstate");
			String email = request.getParameter("semail");
			String subject = request.getParameter("ssubject");

			try {
				PreparedStatement ps = con.prepareStatement("insert into student values(?,?,?,?,?,?)");
				ps.setString(1, name);
				ps.setString(2, age);
				ps.setString(3, location);
				ps.setString(4, state);
				ps.setString(5, email);
				ps.setString(6, subject);
				int i = ps.executeUpdate();
				if (i > 0) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Record Inserted');");
					out.println("location='Student.jsp';");
					out.println("</script>");

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
