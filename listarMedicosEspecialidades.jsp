<%@ page import="java.util.*, modelo.Medico, persistencia.MedicoDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html><head><title>Médicos y Especialidades</title></head>
<body>
<h2>Médicos y sus Especialidades</h2>
<%
    MedicoDAO dao = new MedicoDAO();
    List<Medico> lista = dao.listarTodos();
%>
<table border="1">
    <tr><th>Médico</th><th>Especialidad</th></tr>
    <% for (Medico m : lista) { %>
        <tr>
            <td><%= m.getNombre() %></td>
            <td><%= m.getEspecialidad() %></td>
        </tr>
    <% } %>
</table>
<p><a href="menu.jsp">Volver al menú</a></p>
</body></html>
