package product;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.text.ParsePosition;
import java.util.Scanner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    //Checks if string is an int
	public static boolean isInteger(String s, int radix) {
	    Scanner sc = new Scanner(s.trim());
		try{
		    if(!sc.hasNextInt(radix)) return false;
		    // we know it starts with a valid int, now make sure
		    // there's nothing left!
		    sc.nextInt(radix);
		    return !sc.hasNext();
		} finally
		{
			sc.close();
		}
	}
	
	//Checks if string is in decimal format
	public static boolean isNumeric(String str)
	{
	  NumberFormat formatter = NumberFormat.getInstance();
	  ParsePosition pos = new ParsePosition(0);
	  formatter.parse(str, pos);
	  return str.length() == pos.getIndex();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String jdbcDriver = "com.mysql.jdbc.Driver";
		final String databaseURL = "jdbc:mysql://54.68.205.239:3306/primetime";
		
		final String user = "Justin";
		final String pass = "PrimetimeGames";
		
		final String id = request.getParameter("productID");
		final String name = request.getParameter("productName");
		final String price = request.getParameter("productPrice");
		final String imagesrc = request.getParameter("productImagesrc");
		final String category = request.getParameter("productCategory");
		final String quantity = request.getParameter("productQuantity");


		try {
			
			Class.forName(jdbcDriver);
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			connection = DriverManager.getConnection(databaseURL, user, pass);
			String sql = "INSERT INTO primetime.product (id, name, price, imagesrc, category, quantity) VALUES (?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			
			if(quantity != null)
			{
				if(isInteger(quantity, 10))
				{
					preparedStatement.setInt(6, Integer.parseInt(quantity));

				}
				else
					System.out.println("Invalid");

			}
			else
				preparedStatement.setNull(6, java.sql.Types.NUMERIC);

			
			BigDecimal d;

			if(price != null)
			{
				if(isNumeric(price)){
					d = new BigDecimal(price);
					d = d.setScale(2, RoundingMode.CEILING); //Trims extraneous decimal values (e.g. 600.333 becomes 600.33)
					preparedStatement.setBigDecimal(3, d);
				}
				else
				{
					System.out.println("Invalid");
				}

			}
			else
			{
				System.out.println("Invalid");
			}
			if(imagesrc.equals(""))
				preparedStatement.setString(4, "http://52.88.249.233/Magic_Store/images/sale/no-image-available.jpg");
			else
				preparedStatement.setString(4, imagesrc);

			
			preparedStatement.setString(1, id);
			preparedStatement.setString(2, name);
			if(category != "")
				preparedStatement.setString(5, category);
			else
				preparedStatement.setString(5, "All");
			
			//Execute insert SQL statement
			preparedStatement.executeUpdate();
			
			String forwardTo= request.getParameter("forwardTo");
			RequestDispatcher view = getServletContext().getRequestDispatcher(forwardTo);
			view.forward(request, response);

			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

}
