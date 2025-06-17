<%@page import="java.util.List"%>
<%@page import="modelo.Medico"%>
<%@page import="persistencia.MedicoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    MedicoDAO dao = new MedicoDAO();
    List<Medico> lista = dao.listarTodos();

    String mensaje = "";
    if ("1".equals(request.getParameter("error"))) {
        mensaje = "⚠️ Ocurrió un error al procesar la solicitud.";
    } else if ("ok".equals(request.getParameter("actualizado"))) {
        mensaje = "✅ Médico actualizado correctamente.";
    } else if ("ok".equals(request.getParameter("eliminado"))) {
        mensaje = "✅ Médico eliminado correctamente.";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Médicos</title>
</head>
<body>
    <h2>Listado de Médicos</h2>

    <% if (!mensaje.isEmpty()) { %>
        <p style="color: green;"><%= mensaje %></p>
    <% } %>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Especialidad</th>
            <th>Acciones</th>
        </tr>
        <%
            for (Medico m : lista) {
        %>
        <tr>
            <td><%= m.getId() %></td>
            <td><%= m.getNombre() %></td>
            <td><%= m.getEspecialidad() %></td>
            <td>
                <!-- Selección del médico -->
                <button type="button" onclick="seleccionarMedico('<%= m.getNombre() %>')">Seleccionar</button>
                <!-- Otras acciones como Editar y Eliminar -->
                <a href="EditarMedico?id=<%= m.getId() %>">Editar</a>

                <form action="EliminarMedico" method="post" style="display:inline;" onsubmit="return confirm('¿Estás seguro de eliminar?');">
                    <input type="hidden" name="id" value="<%= m.getId() %>">
                    <input type="submit" value="Eliminar">
                </form>
            </td>
        </tr>
        <% } %>
    </table>

    <br>
    <a href="AgregarMedico.jsp">Agregar Nuevo Médico</a> |
    <a href="menu.jsp">Volver al Menú</a>

    <script>
        // Esta función selecciona el médico y lo pasa al formulario
        function seleccionarMedico(nombreMedico) {
            // Asumiendo que el formulario está en otra ventana (popup)
            window.opener.document.getElementById("medico").value = nombreMedico;
            window.close();  // Cierra la ventana emergente
        }
    </script>
</body>
</html>
