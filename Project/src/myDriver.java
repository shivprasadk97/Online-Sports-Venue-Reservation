import java.sql.*;

public class myDriver {
	private static Connection conn;
	static {
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/project", "root", "muchacho");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConn() {
		return conn;
	}
}
