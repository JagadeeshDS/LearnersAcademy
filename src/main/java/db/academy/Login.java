package db.academy;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextAttributeEvent;
import jakarta.servlet.http.HttpServlet;
import model.academy.LoginModel;

public class Login extends HttpServlet{
	ServletContext context;
	Connection con;
	Statement st;
	
	
	public Connection dbConnection()
	{
		System.out.println("Login class");
		
//		ServletContext context=getServletContext();
//		String driverName=context.getInitParameter("url");
		
		try {
			String url = "jdbc:sqlserver://LAPTOP-UHCHDTEN\\\\MSSQLSERVER:1434;databaseName=LearnersAcademy";
			String username = "sa";
			String password = "jaggu";

			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			System.out.println("After class  Connection established");
			con = DriverManager.getConnection(url,username,password);
			 
			 //String sql = "select password from login where name = 'admin'";
			return con;
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
		
	}

	public boolean Login()
	{
		
		return false;
	}

}
