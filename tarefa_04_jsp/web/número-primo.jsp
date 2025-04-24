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
            boolean ehPrimo = false;
            boolean mostrar = false;
            int num = 0;
            if (n != null) {
                num = Integer.parseInt(n); // <-- AQUI O AJUSTE
                if (num > 1) {
                    ehPrimo = true;
                    for (int i = 2; i <= Math.sqrt(num); i++) {
                        if (num % i == 0) {ehPrimo = false;}
                    }
                }
                mostrar = true;
            }
        %>

        <% if (mostrar) { %>
            <p><%= ehPrimo ? "É primo" : "Não é primo" %></p>
            <table>
                <tr>
                    <th>Divisores</th>
                </tr>
                <%
                    if (ehPrimo) {
                %>
                    <tr><td>1</td></tr>
                    <tr><td><%= num %></td></tr>
                <%
                    } else {
                        for (int i = 1; i <= num; i++) {
                            if (num % i == 0) {
                %>
                    <tr><td><%= i %></td></tr>
                <%
                            }
                        }
                    }
                %>
            </table>            
        <% } %>
    </body>
</html>