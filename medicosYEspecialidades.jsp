<%@ page import="java.util.*, modelo.Medico, persistencia.MedicoDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Médicos y Especialidades</title>
    <script>
        function cargarMedicosPorEspecialidad() {
            var especialidad = document.getElementById("especialidad").value;
            if (especialidad === "") {
                document.getElementById("resultado").innerHTML = "";
                return;
            }

            fetch('MedicosPorEspecialidad?especialidad=' + encodeURIComponent(especialidad))
                .then(res => res.text())
                .then(html => {
                    document.getElementById("resultado").innerHTML = html;
                });
        }

        function seleccionarMedico(nombre) {
            alert("Médico seleccionado: " + nombre);
        }
    </script>
</head>
<body>
<h2>Buscar Médicos por Especialidad</h2>

<%
    MedicoDAO dao = new MedicoDAO();
    List<Medico> lista = dao.listarTodos();

    // Obtener especialidades únicas
    Set<String> especialidades = new HashSet<>();
    for (Medico m : lista) {
        especialidades.add(m.getEspecialidad());
    }
%>

<label for="especialidad">Especialidad:</label>
<select id="especialidad" onchange="cargarMedicosPorEspecialidad()">
    <option value="">Seleccione una especialidad</option>
    <% for (String esp : especialidades) { %>
        <option value="<%= esp %>"><%= esp %></option>
    <% } %>
</select>

<div id="resultado" style="margin-top: 20px;"></div>

<hr>
<h3>Listado completo de médicos</h3>
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
</body>
</html>
