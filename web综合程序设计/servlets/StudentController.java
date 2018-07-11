package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import book.bean.StudentInfo;

@WebServlet("*.do")
public class StudentController extends HttpServlet {

	/**
	 * 截获所有的后缀为.do请求，并转到相应的处理程序
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        System.out.println("dopost");
		request.setCharacterEncoding("GBK");
		String actionUrl=request.getServletPath();		//获取用户请求的路径

		if(actionUrl.equals("/index.do")){			//访问主页请求
			ArrayList<StudentInfo> list=StudentInfo.getStudentList();  //调用StudentInfo获取学生列表赋给list变量
			request.setAttribute("list", list);					//request中增加list属性，其值为list变量的值
			request.getRequestDispatcher("/index.jsp").forward(request, response);//转发给index.jsp文件
		
		}else if(actionUrl.equals("/add.do")){			
			String number=request.getParameter("number");
			String name=request.getParameter("name");
			String sex=request.getParameter("sex");
			String born=request.getParameter("born");
			String address=request.getParameter("address");
			System.out.println("StudentControl.java");
			int r = StudentInfo.addStudent(number,name,sex,born,address);	
			if(r==1)
				request.getRequestDispatcher("success.html").forward(request, response);
			else
				request.getRequestDispatcher("failure.html").forward(request, response);
		
		}else if(actionUrl.equals("/edit.do")){					
			String number=request.getParameter("number");
			StudentInfo bi=StudentInfo.getStudentById(number);		//调用StudentInfor查询指定number的信息，赋给bi变量
			request.setAttribute("bi", bi);				//request中增加bi属性，其值为bi变量的值
			request.getRequestDispatcher("/edit.jsp").forward(request, response);
		
		}else if(actionUrl.equals("/update.do")){	    //更新学生请求
			String number=request.getParameter("number");
			String name=request.getParameter("name");
			String sex=request.getParameter("sex");
			String born=request.getParameter("born");
			String address=request.getParameter("address");
			int r=StudentInfo.updateStudnet(number, name, sex, born, address);//调用StudentInfo进行更新操作
			if(r==1)
				request.getRequestDispatcher("/success.html").forward(request, response);
			else
				request.getRequestDispatcher("/failure.html").forward(request, response);
		
		}else if(actionUrl.equals("/delete.do")){			
			String number=request.getParameter("number");
			int r=StudentInfo.deleteStudent(number);		
			if(r==1)
				request.getRequestDispatcher("/success.html").forward(request, response);
			else
				request.getRequestDispatcher("/failure.html").forward(request, response);
		}
	}

}
