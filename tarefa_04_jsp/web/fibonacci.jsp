<%-- 
    Document   : fibonacci
    Created on : 23 de abr. de 2025, 12:57:59
    Author     : Matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fibonacci</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h2>Fibonacci</h2>
        <%@include file="WEB-INF/jspf/form_num.jspf" %>

        <%
        String n = request.getParameter("num");
        if (n != null && !n.isEmpty()) {
            int num = Integer.parseInt(n);
            int a = 0, b = 1;

        %>
        <p><strong>Fibonacci até <%= num %>:</strong></p>
        <table>
            <tr><th>Fibonacci</th></tr>
            <tr><td><%= a %></td></tr>
            <% if (num > 1) { %>
                <tr><td><%= b %></td></tr>
            <% } %>
            <%
                for (int i = 2; i < num; i++) {
                    int c = a + b;
            %>
                <tr><td><%= c %></td></tr>
            <%
                    a = b;
                    b = c;
                }
            }
            %>
        </table>
    </body>
</html>