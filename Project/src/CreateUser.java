
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateUser
 */
@WebServlet("/CreateUser")
public class CreateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int found = 0;
		Connection conn = null;
		Statement stmt = null;
		
		try {
			String user = request.getParameter("user");
			String pwd = request.getParameter("pwd");
			String lname = request.getParameter("lname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String fname = request.getParameter("fname");
			Class.forName("com.mysql.jdbc.Driver");
			conn = myDriver.getConn();
			Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet rs = st.executeQuery("select * from customer");
			while (rs.next()) {
				String email_id = rs.getString("email");
				if (email_id.equals(email)) {
					request.setAttribute("msg", "Email ID Already Exists!!!");
					request.getRequestDispatcher("create.jsp").forward(request, response);
				}
				String username = rs.getString("username");
				if (username.equals(user)) {
					request.setAttribute("msg", "Username Already Exists!!!");
					request.getRequestDispatcher("create.jsp").forward(request, response);
				}
			}
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			found=stmt.executeUpdate("insert into customer values('"+user+"','"+fname+"','"+lname+"','"+email+"','"+phone+"');");
			stmt.executeUpdate("insert into login values('"+user+"','"+pwd+"');");
			
			if(found!=0){
				request.setAttribute("msg", "Account created");
				request.getRequestDispatcher("Index.jsp").forward(request, response);
			}
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
