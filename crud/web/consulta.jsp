<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="DAO.DAOCliente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <h1>Lista de Clientes</h1>
        <%
            DAOCliente cld = new DAOCliente();
            int i = 0;
            out.print("<table border='1'> "
                    + "<tr> "
                    + "<th>ID</th>"
                    + "<th>NOME</th>"
                    + "<th>EMAIL</th>"
                    + "<th>EDITAR</th>"
                    + "<th>EXCLUIR</th>"
                    + "</tr>");
            while(i<cld.getAllClientes().size()){
                out.print("<tr>");
                    out.print("<td>"+cld.getAllClientes().get(i).getId()+"</td>");
                    out.print("<td>"+cld.getAllClientes().get(i).getNome()+"</td>");
                    out.print("<td>"+cld.getAllClientes().get(i).getEmail()+"</td>");
                    out.print("<td><a href='update.jsp?id="
                            + cld.getAllClientes().get(i).getId()
                            + "&nome="+cld.getAllClientes().get(i).getNome()
                            + "&email="+cld.getAllClientes().get(i).getEmail()+"'>CLIQUE</a></td>");
                    out.print("<td><a href='delmet.jsp?id="
                            + cld.getAllClientes().get(i).getId()
                            +"'>CLIQUE</a></td>");
                    
                out.print("</tr>");
                i++;
            }
            out.print("</table>");
        %>
        <br>
        <a href="index.jsp"><button>VOLTAR</button></a>
        
    
</html>
