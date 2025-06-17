<%@page import="persistencia.MedicoDAO, modelo.Medico, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String especialidad = request.getParameter("especialidad");
    MedicoDAO dao = new MedicoDAO();
    List<Medico> medicos = dao.obtenerPorEspecialidad(especialidad);
%>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
<head><title>Seleccionar Médico</title></head>
<body>
<h3>Médicos en <%= especialidad %></h3>
<table border="1" cellpadding="5">
    <tr><th>Nombre</th><th>Acción</th></tr>
    <% for (Medico m : medicos) { %>
        <tr>
            <td><%= m.getNombre() %></td>
            <td><button type="button" onclick="window.opener.seleccionarMedico('<%= m.getNombre() %>'); window.close();">Seleccionar</button></td>
        </tr>
    <% } %>
</table>
</body>
</html>
