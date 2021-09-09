<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Digite o ID do Cliente para alterar o nome e o email</h1>
        <form method="post" action="upmet.jsp">
            <input type="text" name="id" value="<%=request.getParameter("id")%>" readonly"/>
            <input type="text" name="nome" value="<%=request.getParameter("nome")%>"/>
            <input type="text" name="email" value="<%=request.getParameter("email")%>"/>
            <input type="submit" value="ATUALIZAR">
        </form>
        
        <br>
        <a href="index.jsp"><button>VOLTAR</button></a>
    </body>
</html>
