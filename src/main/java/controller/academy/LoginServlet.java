package controller.academy;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.academy.LoginModel;
import db.academy.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.academy.Login;

/**
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	Statement st;
	ServletContext context;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// System.out.println("Inside Init method");

		try {
			// System.out.println("after class");
			context = config.getServletContext();
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			System.out.println("After class  Connection established");
			con = DriverManager.getConnection(context.getInitParameter("url"), context.getInitParameter("username"),
					context.getInitParameter("password"));
			st = con.createStatement();
			// String sql = "select password from login where name = 'admin'";
			// System.out.println(con +" Connection established");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// System.out.println("inside dopost method");
		String username = request.getParameter("uname");
		String password = request.getParameter("pswd");
		String sql = "select password from login where name = '" + username + "'";
		ResultSet rs;

		try {
			rs = st.executeQuery(sql);
			// System.out.println(rs);
			if (rs.next()) {
				if (password.equals(rs.getString("password"))) {
					HttpSession hs = request.getSession();
					hs.setAttribute("username", username);
					// System.out.println("inside password equqal");
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("/dashboard.jsp");
					requestDispatcher.forward(request, response);
				} else {
					request.setAttribute("error", "Invalid Username or Password");
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("/default.jsp");
					requestDispatcher.include(request, response);
				}

			} else {
				request.setAttribute("error", "Invalid Username or Password");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/default.jsp");
				requestDispatcher.include(request, response);
				// requestDispatcher.forward(request, response);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
