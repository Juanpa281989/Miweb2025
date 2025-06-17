<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="persistencia.EspecialidadDAO" %>
<%@ page import="persistencia.ConsultorioDAO" %>
<%@ page import="modelo.Consultorio" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Programar Horario Médico</title>
    <style>
        .modal {
            display: none;
            position: fixed;
            z-index: 10;
            left: 0; top: 0;
            width: 100%; height: 100%;
            background-color: rgba(0,0,0,0.5);
        }
        .modal-content {
            background-color: white;
            margin: 10% auto;
            padding: 20px;
            width: 400px;
            border-radius: 8px;
        }
        .modal-content h3 {
            margin-top: 0;
        }
        .modal-content button {
            margin: 5px 0;
            width: 100%;
        }
    </style>
</head>
<body>
<h2>Programar Horario Médico</h2>

<form action="${pageContext.request.contextPath}/RegistrarHorario" method="post">
    <label>Especialidad:</label>
    <input type="text" name="especialidad" id="especialidad" readonly required>
    <button type="button" onclick="abrirModal('modalEspecialidad')">Seleccionar</button><br><br>

    <label>Médico:</label>
    <input type="text" name="medico" id="medico" readonly required>
    <button type="button" onclick="abrirModal('modalMedico')">Seleccionar</button><br><br>

    <label>Fecha:</label>
    <input type="date" name="fecha" required><br><br>

<label>Hora de inicio:</label>
<select name="horaInicio" required>
    <option value="">-- Seleccione --</option>
    <option value="06:00">06:00</option>
    <option value="07:00">07:00</option>
    <option value="08:00">08:00</option>
    <option value="09:00">09:00</option>
    <option value="10:00">10:00</option>
    <option value="11:00">11:00</option>
    <option value="12:00">12:00</option>
    <!-- OMITIR 13:00 -->
    <option value="14:00">14:00</option>
    <option value="15:00">15:00</option>
    <option value="16:00">16:00</option>
    <option value="17:00">17:00</option>
</select><br><br>

<label>Hora de fin:</label>
<select name="horaFin" required>
    <option value="">-- Seleccione --</option>
    <option value="07:00">07:00</option>
    <option value="08:00">08:00</option>
    <option value="09:00">09:00</option>
    <option value="10:00">10:00</option>
    <option value="11:00">11:00</option>
    <option value="12:00">12:00</option>
    <!-- OMITIR 13:00 -->
    <option value="14:00">14:00</option>
    <option value="15:00">15:00</option>
    <option value="16:00">16:00</option>
    <option value="17:00">17:00</option>
    <option value="18:00">18:00</option>
</select><br><br>


    <label>Consultorio:</label>
    <input type="text" name="consultorio" id="consultorio" readonly required>
    <button type="button" onclick="abrirModal('modalConsultorio')">Seleccionar</button><br><br>

    <input type="submit" value="Registrar Horario">
<a href="verHorarios.jsp" style="margin-left: 10px;">
    <button type="button">Consultar Horarios por Especialidad</button>
</a>
</form>

<% String msg = (String) request.getAttribute("msg");
   if (msg != null) { %>
   <p style="color:green;"><%= msg %></p>
<% } %>

<p><a href="menu.jsp">Volver al Menú</a></p>

<!-- MODAL ESPECIALIDAD DESDE BASE -->
<div id="modalEspecialidad" class="modal">
    <div class="modal-content">
        <h3>Selecciona una Especialidad</h3>
        <%
            EspecialidadDAO espDao = new EspecialidadDAO();
            List<String> especialidades = espDao.obtenerEspecialidadesUnicas();
            for (String esp : especialidades) {
        %>
            <button onclick="seleccionarEspecialidad('<%= esp %>')"><%= esp %></button>
        <% } %>
        <button onclick="cerrarModal('modalEspecialidad')">Cerrar</button>
    </div>
</div>

<!-- MODAL MÉDICO (DINÁMICO CON FETCH) -->
<div id="modalMedico" class="modal">
    <div class="modal-content">
        <h3>Selecciona un Médico</h3>
        <div id="contenidoMedico"></div>
        <button onclick="cerrarModal('modalMedico')">Cerrar</button>
    </div>
</div>

<!-- MODAL CONSULTORIO DESDE BASE -->
<div id="modalConsultorio" class="modal">
    <div class="modal-content">
        <h3>Selecciona un Consultorio</h3>
        <%
            ConsultorioDAO daoCon = new ConsultorioDAO();
            List<Consultorio> consultorios = daoCon.listarTodos();
            for (Consultorio c : consultorios) {
        %>
            <button onclick="seleccionarConsultorio('<%= c.getNombre() %>')">
                <%= c.getNombre() %> - <%= c.getUbicacion() %>
            </button>
        <% } %>
        <button onclick="cerrarModal('modalConsultorio')">Cerrar</button>
    </div>
</div>

<script>
    function abrirModal(id) {
        if (id === 'modalMedico') {
            const especialidad = document.getElementById("especialidad").value;
            if (!especialidad) {
                alert("Primero selecciona una especialidad.");
                return;
            }
            fetch('MedicosPorEspecialidad?especialidad=' + encodeURIComponent(especialidad))
                .then(response => response.text())
                .then(html => {
                    document.getElementById("contenidoMedico").innerHTML = html;
                    document.getElementById("modalMedico").style.display = "block";
                })
                .catch(error => {
                    console.error("Error al cargar médicos:", error);
                    alert("Error cargando médicos.");
                });
        } else {
            document.getElementById(id).style.display = "block";
        }
    }

    function cerrarModal(id) {
        document.getElementById(id).style.display = "none";
    }

    function seleccionarEspecialidad(nombre) {
        document.getElementById("especialidad").value = nombre;
        cerrarModal("modalEspecialidad");
    }

    function seleccionarMedico(nombre) {
        document.getElementById("medico").value = nombre;
        cerrarModal("modalMedico");
    }

    function seleccionarConsultorio(nombre) {
        document.getElementById("consultorio").value = nombre;
        cerrarModal("modalConsultorio");
    }
</script>
</body>
</html>
