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
//判断application对象中有没有保存名为count的参数  
//如果没有，在application对象中新增一个名为count的参数  
if(application.getAttribute("count")==null){  
    application.setAttribute("count", new Integer(0));  
}  
Integer count = (Integer)application.getAttribute("count");  
//使用application对象读取count参数的值，再在原值基础上累加1  
application.setAttribute("count",new Integer(count.intValue()+1)); 

%>
<span style="color:red;size:20px;">登录成功</span>，已成功登录<%=count+1 %>次！
</body>
</html>