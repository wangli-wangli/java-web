<%@ page import="java.sql.*" pageEncoding="gbk" errorPage="error.jsp"%>
<html>
<head>
<script type="text/javascript">
function check() {
	if (document.getElementById("number").value.length == 0) {
		alert("ѧ�Ų���Ϊ��");
		user_name.focus();
		return false;
	}else if (document.getElementById("name").value.length == 0) {
		alert("��������Ϊ��");
		user_name.focus();
		return false;
	}else if (document.getElementById("sex").value.length == 0) {
		alert("�Ա���Ϊ��");
		user_name.focus();
		return false;
	}else if (document.getElementById("nian").value.length == 4) {
		alert("�������ڲ�����");
		user_name.focus();
		return false;
	}else if (document.getElementById("yue").value.length == 0) {
		alert("�������ڲ�����");
		user_name.focus();
		return false;
	}else if (document.getElementById("ri").value.length == 0) {
		alert("�������ڲ�����");
		user_name.focus();
		return false;
	}else if (document.getElementById("address").value.length == 0) {
		alert("��ַ����Ϊ��");
		user_name.focus();
		return false;
	}else{
		return true;
	}
}
</script>
<title>�޸�ѧ����Ϣ</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<%
		request.setCharacterEncoding("gbk");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/student", "root", "root");
		Statement stmt = con.createStatement();
		String id = request.getParameter("id");
		ResultSet rs = stmt.executeQuery("select * from student ");
		rs.next();
	%>
	<form action="update.jsp" method="post" onsubmit="return check()">
	<a href="addInput.jsp">���ѧ��</a>
		<table style="width:50%">
			<tr>
				<th width="30%">����</th>
				<td width="70%"><input name="name" type="text"
					value="<%=rs.getString(1)%>"></td>
			</tr>
			  <tr>
				<th>ѧ��:</th>
				<%
				String number=rs.getString(2);
				%>
				<td><input name="number" type="text"
					value="<%=number%>" readonly="readonly"></td>
			</tr> 
			<tr>
				<th>�Ա�</th>
				<td><input name="sex" type="text"
					value="<%=rs.getString(3)%>"></td>
			</tr>
			<tr>
				<th>�������ڣ�</th>
				<td><input name="born" type="text"
					value="<%=rs.getString(4)%>"></td>
			</tr>
			<tr>
				<th>��ַ��</th>
				<td><input name="address" type="text"
					value="<%=rs.getString(5)%>"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="hidden" name="number" value="<%=number%>">
					<input type="submit" name="Submit" value="�޸�"> <input type="reset"
					value="ɾ��"></td>
			</tr>
		</table>
	</form>
	<%
		rs.close();
		stmt.close();
		con.close();
	%>
</body>
</html>
