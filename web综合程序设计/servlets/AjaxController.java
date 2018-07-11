package servlets;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.*;

import book.bean.StudentInfo;

/**
 * 截取所有后缀为.action的操作
 */
@WebServlet("*.action")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjaxController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String actionUrl = request.getServletPath(); // 获取用户请求的路径
		System.out.println("用户请求的路径:"+actionUrl);
		if (actionUrl.equals("/list.action")) { // 访问主页请求
			ArrayList<StudentInfo> list = StudentInfo.getStudentList(); 
			//以下代码将list图书转换成json字符串发送给客户端
			JSONArray jsonArray = new JSONArray();
			for (int i = 0; i < list.size(); i++) {
				StudentInfo student = list.get(i);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("number",  student.getNumber());
				map.put("name", student.getName());
				map.put("sex", student.getSex());
				map.put("born", student.getBorn());
				map.put("address", student.getAddress());
				JSONObject BookObj = new JSONObject(map);
				jsonArray.put(BookObj);
			}
			response.getWriter().print(jsonArray.toString());
			
		} else if (actionUrl.equals("/add.action")) {
			
			String name = request.getParameter("name");
			String number = request.getParameter("number");
			String sex = request.getParameter("sex");
			String born=request.getParameter("born");
			String address=request.getParameter("address");
			int r = StudentInfo.addStudent(number,name,sex,born,address); 
			response.getWriter().print(r);

		} else if (actionUrl.equals("/edit.action")) { 
			String number = request.getParameter("number");
			StudentInfo student = StudentInfo.getStudentById(number); 
			//以下代码将bi转换成为json字符串发送给客户端
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("number",  student.getNumber());
			map.put("name", student.getName());
			map.put("sex", student.getSex());
			map.put("born", student.getBorn());
			map.put("address", student.getAddress());
			JSONObject BookObj = new JSONObject(map);
			response.getWriter().print(BookObj.toString());
			
		} else if (actionUrl.equals("/update.action")) { 
			String name = request.getParameter("name");
			String number = request.getParameter("number");
			String sex = request.getParameter("sex");
			String born=request.getParameter("born");
			String address=request.getParameter("address");
			int r = StudentInfo.updateStudnet(number, name, sex, born, address);
			response.getWriter().print(r);

		} else if (actionUrl.equals("/delete.action")) { 
			
			String number = request.getParameter("number");
			int r = StudentInfo.deleteStudent(number); 
			response.getWriter().print(r);
		}
	}

}
