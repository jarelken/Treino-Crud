<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.DAOCliente" %>
<%@page import="MODEL.Cliente" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
                Cliente cli = new Cliente();
                DAOCliente cld = new DAOCliente();
                cli.setNome(request.getParameter("nome")) ;
                cli.setEmail(request.getParameter("email"));
                cli.setId(Integer.parseInt(request.getParameter("id")));
                cld.updateCliente(cli);
                response.sendRedirect("consulta.jsp");
                
            }catch(Exception erro){
                throw new RuntimeException("Erro atualização: ", erro);
            }
        %>
    </body>
</html>
