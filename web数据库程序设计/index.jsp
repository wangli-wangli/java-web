<%@ page language="java" import="java.sql.*" pageEncoding="gbk"%>
<%@ page errorPage="error.jsp"%>
<html>
<head>
<title>ѧ������ϵͳ</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<h1>ѧ������ϵͳ</h1>
	 <a href="add.jsp">���ѧ��</a>
	<br/>
	<br/>
	<table style="width: 50%;">
		<tr>
			<th>ѧ��</th>
			<th>����</th>
			<th>�Ա�</th>
			<th>��������</th>
			<th>��ַ</th>
			<th colspan="2">�û�����</th>
			</tr>
			<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/student", "root",
							"root");
					//ʹ��Statement����
					Statement stmt = con.createStatement();
					String s = "select * from student";
					ResultSet rs = stmt.executeQuery(s);
					
					while (rs.next()) {
						String name=rs.getString(1);
						String number = rs.getString(2);
						
						out.println("<tr><td>" + number+ "</td><td>" + name +
								"</td>><td>" + rs.getString(3) + "</td><td>"
								+ rs.getString(4) + "</td><td>"+rs.getString(5) + "</td><td><a href='edit.jsp?number=" + number
								+ "'>�޸�</a>&nbsp;<a href='del.jsp?number=" + number+ "'>ɾ��</a></td></tr>");
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
