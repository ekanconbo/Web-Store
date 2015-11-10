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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
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
			Statement statement = null;
			
			connection = DriverManager.getConnection(databaseURL, user, pass);				

			String sql = "SELECT * FROM primetime.account";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			ResultSet rs = preparedStatement.executeQuery(sql);
			rs.next();
			rs.next();
			String name = rs.getString("username");
			System.out.println("name: " + name);
			
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
