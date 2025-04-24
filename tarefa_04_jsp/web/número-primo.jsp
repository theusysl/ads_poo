<%-- 
    Document   : número-primo
    Created on : 23 de abr. de 2025, 12:57:35
    Author     : Matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Número Primo</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h2>Número Primo</h2>
        <%@include file="WEB-INF/jspf/form_num.jspf" %>
    
        <%
            String n = request.getParameter("num");
            if (n != null && !n.isEmpty()) {
                int num = Integer.parseInt(n);
                boolean ehPrimo = num > 1;
    
                for (int i = 2; i <= Math.sqrt(num) && ehPrimo; i++) {
                    if (num % i == 0) {
                        ehPrimo = false;
                    }
                }
        %>
                <p><strong><%= ehPrimo ? "É primo" : "Não é primo" %></strong></p>
    
                <% if (!ehPrimo) { %>
                <table>
                    <tr><th>Divisores</th></tr>
                    <%
                        for (int i = 1; i <= num; i++) {
                            if (num % i == 0) {
                    %>
                        <tr><td><%= i %></td></tr>
                    <%
                            }
                        }
                    %>
                </table>
                <% } %>
        <%
            }
        %>
    </body>
</html>