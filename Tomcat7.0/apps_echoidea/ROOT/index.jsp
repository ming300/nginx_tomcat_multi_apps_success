<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<body>
i am the apps_echoidea_root_index.jsp
<%
	out.print(request.getContextPath());
%>
<br/>
randCode='<%=String.valueOf(request.getSession().getAttribute("randCode"))%>'

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
