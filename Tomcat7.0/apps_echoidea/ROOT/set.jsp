<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<body>

<%

request.getSession().setAttribute("randCode","echoidea");

%>
i am the apps_echoidea_root_set.jsp
<br/>

<%
	out.print(request.getContextPath());
%>
<br/>
<%
	Enumeration headerNames = request.getHeaderNames();
	while (headerNames.hasMoreElements()) {
		String key = (String) headerNames.nextElement();
		String value = request.getHeader(key);
		out.print(key+"    ="+value +"<br/>");
	}

%>

</body>
 
</html>
