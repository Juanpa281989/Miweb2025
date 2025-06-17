<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registrar Nuevo Paciente</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            background-color: #f4f4f9;
        }
        fieldset {
            width: 400px;
            padding: 20px;
            border: 2px solid #ccc;
            border-radius: 10px;
        }
        label {
            display: inline-block;
            width: 160px;
            padding: 10px 0;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        input[type="submit"] {
            width: auto;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .msg {
            margin-top: 15px;
            font-weight: bold;
            color: #f44336;
        }
        p {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<h2>Registrar Nuevo Paciente</h2>

<fieldset>
    <form action="RegistrarPaciente" method="post">
        <label for="documento">Documento:</label>
        <input type="text" name="documento" id="documento" required><br><br>

        <label for="nombres">Nombres:</label>
        <input type="text" name="nombres" id="nombres" required><br><br>

        <label for="apellidos">Apellidos:</label>
        <input type="text" name="apellidos" id="apellidos" required><br><br>

        <label for="fechaNacimiento">Fecha de Nacimiento:</label>
        <input type="date" name="fechaNacimiento" id="fechaNacimiento" required><br><br>

        <label for="sexo">Sexo:</label>
        <select name="sexo" id="sexo" required>
            <option value="">-- Seleccione --</option>
            <option value="Masculino">Masculino</option>
            <option value="Femenino">Femenino</option>
        </select><br><br>

        <label for="estadoCivil">Estado Civil:</label>
        <select name="estadoCivil" id="estadoCivil" required>
            <option value="">-- Seleccione --</option>
            <option value="Soltero">Soltero</option>
            <option value="Casado">Casado</option>
            <option value="Divorciado">Divorciado</option>
            <option value="Viudo">Viudo</option>
        </select><br><br>

        <input type="submit" value="Registrar Paciente">
    </form>
</fieldset>

<%-- Mostrar mensaje si lo hay --%>
<%
    String msg = (String) request.getAttribute("msg");
    if (msg != null) {
%>
    <div class="msg"><%= msg %></div>
<% } %>

<p><a href="menu.jsp">Volver al Menú</a></p>

</body>
</html>
