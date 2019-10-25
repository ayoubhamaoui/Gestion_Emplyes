<%--
    Document   : home
    Created on : Oct 24, 2019, 10:28:19 PM
    Author     : hamza enaime
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String redirectURL = "http://localhost:8080/GestionEmployeeDepartment/ServletController?action=ListeDepartement";
            response.sendRedirect(redirectURL);
        %>
    </body>
</html>


