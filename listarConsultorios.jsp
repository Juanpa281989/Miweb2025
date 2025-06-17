<%@ page import="java.util.*, modelo.Consultorio, persistencia.ConsultorioDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html><head><title>Consultorios</title></head>
<body>
<h2>Lista de Consultorios</h2>
<%
    ConsultorioDAO dao = new ConsultorioDAO();
    List<Consultorio> lista = dao.listarTodos();
%>
<table border="1">
    <tr><th>ID</th><th>Nombre</th><th>Ubicación</th></tr>
    <% for (Consultorio c : lista) { %>
        <tr>
            <td><%= c.getId() %></td>
            <td><%= c.getNombre() %></td>
            <td><%= c.getUbicacion() %></td>
        </tr>
    <% } %>
</table>
<p><a href="menu.jsp">Volver al menú</a></p>
</body></html>
