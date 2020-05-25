
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
 * Servlet implementation class ReviewsServlet
 */
@WebServlet("/ReviewsServlet")
public class ReviewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReviewsServlet() {
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
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			int rev =Integer.parseInt(request.getParameter("rev"));
			Class.forName("com.mysql.jdbc.Driver");
			conn = myDriver.getConn();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ArrayList<Integer> gid =new ArrayList<>();
			ArrayList<Integer> review =new ArrayList<>();
			if(rev==2)
			{	rs = stmt.executeQuery("select gid,avg(rating) as rating from review group by gid order by gid;");
				while (rs.next()) {
				gid.add(rs.getInt("gid"));
				review.add(rs.getInt("rating"));
				request.setAttribute("gid", gid);
				request.setAttribute("review", review);
			}
			}else{
				rs = stmt.executeQuery("select * from ground;");	
				Integer id=Integer.parseInt(request.getParameter("id"));
				Integer rating=Integer.parseInt(request.getParameter("rating"));
				int found=0;
				while (rs.next()) {
					int temp=rs.getInt("gid");
					if (temp==id) {
							found = 1;
					}
				}
				if(found==1) {
					stmt.executeUpdate("insert into review values("+id+","+rating+");"); 
				}else {
					request.setAttribute("msg", "Invalid Ground ID");
				}
			}request.getRequestDispatcher("Review.jsp").forward(request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

	}

}
