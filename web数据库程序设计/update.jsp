<%@ page import="java.sql.*" pageEncoding="gbk" errorPage="error.jsp"%>
<html>
<head>
<title>�޸����</title>
</head>
<body>
	<%
		request.setCharacterEncoding("gbk");
	    String number = request.getParameter("number");
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	String born = request.getParameter("born");
	String address = request.getParameter("address");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/student", "root", "root");
		Statement stmt = con.createStatement();
		String sql = "update student set name='" + name + "',sex='" + sex + "',born='"
		+ born+"',address='"+address+"'  "+ " where number='" + number+"'";
		int i = stmt.executeUpdate(sql);
		if (i == 1) {
			out.println("<script language='javaScript'> alert('�޸ĳɹ������ȷ�����Զ�������ҳ��');</script>");
			response.setHeader("refresh", "1;url=index.jsp");
		}
		stmt.close();
		con.close();
	%>
</body>
</html>
