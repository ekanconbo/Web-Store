package session;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
			connection = DriverManager.getConnection(databaseURL, user, pass);
			
			String username = request.getParameter("userid");
			String password = request.getParameter("passwordinput");
			String rememberme = request.getParameter("rememberme");

			String sql = "SELECT * FROM primetime.account WHERE username = ? and password = ?";
			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			
			String redirect = "\"\"";
			String form = "\"Invalid Username and/or Password\"";

			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next())
			{
				Cookie c = new Cookie("username", username);

				if(rememberme != null)
				{
					c.setMaxAge(24*60*60);
				}
				response.addCookie(c);
				
				redirect = "\"" + request.getParameter("forwardTo") + "\"";
				//RequestDispatcher view = getServletContext().getRequestDispatcher(forwardTo);
				//view.forward(request, response);
			}
	        out.println("{");
	        out.println("\"redirect\" : "+ redirect+",");
	        out.println("\"form\" : "+form);
	        out.println("}");
	        out.close();



			

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

	}
}
