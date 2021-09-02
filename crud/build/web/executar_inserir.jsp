<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "MODEL.Cliente"%>
<%@page import = "DAO.DAOCliente"%>


<!DOCTYPE html>
<html>
    <body>
        <%
            try{
                Cliente cli= new Cliente();
                DAOCliente cld = new DAOCliente();
                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                if(nome.equals(null) || email.equals(null)){
                    response.sendRedirect("index.jsp");
                }else{
                    cli.setNome(nome);
                    cli.setEmail(email);
                    cld.inserirCliente(cli);
                    response.sendRedirect("index.jsp");
                }
                
            }catch(Exception erro){
                throw new RuntimeException("Erro executar inserir: ", erro);
            }
        
        
        %>
    </body>
</html>
