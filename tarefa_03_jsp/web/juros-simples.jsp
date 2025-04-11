<%-- 
    Document   : juros-simples
    Created on : 10 de abr. de 2025, 22:14:49
    Author     : MATHEUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juros Simples</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h2>Juros Simples</h2>
        <form method="post">
            <input type="number" name="montante" placeholder="Montante" required />
            <input type="number" step="0.01" name="taxa" placeholder="Taxa (%)" required />
            <input type="number" name="meses" placeholder="Meses" required />
            <button type="submit">Calcular</button>
        </form>
        <%
            String m = request.getParameter("montante");
            String t = request.getParameter("taxa");
            String n = request.getParameter("meses");

            if (m != null && t != null && n != null) {
                double montante = Double.parseDouble(m);
                double taxa = Double.parseDouble(t) / 100;
                int meses = Integer.parseInt(n);

                double valorTotal = montante * (1 + taxa * meses);

                DecimalFormat df = new DecimalFormat("#,##0.00");
        %>
        <p>Valor Total: R$ <strong><%= df.format(valorTotal)%></strong></p>
        <%
            }
        %>
    </body>
</html>