<%@ page language="java" import="java.sql.*" pageEncoding="gbk"%>
<%@ page errorPage="error.jsp"%>
<html>
<head>
<title>学生管理系统</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<h1>学生管理系统</h1>
	 <a href="add.jsp">添加学生</a>
	<br/>
	<br/>
	<table style="width: 50%;">
		<tr>
			<th>学号</th>
			<th>姓名</th>
			<th>性别</th>
			<th>出生日期</th>
			<th>地址</th>
			<th colspan="2">用户操作</th>
			</tr>
			<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/student", "root",
							"root");
					//使用Statement对象
					Statement stmt = con.createStatement();
					String s = "select * from student";
					ResultSet rs = stmt.executeQuery(s);
					
					while (rs.next()) {
						String name=rs.getString(1);
						String number = rs.getString(2);
						
						out.println("<tr><td>" + number+ "</td><td>" + name +
								"</td>><td>" + rs.getString(3) + "</td><td>"
								+ rs.getString(4) + "</td><td>"+rs.getString(5) + "</td><td><a href='edit.jsp?number=" + number
								+ "'>修改</a>&nbsp;<a href='del.jsp?number=" + number+ "'>删除</a></td></tr>");
					}
					rs.close();
					stmt.close();
					con.close();
				} catch (Exception e) {
					System.out.println("Exception:" + e.getMessage());
				}
			%>
		
	</table>
	<br />
	<hr />
	
</body>
</html>
