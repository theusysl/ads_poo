<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disciplinas</title>
        <%@include file="WEB-INF/jspf/html_head_libs.jspf" %>
    </head>
    <body>
        <div class="m-3">
            <%@include file="WEB-INF/jspf/header.jspf" %>
        </div>
        
        <div class="m-3 border rounded d-inline-block">
            <table class="table table-hover mb-0" style="width: auto;">
              <thead class="table-light">
                <tr>
                  <th>Disciplinas Cursadas</th>
                </tr>
              </thead>
              <tbody id="tabelaDisciplinas">
                    
              </tbody>
            </table>

            <script>
              fetch('matheus.json')
                .then(response => response.json())
                .then(data => {
                  let tabela = document.getElementById('tabelaDisciplinas');
                  data.disciplinas.forEach(disciplina => {
                    let linha = document.createElement('tr');
                    let coluna = document.createElement('td');
                    coluna.innerText = disciplina;
                    linha.appendChild(coluna);
                    tabela.appendChild(linha);
                  });
                })
                .catch(error => console.error('erro:', error));
            </script>
        </div>
        
        <%@include file="WEB-INF/jspf/html_body_libs.jspf" %>
    </body>
</html>
