

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import feedback.dao.Classes;
import feedback.dao.CommonFeedBackDao;
import feedback.entity.Teacher;

/**
 * Servlet implementation class addTeacherInformation
 */
public class addTeacherInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addTeacherInformation() {
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
			
			if(uri.equals("/feedbackform/addteacherInfo")){
			System.out.println("in servlet");
		List<Teacher> teachers;
		
			teachers = CommonFeedBackDao.getAllTeachers();
		System.out.println("Teachers count:" + teachers.size());
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		out.write("<option value=''>---Select teacher---</option>");
		for (Teacher teacher : teachers){
			out.write("<option value='" + teacher.getId() + "'>" + teacher.getName() + "</option></c:forEach>");
		}
			}
		
		if(uri.equals("/feedbackform/addteacherInfo/getDepartment")){
			System.out.println("in getDepartment");
			String id = request.getParameter("id");
			String branch = CommonFeedBackDao.getDepartment(Integer.parseInt(id));
			System.out.println("Teachers branch:" + branch);
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			out.write("<option value=''>----Select Department----</option>");
			out.write("<option value='" + branch + "'>" + branch + "</option></c:forEach>");
			//out.write("<input type=text name=branch id=branch size="+30+" required placeholder="+"NAME"+" value="+branch+">");
		}
		if(uri.equals("/feedbackform/addteacherInfo/getSubject")){
			System.out.println("in getDepartment");
			String branch = request.getParameter("id");
			List<String> subject = CommonFeedBackDao.getSubject(branch);
			System.out.println("Subject size :" + subject.size());
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			out.write("<option value=''>----Select Subject----</option>");
			for(String sb:subject){
			out.write("<option value='" + sb + "'>" + sb + "</option></c:forEach>");
			}
			//out.write("<input type=text name=branch id=branch size="+30+" required placeholder="+"NAME"+" value="+branch+">");
		}
		if(uri.equals("/feedbackform/addteacherInfo/feedbackReport")){
			System.out.println("Feedback");
			String id = request.getParameter("name");
			System.out.println(id);
			List<Classes> handlingClass;
				handlingClass = CommonFeedBackDao.getTeacherAllDetail(id);
			
			System.out.println("Total classes:" + handlingClass.size());
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			out.write("<option value=''>---Select department---</option>");
			for(Classes cl: handlingClass){
				String value = cl.getBranch()+","+cl.getYear()+","+cl.getSem()+","+cl.getSec()+","+cl.getSub();
				String display =cl.getBranch()+" Deartment - "+cl.getYear()+"Year - "
				+cl.getSem()+"Semester - "+cl.getSec()+"Section - "+cl.getSub();
				System.out.println(value+"====================="+display);
			out.write("<option value='" + value + "'>" + display + "</option></c:forEach>");
			}
			
			//out.write("<input type=text name=branch id=branch size="+30+" required placeholder="+"NAME"+" value="+branch+">");
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
