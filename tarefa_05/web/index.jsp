<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>tarefa 5</title>
        <%@include file="WEB-INF/jspf/html_head_libs.jspf" %>
    </head>
    <body>
        <div class="m-3">
            <%@include file="WEB-INF/jspf/header.jspf" %>
        </div>

        <div class="m-3 border rounded">
            <table class="table table-hover">
              <tbody>
                <tr><td>RA: <span id="ra"></span></td></tr>
                <tr><td>Nome: <span id="nome"></span></td></tr>
              </tbody>
            </table>

            <script>
              fetch('matheus.json')
                .then(response => response.json())
                .then(data => {
                  document.getElementById('ra').innerText = data.ra;
                  document.getElementById('nome').innerText = data.nome;
                })
                .catch(error => console.error('deu ruim:', error));
            </script>
        </div>
        
        <%@include file="WEB-INF/jspf/html_body_libs.jspf" %>
    </body>
</html>
