<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="executar_inserir.jsp">
            <h1>Cadastro</h1>
            <label>NOME</label><br>
            <input name="nome" type="text" required/><br>
            <label>EMAIL</label><br>
            <input name="email" type="text" required/><br><br>
            <input type="submit" value="ENVIAR"/>
        </form>
    </body>
</html>
