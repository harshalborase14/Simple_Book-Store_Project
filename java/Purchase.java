import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Purchase")
public class Purchase extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		String bkid = (String) session.getAttribute("bid");
		System.out.println("Book ID in purchase servlet "+bkid);
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookproject","root","Harshal@1402");
			System.out.println("Connection Success");
			
			PreparedStatement pstm =con.prepareStatement("select * from book where book_ID=?;");
			pstm.setString(1, bkid);
			
			ResultSet rs = pstm.executeQuery();
			System.out.println("Data in Purchase page");
			
			session.setAttribute("rs1",rs);
			
			resp.sendRedirect("PurchasePage.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e+"In purchase.java page");
		}
		
	}

}
