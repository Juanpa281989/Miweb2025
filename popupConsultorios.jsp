<%@page import="persistencia.ConsultorioDAO, modelo.Consultorio, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ConsultorioDAO dao = new ConsultorioDAO();
    List<Consultorio> consultorios = dao.listarTodos();
%>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
<head><title>Seleccionar Consultorio</title></head>
<body>
<h3>Consultorios disponibles</h3>
<table border="1" cellpadding="5">
    <tr><th>Nombre</th><th>Ubicación</th><th>Acción</th></tr>
    <% for (Consultorio c : consultorios) { %>
        <tr>
            <td><%= c.getNombre() %></td>
            <td><%= c.getUbicacion() %></td>
            <td><button type="button" onclick="window.opener.seleccionarConsultorio('<%= c.getNombre() %>'); window.close();">Seleccionar</button></td>
        </tr>
    <% } %>
</table>
</body>
</html>
