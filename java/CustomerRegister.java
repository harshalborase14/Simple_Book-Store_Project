import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomerRegister")
public class CustomerRegister extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
	    String customerName = req.getParameter("name");
	    String phoneNo = req.getParameter("phone");
	    String address = req.getParameter("addr");
	    String orderDate = req.getParameter("date");
	    Date dt=java.sql.Date.valueOf(orderDate);
	    String bookId = (String) session.getAttribute("bid");
	    String qty = (String) session.getAttribute("Qty");
	    int qt1 = Integer.parseInt(qty);
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in CustomerRegister.java");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookproject","root","Harshal@1402");
			System.out.println("Connection success in CustomerRegister.java");
			
			PreparedStatement pstm=con.prepareStatement("insert into customer_details(customer_Name,phoneNo,Address,qty,Book_Id,order_Date) values(?,?,?,?,?,?);");
			
			pstm.setString(1, customerName);
	        pstm.setString(2, phoneNo);
	        pstm.setString(3, address);
	        pstm.setInt(4, qt1);
	        pstm.setString(5, bookId);
	        pstm.setDate(6, (java.sql.Date) dt);
//	        pstm.setDate(6, java.sql.Date.valueOf("2024-06-03"));
	        
	        int i = pstm.executeUpdate();
	        if(i!=0)
	        {
		        System.out.println("Customer registered successfully!");
		        resp.sendRedirect("ThankYou.jsp");
	        }
	        else
	        {
	        	System.out.println("Error");
	        }
		}
		catch(Exception e)
		{
			System.out.println(e+"in CustomerRegister.java");
		}
	}
}
