<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.DAOCliente" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
                DAOCliente cld = new DAOCliente();
                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                String id = request.getParameter("id");
                if(id.equals("")||id.contains("ID")){
                    response.sendRedirect("update.jsp");
                }else{
                    cld.updateCliente(id, nome, email);
                    response.sendRedirect("index.jsp");
                }
            }catch(Exception erro){
                throw new RuntimeException("Erro atualização: ", erro);
            }
        %>
    </body>
</html>
