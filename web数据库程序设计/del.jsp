<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" pageEncoding="gbk"%>
<html>
  <head>
    <title>ɾ��ͼ����Ϣ</title>
  </head>
  <body>
	<%
	request.setCharacterEncoding("gbk");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/student","root","root");
	Statement stmt=con.createStatement();
	String number=request.getParameter("number");
	int i=stmt.executeUpdate("delete from student where number="+number);
	if(i==1)
		{out.println("<script language='javaScript'> alert('ɾ���ɹ������ȷ�����Զ�������ҳ��');</script>");
		response.setHeader("refresh","1;url=index.jsp");
		}
		else{
		out.println("<script language='javaScript'> alert('ɾ��ʧ�ܣ����ȷ�����Զ�������ҳ��');</script>");
		response.setHeader("refresh","1;url=index.jsp");
		}
		con.close();
		stmt.close();
	%>
  </body>
</html>
