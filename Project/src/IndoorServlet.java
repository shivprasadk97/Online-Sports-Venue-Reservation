
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
 * Servlet implementation class IndoorServlet
 */
@WebServlet("/IndoorServlet")
public class IndoorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndoorServlet() {
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
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String name=request.getParameter("name");
			Class.forName("com.mysql.jdbc.Driver");
			conn = myDriver.getConn();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery("select * from ground where sport='"+name+"';");
			ArrayList<Integer> gid =new ArrayList<>();
			ArrayList<String> sport =new ArrayList<>();
			ArrayList<String> location =new ArrayList<>();
			ArrayList<String> price =new ArrayList<>();

			
			while (rs.next()) {
				price.add(rs.getString("amount"));
				gid.add(rs.getInt("gid"));
				sport.add(rs.getString("sport"));
				location.add(rs.getString("location"));

			}
			request.setAttribute("gid", gid);
			request.setAttribute("location", location);
			request.setAttribute("sport", sport);
			request.setAttribute("price", price);
			
			request.getRequestDispatcher("Table.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}