
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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		response.getWriter().append("Served at: hffhgf").append(request.getContextPath());

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
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		ResultSet rs = null;
		try {
			System.out.println("jhjkjhjkjhkjhkjh");
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = myDriver.getConn();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery("select * from login");	
			// rs.first();
			while (rs.next()) {
				
				String username = rs.getString("username");
				String password = rs.getString("password");
				if (username.equals(user)) {
					if (password.equals(pwd)) {
						found = 1;
					}
				}
			}

			String msg = null;
			if (found == 1) {
				stmt.executeUpdate("delete from registers where date is null;");
				stmt.executeUpdate("insert into registers(username) values('"+user+"');");
				request.getRequestDispatcher("LogPage.jsp").forward(request, response);
			} else {
				msg = "Invalid Username or Password!!";
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("Index.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
