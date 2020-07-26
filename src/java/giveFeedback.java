

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import feedback.dao.Classes;
import feedback.dao.CommonFeedBackDao;
import feedback.entity.Teacher;

/**
 * Servlet implementation class giveFeedback
 */
public class giveFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public giveFeedback() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {
		try {

			String uri=request.getRequestURI();
			System.out.println(uri);
			if(uri.equals("/feedbackform/giveFeedback/getDepartment")){
				System.out.println("in getDepartment");
				String id = request.getParameter("id");
				String branch = CommonFeedBackDao.getStudentDepartment(Integer.parseInt(id));
				System.out.println("Student branch:" + branch);
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				out.write("<option value=''>---Select department---</option>");

				out.write("<option value='" + branch + "'>" + branch + "</option></c:forEach>");
				//out.write("<input type=text name=branch id=branch size="+30+" required placeholder="+"NAME"+" value="+branch+">");
			}
			if(uri.equals("/feedbackform/giveFeedback/getTeachers")){
				System.out.println("in getDepartment");
				String id = request.getParameter("id");
				List<Teacher> teachers;
				teachers = CommonFeedBackDao.getAllTeachersByDepartment(id);
				System.out.println("Teachers count:" + teachers.size());
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				out.write("<option value=''>---Select teacher---</option>");
				for (Teacher teacher : teachers){
					out.write("<option value='" + teacher.getId() + "'>" + teacher.getName() + "</option></c:forEach>");
				}	}
			if(uri.equals("/feedbackform/giveFeedback/getTeacher")){
				System.out.println("in getDepartment");
				String id = request.getParameter("id");
				List<Teacher> teachers;
				teachers = CommonFeedBackDao.getAllTeachers(Integer.parseInt(id));
				System.out.println("Teachers count:" + teachers.size());
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				out.write("<option value=''>---Select teacher---</option>");
				for (Teacher teacher : teachers){
					out.write("<option value='" + teacher.getId() + "'>" + teacher.getName() + "</option></c:forEach>");
				}	}
			if(uri.equals("/feedbackform/giveFeedback/getYear")){
				System.out.println("in getDepartment");
				String id = request.getParameter("id");
				String year = CommonFeedBackDao.getStudentYear(Integer.parseInt(id));
				System.out.println("Student year:" + year);
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				out.write("<option value=''>---Select year---</option>");

				out.write("<option value='" + year + "'>" + year + "</option></c:forEach>");
				//out.write("<input type=text name=branch id=branch size="+30+" required placeholder="+"NAME"+" value="+branch+">");
			}
			if(uri.equals("/feedbackform/giveFeedback/getSection")){
				System.out.println("in getDepartment");
				String id = request.getParameter("id");
				String section = CommonFeedBackDao.getStudentSection(Integer.parseInt(id));
				System.out.println("Student section:" + section);
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				out.write("<option value=''>---Select Section---</option>");

				out.write("<option value='" + section + "'>" + section + "</option></c:forEach>");
				//out.write("<input type=text name=branch id=branch size="+30+" required placeholder="+"NAME"+" value="+branch+">");
			}
			if(uri.equals("/feedbackform/giveFeedback/getSem")){
				System.out.println("in getDepartment");
				String id = request.getParameter("id");
				String sem = CommonFeedBackDao.getStudentSem(Integer.parseInt(id));
				System.out.println("Student section:" + sem);
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				out.write("<option value=''>---Select Sem---</option>");

				out.write("<option value='" + sem + "'>" + sem + "</option></c:forEach>");
				//out.write("<input type=text name=branch id=branch size="+30+" required placeholder="+"NAME"+" value="+branch+">");
			}
			if(uri.equals("/feedbackform/giveFeedback/getSubject")){
				System.out.println("in getDepartment");
				String sid = request.getParameter("sid");
				String tid = request.getParameter("tid");
				String year = request.getParameter("year");
				String section = request.getParameter("section");
				String branch = request.getParameter("branch");
				String sem = request.getParameter("sem");
				
				System.out.println("branch: "+branch+"Year: "+year+"sem: "+sem+"section: "+section);
				List<String> sub = CommonFeedBackDao.getStudentSub(Integer.parseInt(sid),Integer.parseInt(tid),branch,year,sem,section);
				System.out.println("Sub size:" + sub.size());
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				if(sub.isEmpty()){
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
								"<th align=left>Feedback is already given for this professor</th>" +
								"</tr>" +
								"</table>" +
								"<h3>" +
								"<a href="+"studentfeedback.jsp?name="+sid+">BACK TO GIVE FEEDBACK</a><br><br>" +
								"<a href="+"home.html"+">BACK TO HOME PAGE</a><br><br>" +
								"</h3>" +
								"</center>");
					out.println("</body>");
					out.println("</html>");
				}else{
				out.write("<option value=''>---Select Subject---</option>");
                for(String subs:sub){
				out.write("<option value='" + subs + "'>" + subs + "</option></c:forEach>");
                }
                }//out.write("<input type=text name=branch id=branch size="+30+" required placeholder="+"NAME"+" value="+branch+">");
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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
