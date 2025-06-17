<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Seleccionar Especialidad</title></head>
<body>
<h3>Selecciona una Especialidad</h3>
<form>
    <table border="1" cellpadding="5">
        <tr><th>Especialidad</th><th>Acción</th></tr>
        <tr>
            <td>Pediatría</td>
            <td><button type="button" onclick="window.opener.seleccionarEspecialidad('Pediatría'); window.close();">Seleccionar</button></td>
        </tr>
        <tr>
            <td>Cardiología</td>
            <td><button type="button" onclick="window.opener.seleccionarEspecialidad('Cardiología'); window.close();">Seleccionar</button></td>
        </tr>
        <tr>
            <td>Dermatología</td>
            <td><button type="button" onclick="window.opener.seleccionarEspecialidad('Dermatología'); window.close();">Seleccionar</button></td>
        </tr>
    </table>
</form>
</body>
</html>
