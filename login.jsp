<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Login</title></head>
<body>
<h2>Iniciar Sesión</h2>
<form action="${pageContext.request.contextPath}/LoginControl" method="post">
    Usuario: <input type="text" name="usuario" required><br>
    Clave: <input type="password" name="clave" required><br>
    <input type="submit" value="Iniciar Sesión">
</form>
<p><a href="registro.jsp">¿No tienes cuenta? Regístrate aquí</a></p>

<% if (request.getParameter("error") != null) { %>
    <p style="color:red;"><%= request.getParameter("error") %></p>
<% } %>
</body>
</html>
