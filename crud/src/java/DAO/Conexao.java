package DAO;
import java.sql.DriverManager;
import java.sql.Connection;

public class Conexao {
    public Connection getConexao(){
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            return DriverManager.getConnection("jdbc:derby://localhost/crudDB","jarel","123");
        }catch(Exception erro){
            throw new RuntimeException("Erro conexão: ", erro);
        }
    }
}
