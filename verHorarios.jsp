<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.*, modelo.Horario, persistencia.HorarioDAO" %>
<%
    HorarioDAO dao = new HorarioDAO();
    List<Horario> lista = dao.listarTodos();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Horarios Programados</title>
</head>
<body>
    <h2>Horarios de Atención Médica</h2>

    <table border="1" cellpadding="5">
        <thead>
            <tr>
                <th>Especialidad</th>
                <th>Médico</th>
                <th>Fecha</th>
                <th>Hora Inicio</th>
                <th>Hora Fin</th>
                <th>Consultorio</th>
                <th>Estado</th>
            </tr>
        </thead>
        <tbody>
        <% for (Horario h : lista) { %>
            <tr>
                <td><%= h.getEspecialidad() %></td>
                <td><%= h.getMedico() %></td>
                <td><%= h.getFecha() %></td>
                <td><%= h.getHora() %></td>
                <td><%= h.getHoraFin() != null ? h.getHoraFin() : "-" %></td>
                <td><%= h.getConsultorio() %></td>
                <td><%= h.getEstado() %></td>
            </tr>
        <% } %>
        </tbody>
    </table>

    <p><a href="menu.jsp">Volver al menú</a></p>
</body>
</html>
