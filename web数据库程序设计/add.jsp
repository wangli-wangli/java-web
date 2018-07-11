<%@ page contentType="text/html; charset=utf-8" import="java.sql.*"
	errorPage="error.jsp"%>
<html>
<head>
<script type="text/javascript">
function check() {
	if (document.getElementById("number").value.length == 0) {
		alert("学号不能为空");
		user_name.focus();
		return false;
	}else if (document.getElementById("name").value.length == 0) {
		alert("姓名不能为空");
		user_name.focus();
		return false;
	}else if (document.getElementById("sex").value.length == 0) {
		alert("性别不能为空");
		user_name.focus();
		return false;
	}else if (document.getElementById("nian").value.length == 4) {
		alert("出生日期不完整");
		user_name.focus();
		return false;
	}else if (document.getElementById("yue").value.length == 0) {
		alert("出生日期不完整");
		user_name.focus();
		return false;
	}else if (document.getElementById("ri").value.length == 0) {
		alert("出生日期不完整");
		user_name.focus();
		return false;
	}else if (document.getElementById("address").value.length == 0) {
		alert("地址不能为空");
		user_name.focus();
		return false;
	}else{
		return true;
	}
}
</script>
<title>添加图书信息</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<form action="add.jsp" method="post" onsubmit="return check()">
		<table style="width: 50%">
			<caption>添加学生信息</caption>
			<tr>
				<td>学号 :</td>
				<td><input type="text" name="number" id="number"/></td>
			</tr>
			<tr>
				<td>姓名:</td>
				<td><input type="text" name="name" id="name"/></td>
			</tr>
			<tr>
				<td>性别:</td>
				<td><input type="radio" name="sex"  id="sex" value="男">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="sex" id="sex" value="女">女</td>
			</tr>
			<tr>
				<td>出生日期:</td>
				<td><input type="text" name="nian" size="10" id="nian"/>年 <input
					type="text" name="yue" id="yue" size="5" />月 <input type="text" name="ri"  id="ri"
					size="5" />日</td>
			</tr>
			<tr>
				<td>地址:</td>
				<td><input type="text" name="address"  id="address"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="Submit" value="添加">
					<input type="reset" value="重置"></td>
			</tr>
		</table>
	</form>
	<%
	   
		request.setCharacterEncoding("utf-8");
		String submit = request.getParameter("submit");
		if (submit != null && !submit.equals("")) {
			
			String number = request.getParameter("number");
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			String nian = request.getParameter("nian");
			String yue = request.getParameter("yue");
			String ri = request.getParameter("ri");
			String address = request.getParameter("address");
			
			String born=nian+yue+ri;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/student", "root",
					"root");
			//使用Statement对
			System.out.println("con:"+con);
			Statement stmt = con.createStatement();
			String sql = "insert into student(name,number,sex,born,address) values('" + name + "','" + number + "','"
					+ sex+ "','" + born + "','" + address+ "')";
			int i = stmt.executeUpdate(sql);
			if (i == 1) {
				out.println("<script language='javaScript'> alert('添加成功,点击确定跳转到主页!');</script>");
				response.setHeader("refresh", "1;url=index.jsp");
			} else {
				out.println("<script language='javaScript'> alert('添加失败，点击确定返回添加页面！');</script>");
				response.setHeader("refresh", "1;url=add.jsp");
			}
			stmt.close();
			con.close();
		}
	%>
</body>
</html>
