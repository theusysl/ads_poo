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

        <div class="m-3 border rounded d-inline-block">
            <table class="table table-hover mb-0" style="width: auto;">
                <tbody>
                  <tr>
                    <td><strong>RA:</strong></td>
                    <td><span id="ra"></span></td>
                  </tr>
                  <tr>
                    <td><strong>Nome:</strong></td>
                    <td><span id="nome"></span></td>
                  </tr>
                </tbody>
              </table>



            <script>
              fetch('matheus.json')
                .then(response => response.json())
                .then(data => {
                  document.getElementById('ra').innerText = data.ra;
                  document.getElementById('nome').innerText = data.nome;
                })
                .catch(error => console.error('erro:', error));
            </script>
        </div>
        
        <%@include file="WEB-INF/jspf/html_body_libs.jspf" %>
    </body>
</html>
