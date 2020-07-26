package feedback.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import feedback.entity.Teacher;

public class CommonFeedBackDao {

	public static List<Teacher> getAllTeachers() throws ClassNotFoundException, SQLException {
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=(Connection) DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		String sql = "select * from teacher";
		ResultSet rs=s.executeQuery(sql);
		List<Teacher> teachers = new ArrayList<Teacher>();
		while(rs.next())
		{
			Teacher teacher = new Teacher();
			teacher.setId(rs.getInt("sno"));
			teacher.setName(rs.getString("tname"));
			teachers.add(teacher);
			
		}
		return teachers;
	}

	public static String getDepartment(int id) throws SQLException, ClassNotFoundException {
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=(Connection) DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		String sql = "select branch from teacher where sno="+id;
		ResultSet rs=s.executeQuery(sql);
		String branch ="";
		while(rs.next())
		{
			branch =rs.getString("branch");
			
		}
		return branch;
	}

	public static String getStudentDepartment(int id)  throws SQLException, ClassNotFoundException {
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=(Connection) DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		String sql = "select branch from student where roll="+id;
		ResultSet rs=s.executeQuery(sql);
		String branch ="";
		while(rs.next())
		{
			branch =rs.getString("branch");
			
		}
		return branch;
	}

	public static List<Teacher> getAllTeachers(int id) throws SQLException, ClassNotFoundException {
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=(Connection) DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		String sql1 ="select * from student where roll="+id;
		System.out.println(sql1);
		ResultSet rs1=s.executeQuery(sql1);
		String branch="";
		String year="";
		String section="";
		String sem="";
		while(rs1.next())
		{
			branch=rs1.getString("branch");
			year=rs1.getString("cyear");
			section=rs1.getString("sec");
			sem=rs1.getString("sem");
			
		}
		String sql2 = "select sno from teacherinfo where branch='"+branch
				+"'AND cyear='"+year+"'AND sec='"+section+"'AND sem='"+sem+"'";
		System.out.println(sql2);
		ResultSet rs2=s.executeQuery(sql2);
		Set<Integer> sno=new HashSet<Integer>();
		while(rs2.next()){
			sno.add(rs2.getInt("sno"));
		}
		String sql = "select * from teacher";
		System.out.println(sql);
		ResultSet rs=s.executeQuery(sql);
		List<Teacher> teachers = new ArrayList<Teacher>();
		while(rs.next())
		{
			if(sno.contains(rs.getInt("sno"))){
			Teacher teacher = new Teacher();
			teacher.setId(rs.getInt("sno"));
			teacher.setName(rs.getString("tname"));
			teachers.add(teacher);
			}
			
		}
		return teachers;
	}

	public static String getStudentYear(int id)throws SQLException, ClassNotFoundException {
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=(Connection) DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		String sql = "select cyear from student where roll="+id;
		ResultSet rs=s.executeQuery(sql);
		String year ="";
		while(rs.next())
		{
			year =rs.getString("cyear");
			
		}
                
		return year;
	}
	public static String getStudentSection(int id)throws SQLException, ClassNotFoundException {
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=(Connection) DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		String sql = "select sec from student where roll="+id;
		ResultSet rs=s.executeQuery(sql);
		String section ="";
		while(rs.next())
		{
			section =rs.getString("sec");
			
		}
		return section;
	}

	public static String getStudentSem(int id)throws SQLException, ClassNotFoundException {
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=(Connection) DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		String sql = "select sem from student where roll="+id;
		ResultSet rs=s.executeQuery(sql);
		String sem ="";
		while(rs.next())
		{
			sem =rs.getString("sem");
			
		}
		return sem;
	}

	public static List<String> getStudentSub(int sid, int tid, String branch, String year, String sem, String section)throws SQLException, ClassNotFoundException {
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=(Connection) DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		String sql = "select sub from feedbackinfo where roll="+sid+" AND sno="+tid;
		System.out.println(sql);
		ResultSet rs=s.executeQuery(sql);
		List<String> feedbackGivensub = new ArrayList<String>();
		while(rs.next()){
			feedbackGivensub.add(rs.getString("sub"));
		}
		String sql2 = "select sub from teacherinfo where sno="+tid+" AND branch='"+branch
				+"'AND cyear='"+year+"'AND sec='"+section+"'AND sem='"+sem+"'";
		System.out.println(sql2);
		ResultSet rs2=s.executeQuery(sql2);
		List<String> sub = new ArrayList<String>();
		while(rs2.next()){
			if(!feedbackGivensub.contains(rs2.getString("sub"))){
			sub.add(rs2.getString("sub"));
			}
		}
		return sub;
	}

	public static List<Classes> getTeacherAllDetail(String id) throws SQLException, ClassNotFoundException {
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=(Connection) DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		String sql = "select sno from teacher where uname='"+id+"'";
		ResultSet rs=s.executeQuery(sql);
		int sno =0;
		while(rs.next())
		{
			sno =rs.getInt("sno");
			
		}
		sql = "select * from teacherinfo where sno="+sno;
		rs=s.executeQuery(sql);
		List<Classes> handlingClass= new ArrayList<Classes>();
		while(rs.next())
		{
			Classes cls = new Classes();
			cls.setBranch(rs.getString("branch"));
			cls.setYear(rs.getString("year"));
			cls.setSem(rs.getString("sem"));
			cls.setSec(rs.getString("section"));
			cls.setSub(rs.getString("sub"));
			handlingClass.add(cls);
		}
		return handlingClass;
	}

	public static List<String> getSubject(String branch) throws ClassNotFoundException, SQLException {
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=(Connection) DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		String sql = "select sub from subject where branch='"+branch+"'";
		ResultSet rs=s.executeQuery(sql);
		List<String> subject =new ArrayList<String>();
		while(rs.next())
		{
			subject.add(rs.getString("sub"));
			
		}
		return subject;
	}

	public static List<Teacher> getAllTeachersByDepartment(String id) throws ClassNotFoundException, SQLException  {
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=(Connection) DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		String sql = "select * from teacher where branch='"+id+"'";
		System.out.println(sql);
		ResultSet rs=s.executeQuery(sql);
		List<Teacher> teachers = new ArrayList<Teacher>();
		while(rs.next())
		{
			Teacher teacher = new Teacher();
			teacher.setId(rs.getInt("sno"));
			teacher.setName(rs.getString("name"));
			teachers.add(teacher);
			
		}
		return teachers;
	}

	
}
