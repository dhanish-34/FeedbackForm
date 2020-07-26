

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class for Servlet: StudentFeedBack
 *
 */
 public class StudentFeedBack extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public StudentFeedBack() {
		super();
	}   	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}  	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		System.out.println("in add feed");
		System.out.println(request.getParameter("name"));
		try{
			String name=request.getParameter("name");
			String dname=request.getParameter("dname");
			String year=request.getParameter("year");
			String sem=request.getParameter("sem");
			String section=request.getParameter("section");
			String tname=request.getParameter("tname");
			String sub=request.getParameter("sub");
			
			String a=request.getParameter("A");
			int a1=Integer.parseInt(a);
			String b=request.getParameter("B");
			int b1=Integer.parseInt(b);
			String c=request.getParameter("C");
			int c2=Integer.parseInt(c);
			String d=request.getParameter("D");
			int d2=Integer.parseInt(d);
			String e=request.getParameter("E");
			int e2=Integer.parseInt(e);
			String f=request.getParameter("F");
			int f1=Integer.parseInt(f);
			String g=request.getParameter("G");
			int g1=Integer.parseInt(g);
			String h=request.getParameter("H");
			int h1=Integer.parseInt(h);
			Class.forName("org.apache.derby.jdbc.ClientDriver");
			Connection c1=DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
			Statement s =c1.createStatement();
			String sql=null;
			String sql2=null;
			ResultSet rs=null;
			System.out.println("bfrsql");
			sql2="insert into feedbackinfo values("+Integer.parseInt(name)+","+Integer.parseInt(tname)+",'"+sub+"');";
			System.out.println(sql2);
			s.execute(sql2);
			int num=0;
			switch(a1)
			{
			case 1:
				sql2="select * from teacherreportA where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				System.out.println(sql2);
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o1")+1;
					sql="update teacherreportA set o1="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportA values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',"+num+",0,0,0)";
				}
				break;
			case 2:
				sql2="select * from teacherreportA where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				System.out.println(sql2);
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o2")+1;
					sql="update teacherreportA set o2="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportA values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,"+num+",0,0)";
				}
				break;
			case 3:
				sql2="select * from teacherreportA where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				System.out.println(sql2);
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o3")+1;
					sql="update teacherreportA set o3="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportA values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,0,"+num+",0)";
				}
				break;
			case 4:
				sql2="select * from teacherreportA where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o4")+1;
					sql="update teacherreportA set o4="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportA values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,0,0,"+num+")";
				}
				break;
			}
			s.execute(sql);
			switch(b1)
			{
			case 1:
				sql2="select * from teacherreportB where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o1")+1;
					sql="update teacherreportB set o1="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportB values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',"+num+",0,0,0)";
				}
				break;
			case 2:
				sql2="select * from teacherreportB where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o2")+1;
					sql="update teacherreportB set o2="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportB values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,"+num+",0,0)";
				}
				break;
			case 3:
				sql2="select * from teacherreportB where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o3")+1;
					sql="update teacherreportB set o3="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportB values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,0,"+num+",0)";
				}
				break;
			case 4:
				sql2="select * from teacherreportB where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o4")+1;
					sql="update teacherreportB set o4="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportB values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,0,0,"+num+")";
				}
				break;
			}
			s.execute(sql);
			switch(c2)
			{
			case 1:
				sql2="select * from teacherreportC where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o1")+1;
					sql="update teacherreportC set o1="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportC values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',"+num+",0,0,0)";
				}
				break;
			case 2:
				sql2="select * from teacherreportC where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o2")+1;
					sql="update teacherreportC set o2="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportC values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,"+num+",0,0)";
				}
				break;
			case 3:
				sql2="select * from teacherreportC where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o3")+1;
					sql="update teacherreportC set o3="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportC values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,0,"+num+",0)";
				}
				break;
			case 4:
				sql2="select * from teacherreportC where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o4")+1;
					sql="update teacherreportC set o4="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportC values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,0,0,"+num+")";
				}
				break;
			}
			s.execute(sql);
			switch(d2)
			{
			case 1:
				sql2="select * from teacherreportD where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o1")+1;
					sql="update teacherreportD set o1="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportD values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',"+num+",0,0,0)";
				}
				break;
			case 2:
				sql2="select * from teacherreportD where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o2")+1;
					sql="update teacherreportD set o2="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportD values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,"+num+",0,0)";
				}
				break;
			case 3:
				sql2="select * from teacherreportD where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o3")+1;
					sql="update teacherreportD set o3="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportD values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,0,"+num+",0)";
				}
				break;
			case 4:
				sql2="select * from teacherreportD where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o4")+1;
					sql="update teacherreportD set o4="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportD values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,0,0,"+num+")";
				}
				break;
			}
			s.execute(sql);
			switch(e2)
			{
			case 1:
				sql2="select * from teacherreportE where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o1")+1;
					sql="update teacherreportE set o1="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportE values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',"+num+",0,0,0)";
				}
				break;
			case 2:
				sql2="select * from teacherreportE where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o2")+1;
					sql="update teacherreportE set o2="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportE values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,"+num+",0,0)";
				}
				break;
			case 3:
				sql2="select * from teacherreportE where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o3")+1;
					sql="update teacherreportE set o3="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportE values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,0,"+num+",0)";
				}
				break;
			case 4:
				sql2="select * from teacherreportE where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o4")+1;
					sql="update teacherreportE set o4="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportE values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,0,0,"+num+")";
				}
				break;
			}
			s.execute(sql);
			switch(f1)
			{
			case 1:
				sql2="select * from teacherreportF where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o1")+1;
					sql="update teacherreportF set o1="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportF values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',"+num+",0,0,0)";
				}
				break;
			case 2:
				sql2="select * from teacherreportF where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o2")+1;
					sql="update teacherreportF set o2="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportF values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,"+num+",0,0)";
				}
				break;
			case 3:
				sql2="select * from teacherreportF where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o3")+1;
					sql="update teacherreportF set o3="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportF values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,0,"+num+",0)";
				}
				break;
			case 4:
				sql2="select * from teacherreportF where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o4")+1;
					sql="update teacherreportF set o4="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportF values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,0,0,"+num+")";
				}
				break;
			}
			s.execute(sql);
			switch(g1)
			{
			case 1:
				sql2="select * from teacherreportG where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o1")+1;
					sql="update teacherreportG set o1="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportG values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',"+num+",0,0,0)";
				}
				break;
			case 2:
				sql2="select * from teacherreportG where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o2")+1;
					sql="update teacherreportG set o2="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportG values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,"+num+",0,0)";
				}
				break;
			case 3:
				sql2="select * from teacherreportG where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o3")+1;
					sql="update teacherreportG set o3="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportG values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,0,"+num+",0)";
				}
				break;
			case 4:
				sql2="select * from teacherreportG where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o4")+1;
					sql="update teacherreportG set o4="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportG values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,0,0,"+num+")";
				}
				break;
			}
			s.execute(sql);
			switch(h1)
			{
			case 1:
				sql2="select * from teacherreportH where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o1")+1;
					sql="update teacherreportH set o1="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportH values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',"+num+",0,0,0)";
				}
				break;
			case 2:
				sql2="select * from teacherreportH where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o2")+1;
					sql="update teacherreportH set o2="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportH values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,"+num+",0,0)";
				}
				break;
			case 3:
				sql2="select * from teacherreportH where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o3")+1;
					sql="update teacherreportH set o3="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportH values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,0,"+num+",0)";
				}
				break;
			case 4:
				sql2="select * from teacherreportH where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				try
				{
					rs=s.executeQuery(sql2);
					rs.next();
					num=rs.getInt("o4")+1;
					sql="update teacherreportH set o4="+num+" where dname='"+dname+"' AND tname='"+tname
				+"'AND sub='"+sub+"' AND year='"+year+"' AND section='"+section+"'AND sem='"+sem+"'";
				}catch(SQLException e1)
				{
					num=1;
					sql="insert into teacherreportH values('"+dname+"','"+tname+"','"+sub+"','"+year+"','"+section+"','"+sem+"',0,0,0,"+num+")";
				}
				break;
			}
			s.execute(sql);
			
			
		}catch(Exception e){e.printStackTrace();}
		response.sendRedirect("thank.html");
	}   	  	    
}