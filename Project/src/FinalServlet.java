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
 * Servlet implementation class FinalServlet
 */
@WebServlet("/FinalServlet")
public class FinalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FinalServlet() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		Connection conn = null;
		String amt=null;
		String str = null;
			String date = (request.getParameter("date"));
			String time = (request.getParameter("time"));
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = myDriver.getConn();
				
				int found=0;
				Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);	
				Statement st1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);	
				java.sql.CallableStatement st3 = conn.prepareCall("CALL `get_reg`();");
				boolean g = st3.execute();
				int gid = 0;
				if (g) {
					ResultSet rs2 = st3.getResultSet();
					if (rs2.next()) {
					 	gid =rs2.getInt("gid");
					}
				ResultSet rs=st.executeQuery("select * from registers where time is not null;");
				while (rs.next()) {
					int gid1 = rs.getInt("gid");			
					String date1 = rs.getString("date");
					String time1 = rs.getString("time");
					
					if(gid==gid1) {
						if (time1.equals(time)) {
							if (date1.equals(date)) {
								found = 1;
							}
						}
					}			
				}
				
				if (found==0) {
				st.executeUpdate("update registers set time='"+time+"' where time is null and username is not null;");
				rs=st1.executeQuery("select (amount+(peak*0.5*amount)) as amt from registers,ground where registers.gid=ground.gid;");
				while(rs.next())
					amt=rs.getString("amt");
				st1.executeUpdate("update registers set date='" + date + "' where date is null and username is not null;");
				st1.executeUpdate("update registers set bill_amt='" + amt + "' where bill_amt is   null and username is not null;");
				java.sql.CallableStatement st2 = conn.prepareCall("CALL `get_reg`();");
				boolean hr = st2.execute();
				if (hr) {
				    rs = st2.getResultSet();
					if (rs.next()) {
						str ="Registration ID:"+String.valueOf(rs.getInt("rid"));
						str +="<br>"+"Username:"+rs.getString("username");
						str +="<br>"+"Ground ID:"+String.valueOf(rs.getInt("gid"));
						str +="<br>"+"Amount:"+rs.getString("bill_amt");
					}
				}
				request.setAttribute("amt",str);
				request.getRequestDispatcher("Logout.jsp").forward(request, response);
				}else {
					
					request.setAttribute("msg","Select a different date and time");
					request.getRequestDispatcher("Details.jsp").forward(request, response);
					
				}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
		
	}

}
