import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CancelServlet
 */
@WebServlet("/CancelServlet")
public class CancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CancelServlet() {
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

		try {
			Connection conn = null;
			Class.forName("com.mysql.jdbc.Driver");
			conn = myDriver.getConn();
			java.sql.CallableStatement st = conn.prepareCall("CALL `get_reg`();");
			boolean g = st.execute();
			String username = null;
			if (g) {
				ResultSet rs = st.getResultSet();
				if (rs.next()) {
					username = rs.getString("username");
				}
			}
			ResultSet rs1 = null;
			Statement st1 = null;
			st1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs1 = st1.executeQuery("select * from registers,ground where username='" + username
					+ "' and date is not null and registers.gid=ground.gid;");
			ArrayList<Integer> rid = new ArrayList<>();
			ArrayList<Integer> gid = new ArrayList<>();
			ArrayList<String> sport = new ArrayList<>();
			ArrayList<String> location = new ArrayList<>();
			ArrayList<String> price = new ArrayList<>();
			int found = 0;

			while (rs1.next()) {
				rid.add(rs1.getInt("registers.rid"));	
				price.add(rs1.getString("amount"));
				gid.add(rs1.getInt("registers.gid"));
				sport.add(rs1.getString("sport"));
				location.add(rs1.getString("location"));
				found = 1;

			}

			if (found == 1) {
				request.setAttribute("rid", rid);
				request.setAttribute("gid", gid);
				request.setAttribute("location", location);
				request.setAttribute("sport", sport);
				request.setAttribute("price", price);

				request.getRequestDispatcher("Cancel.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "No records");
				request.getRequestDispatcher("Cancel.jsp").forward(request, response);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
