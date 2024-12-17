import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Welcome")
public class Welcome extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Connection Success");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookproject","root","Harshal@1402");
			System.out.println("Connection Success");
			
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select * from book;");
			
			HttpSession session=req.getSession();
			session.setAttribute("rs", rs);
			
			resp.sendRedirect("Welcome.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e+"in welcome.java page");
		}
	}
}