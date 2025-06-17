<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Buscar Paciente para Solicitar Cita</title>
    <style>
        body { font-family: Arial; margin: 30px; }
        fieldset { width: 340px; }
        label { display: inline-block; width: 70px; }
        .msg { color: red; margin-top: 10px; }
    </style>
</head>
<body>
<h2>Buscar Paciente</h2>
<fieldset>
<form action="BuscarPaciente" method="post">
    <label>DNI:</label>
    <input type="text" name="dni" required>
    <input type="submit" value="Buscar">
</form>
</fieldset>

<% 
    String msg = (String) request.getAttribute("msg");
    if (msg != null) { 
%>
   <div class="msg">
      <%= msg %>
      <%-- Si el mensaje es que no existe, ofrece enlace para registrar --%>
      <%
        if (msg.toLowerCase().contains("no se encontró") || msg.toLowerCase().contains("no existe")) {
      %>
        <a href="registrarPaciente.jsp" style="margin-left: 30px; color: blue;">Registrar Paciente Nuevo</a>
      <%
        }
      %>
   </div>
<% } %>

<p><a href="menu.jsp">Volver al menú</a></p>
</body>
</html>
