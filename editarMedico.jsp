<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="modelo.Medico" %>
<%
    Medico m = (Medico) request.getAttribute("medico");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Médico</title>
</head>
<body>
<h2>Editar Médico</h2>

<form action="ActualizarMedico" method="post">
    <input type="hidden" name="id" value="<%= m.getId() %>">
    Nombre: <input type="text" name="nombre" value="<%= m.getNombre() %>" required><br><br>
    Especialidad: <input type="text" name="especialidad" value="<%= m.getEspecialidad() %>" required><br><br>
    <input type="submit" value="Actualizar">
</form>

<p><a href="listarMedicos.jsp">Volver</a></p>
</body>
</html>
