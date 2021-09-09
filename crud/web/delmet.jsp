<%@page import = "DAO.DAOCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                String id = request.getParameter("id");
                cld.deletarCliente(Integer.parseInt(id));
                response.sendRedirect("consulta.jsp");  
            }catch(Exception erro){
                throw new RuntimeException("Erro deletar: ", erro);
            }
        
        
        %>
    </body>
</html>
