<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Agregar Médico</title></head>
<body>
<h2>Nuevo Médico</h2>
<form action="AgregarMedico" method="post">
    Nombre: <input type="text" name="nombre" required><br><br>
    Especialidad: <input type="text" name="especialidad" required><br><br>
    <input type="submit" value="Guardar">
</form>
<p><a href="listarMedicos.jsp">Volver</a></p>
</body>
</html>
