<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		if (name.equals("jsj") && password.equals("123")) {
	%>
	<jsp:forward page="success.jsp"></jsp:forward>
	<%
		} else {
			String error = null;
			if (name.equals("jsj")) {
				error = "用户名输入错误";

			} else if (password.equals("123")) {
				error = "密码输入错误！";

			} else {
				error = "用户名和密码输入错误！";

			}
			response.sendRedirect("fail.jsp");
			session.setAttribute("error",error);
		
		}
	%>

</body>
</html>