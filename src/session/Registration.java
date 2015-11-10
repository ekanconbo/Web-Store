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
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String jdbcDriver = "com.mysql.jdbc.Driver";
		final String databaseURL = "jdbc:mysql://54.68.205.239:3306/primetime";
		
		final String user = "Justin";
		final String pass = "PrimetimeGames";
		
		try {
			Class.forName(jdbcDriver);
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			connection = DriverManager.getConnection(databaseURL, user, pass);
			String sql = "INSERT INTO primetime.account (username, password, email) VALUES (?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, "jousting");
			preparedStatement.setString(2, "Turtleman");
			preparedStatement.setString(3, "Justin@Justin.jmail.kong");
			
			//Execute insert SQL statement
			//preparedStatement.executeUpdate();
			System.out.println("hello");
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		
		final PrintWriter out = response.getWriter();
        String name = request.getParameter("user");
        out.println("Hello, " + name);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
