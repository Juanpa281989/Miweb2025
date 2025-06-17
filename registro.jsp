<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Registro</title></head>
<body>
<h2>Registro de Usuario</h2>
<form action="${pageContext.request.contextPath}/RegistroControl" method="post">
    Usuario: <input type="text" name="usuario" required><br>
    Clave: <input type="password" name="clave" required><br>
    Rol:
    <select name="rol">
        <option value="empleado">Empleado</option>
        <option value="admin">Administrador</option>
    </select><br>
    <input type="submit" value="Registrar">
</form>
<p><a href="login.jsp">¿Ya tienes cuenta? Inicia sesión</a></p>

<% String msg = (String) request.getAttribute("msg");
   if (msg != null) { %>
   <p style="color:green;"><%= msg %></p>
<% } %>
</body>
</html>
