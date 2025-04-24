<%-- 
    Document   : soma
    Created on : 23 de abr. de 2025, 12:58:08
    Author     : Matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Soma</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h2>Soma</h2>
        <%@include file="WEB-INF/jspf/form_num.jspf" %>
        <%
            String n = request.getParameter("num");
            int soma = 0;
            if (n != null) {
                int num = Integer.parseInt(n);
                for (int i = 1; i <= num; i++) {
                    soma += i;
                }
                out.println("<p>Soma de todos os números até <strong>" + num + "</strong>: " + soma + "</p>");
            }
        %>
    </body>
</html>