import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegDetails
 */
@WebServlet("/RegDetails")
public class RegDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection conn = null;
		String str = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = myDriver.getConn();
			java.sql.CallableStatement st1 = conn.prepareCall("CALL `get_reg`();");
			boolean hr = st1.execute();
			if (hr) {
				ResultSet rs2 = st1.getResultSet();
				if (rs2.next()) {
					str ="Registration ID:"+String.valueOf(rs2.getInt("rid"));
					str +="Username:"+rs2.getString("username");
					str +="Ground ID:"+String.valueOf(rs2.getInt("gid"));
					str +="Amount:"+rs2.getString("amount");;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("msg", str);
		request.getRequestDispatcher("Bookings.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
