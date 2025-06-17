<%@page import="modelo.Usuario"%>
<%@page session="true"%>
<%
    // Validar si hay sesión activa
    Usuario u = (Usuario) session.getAttribute("usuario");
    if (u == null) {
        response.sendRedirect("login.jsp?error=Debes iniciar sesión primero");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Menú Principal</title>
</head>
<body>
    <h2>Bienvenido, <%= u.getUsuario() %> (Rol: <%= u.getRol() %>)</h2>

    <!-- Opciones para administrador -->
    <% if (u.getRol().equals("admin")) { %>
        <h3>Opciones del Administrador</h3>
        <ul>
        <li><a href="registroHorario.jsp">Programar Horario Médico</a></li>
        <li><a href="verHorarios.jsp">Consultar Horarios por Especialidad</a></li>
        <li><a href="listarMedicos.jsp">Médicos (Agregar / Editar / Eliminar)</a></li>
        <li><a href="listarConsultorios.jsp">Consultorios</a></li>
        <li><a href="listarMedicosEspecialidades.jsp">Médicos por Especialidad</a></li>
        </ul>
    <% } %>

    <!-- Opciones para empleados o pacientes -->
    <% if (u.getRol().equals("empleado")) { %>
        <h3>Opciones del Empleado</h3>
        <ul>
        <li><a href="buscarPaciente.jsp">Solicitar Cita Médica</a></li>
        <li><a href="registrarPaciente.jsp">Registrar nuevo paciente</a></li>

        </ul>
    <% } %>

    <!-- Cierre de sesión -->
    <p><a href="CerrarSesion">Cerrar Sesión</a></p>
</body>
</html>
