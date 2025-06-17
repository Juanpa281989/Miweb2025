<%@page import="modelo.Usuario"%>
<%@page session="true"%>
<%
    // Validar si hay sesi�n activa
    Usuario u = (Usuario) session.getAttribute("usuario");
    if (u == null) {
        response.sendRedirect("login.jsp?error=Debes iniciar sesi�n primero");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Men� Principal</title>
</head>
<body>
    <h2>Bienvenido, <%= u.getUsuario() %> (Rol: <%= u.getRol() %>)</h2>

    <!-- Opciones para administrador -->
    <% if (u.getRol().equals("admin")) { %>
        <h3>Opciones del Administrador</h3>
        <ul>
        <li><a href="registroHorario.jsp">Programar Horario M�dico</a></li>
        <li><a href="verHorarios.jsp">Consultar Horarios por Especialidad</a></li>
        <li><a href="listarMedicos.jsp">M�dicos (Agregar / Editar / Eliminar)</a></li>
        <li><a href="listarConsultorios.jsp">Consultorios</a></li>
        <li><a href="listarMedicosEspecialidades.jsp">M�dicos por Especialidad</a></li>
        </ul>
    <% } %>

    <!-- Opciones para empleados o pacientes -->
    <% if (u.getRol().equals("empleado")) { %>
        <h3>Opciones del Empleado</h3>
        <ul>
        <li><a href="buscarPaciente.jsp">Solicitar Cita M�dica</a></li>
        <li><a href="registrarPaciente.jsp">Registrar nuevo paciente</a></li>

        </ul>
    <% } %>

    <!-- Cierre de sesi�n -->
    <p><a href="CerrarSesion">Cerrar Sesi�n</a></p>
</body>
</html>
