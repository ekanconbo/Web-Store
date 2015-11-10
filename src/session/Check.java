package session;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Servlet implementation class Check
 */
@WebServlet("/Check")
public class Check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Check() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("you made it");
		final String jdbcDriver = "com.mysql.jdbc.Driver";
		final String databaseURL = "jdbc:mysql://54.68.205.239:3306/primetime";
		
		final String user = "Justin";
		final String pass = "PrimetimeGames";
		
		final String username = request.getParameter("data");
		
		try {
			Class.forName(jdbcDriver);
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			connection = DriverManager.getConnection(databaseURL, user, pass);
			String sql = "SELECT FROM primetime.account (username, password, email) WHERE username = ?";
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, username);
			
			//Execute SQL statement
			int x = preparedStatement.executeUpdate();
			if(x != 0)
				System.out.println("hello");
			/*
			response.setContentType("text/plain");
			PrintWriter out = response.getWriter();
			out.print("available");
			out.flush();*/
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
