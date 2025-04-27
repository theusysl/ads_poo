<%-- 
    Document   : users
    Created on : 24 de abr. de 2025, 20:09:59
    Author     : Matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuários - SessionApp</title>
        <%@include file="WEB-INF/jspf/html_head_libs.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <%if (userName!=null) {%>
            <div class="m-2">
                <h2>Usuários</h2>
                <%for(String user: users){%>
                    <div><%= user %></div>
                <%}%>
            </div>
        <%}%>
        <%@include file="WEB-INF/jspf/html_body_libs.jspf" %>

    </body>
</html>
