

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class getInfo
 */
public class getInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub


		int x, t=0, flag=0;
                int id=0;
		String sql,rn,password,branch,year,sem,sub,section;
		String str1, str2, str3, str4, str5, str6;
		rn=request.getParameter("teacher");
		branch=request.getParameter("branch");
		year=request.getParameter("year");
		sem=request.getParameter("sem");
		section=request.getParameter("section");
		sub=request.getParameter("sub");
		id=Integer.parseInt(rn);
		if( id != 0 || sem != null|| section != null|| year != null|| branch != null|| sub != null)
		{	
			try {
				PrintWriter out=response.getWriter();
				Class.forName("org.apache.derby.jdbc.ClientDriver");
			
			Connection c=(Connection) DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
			Statement s =c.createStatement();
			sql="select * from teacherinfo where sno="+id+"";
			ResultSet rs = s.executeQuery(sql);
			boolean flags=true;
			while(rs.next()){
				if(branch.equals(rs.getString("branch")) && year.equals(rs.getString("cyear"))
						&& sem.equals(rs.getString("sem")) && sub.equals(rs.getString("sub")) 
						&& section.equals(rs.getString("section"))){
					flags=false;
					out.println("<html>");
					out.println("<head>");
					out.println("<meta http-equiv="+"Content-Type"+" content="+"text/html; charset=ISO-8859-1"+">");
					out.println("<title>Report</title>");
					out.println("</head>");
					out.println("<body style="+"background-color:grey"+">");
					out.println("<center>" +
								"<img src=skcet.png width=780"+" height="+"151"+" alt="+"logo"+">" +
								"<marquee bgcolor="+"white"+" behavior=alternate width="+"100%"+">TEACHER REPORT</marquee>" +
								"</center>" +
								"<br><br><br>" +
								"<center>" +
								"<table border="+"0"+" cellspacing=0 cellpadding=5 >" +
								"<tr>" +
								"<th align=left>This information is aleady added</th>" +
								"</tr>" +
								"</table>" +
								"<h3>" +
								"<a href="+"addteacherInfo.jsp"+">BACK TO ADD INFO PAGE</a><br><br>" +
								"<a href="+"home.html"+">BACK TO HOME PAGE</a><br><br>" +
								"</h3>" +
								"</center>");
					out.println("</body>");
					out.println("</html>");
				}
			}
			if(flags){
				sql = "insert into teacherinfo values ("+id+",'"+branch+"','"+year+"','"+sem+"','"+section+"','"+sub+"')";
				System.out.println(sql);
					s.execute(sql);
					out.println("<html>");
					out.println("<head>");
					out.println("<meta http-equiv="+"Content-Type"+" content="+"text/html; charset=ISO-8859-1"+">");
					out.println("<title>Report</title>");
					out.println("</head>");
					out.println("<body style="+"background-color:grey"+">");
					out.println("<center>" +
								"<img src=skcet.png width=780"+" height="+"151"+" alt="+"logo"+">" +
								"<marquee bgcolor="+"white"+" behavior=alternate width="+"100%"+">TEACHER REPORT</marquee>" +
								"</center>" +
								"<br><br><br>" +
								"<center>" +
								"<table border="+"0"+" cellspacing=0 cellpadding=5 >" +
								"<tr>" +
								"<th align=left>This information is successfully added</th>" +
								"</tr>" +
								"</table>" +
								"<h3>" +
								"<a href="+"addteacherInfo.jsp"+">BACK TO ADD INFO PAGE</a><br><br>" +
								"<a href="+"home.html"+">BACK TO HOME PAGE</a><br><br>" +
								"</h3>" +
								"</center>");
					out.println("</body>");
					out.println("</html>");
			}
			} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	

	
	}

}
