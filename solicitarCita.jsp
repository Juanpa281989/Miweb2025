<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Paciente" %>
<%@ page import="persistencia.EspecialidadDAO" %>
<%@ page import="persistencia.MedicoDAO" %>

<%
    // Obtener paciente y especialidades desde el request
    Paciente paciente = (Paciente) request.getAttribute("paciente");
    List<String> especialidades = (List<String>) request.getAttribute("especialidades");
%>

<% if (paciente != null) { %>

<h2>Registrar Cita Médica para <%= paciente.getNombres() + " " + paciente.getApellidos() %></h2>
<form action="RegistrarCita" method="post">
    <!-- Mostrar los datos del paciente -->
    <label>Documento:</label>
    <input type="text" name="documento" value="<%= paciente.getDocumento() %>" readonly><br><br>

    <label>Nombres:</label>
    <input type="text" name="nombres" value="<%= paciente.getNombres() %>" readonly><br><br>

    <label>Apellidos:</label>
    <input type="text" name="apellidos" value="<%= paciente.getApellidos() %>" readonly><br><br>

    <!-- Especialidad -->
    <label>Especialidad:</label>
    <select id="especialidad" name="especialidad" onchange="cargarMedicos()" required>
        <option value="">-- Selecciona --</option>
        <% if (especialidades != null) {
             for (String esp : especialidades) { %>
            <option value="<%= esp %>"><%= esp %></option>
        <%   }
           } %>
    </select><br><br>

    <!-- Médico -->
    <label>Médico:</label>
    <input type="text" id="medico" name="medico" readonly required><br><br>

    <!-- Fecha -->
    <label>Fecha:</label>
    <select name="fecha" id="fecha" onchange="cargarHoras()" required>
        <option value="">-- Selecciona --</option>
    </select><br><br>

    <!-- Hora -->
    <label>Hora:</label>
    <select name="hora" id="hora" required>
        <option value="">-- Selecciona --</option>
    </select><br><br>

    <!-- Consultorio -->
    <label>Consultorio:</label>
    <input type="text" name="consultorio" id="consultorio" readonly required><br><br>

    <input type="submit" value="Confirmar Cita">
</form>

<p><a href="menu.jsp">Volver al menú</a></p>

<% } else { %>
    <div style="color: red; margin-top: 18px;">
        No se ha encontrado al paciente, por favor regístrelo.<br>
        <a href="registrarPaciente.jsp" style="color:blue; margin-top: 10px; display:inline-block;">Registrar Paciente Nuevo</a>
    </div>
<% } %>

<script>
    function cargarMedicos() {
        const especialidad = document.getElementById("especialidad").value;
        fetch("MedicosPorEspecialidad?especialidad=" + encodeURIComponent(especialidad))
            .then(response => response.text())
            .then(html => {
                document.getElementById("medico").value = "";  // Limpiar médico seleccionado
                document.getElementById("fecha").innerHTML = "<option value=''>-- Selecciona --</option>";  // Limpiar fechas
                document.getElementById("hora").innerHTML = "<option value=''>-- Selecciona --</option>";  // Limpiar horas
                document.getElementById("medico").parentElement.innerHTML = html;
            })
            .catch(error => {
                console.error("Error al cargar médicos:", error);
                alert("Error al cargar médicos.");
            });
    }

    function cargarFechas(medico) {
        fetch("FechasProgramadas?medico=" + encodeURIComponent(medico))
            .then(response => response.text())
            .then(html => {
                document.getElementById("fecha").innerHTML = html;
                document.getElementById("hora").innerHTML = "<option value=''>-- Selecciona --</option>";
            });
    }

    function cargarHoras() {
        const medico = document.getElementById("medico").value;
        const fecha = document.getElementById("fecha").value;
        if (medico && fecha) {
            fetch("HorasDisponibles?medico=" + encodeURIComponent(medico) + "&fecha=" + encodeURIComponent(fecha))
                .then(response => response.text())
                .then(html => {
                    document.getElementById("hora").innerHTML = html;
                });
        }
    }
</script>
