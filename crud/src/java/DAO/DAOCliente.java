package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import MODEL.Cliente;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DAOCliente {
    
    private Connection conn;
    private PreparedStatement stmt;
    
    public DAOCliente(){
        conn = new Conexao().getConexao();
    }
    
    public void inserirCliente(Cliente cliente){
        String sql = "INSERT INTO tb_clientes(nome, email) " + "VALUES(?,?)";
        try{
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getEmail());
            stmt.execute();
            stmt.close();
        }catch(Exception erro){
            throw new RuntimeException("Erro inserir Cliente: ", erro);
        }
    }
    
    public void deletarCliente(int i){
        String sql = "DELETE FROM tb_clientes where id = ?";
        try{
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, Integer.toString(i));
            stmt.execute();
            stmt.close();
        }catch(Exception erro){
            throw new RuntimeException("Erro deleção: ",erro);
        }
    }
    
    public void updateCliente(String id, String nome, String email){
        String sql = "UPDATE tb_clientes set nome = ?, email = ? where id = ?";
        try{
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, nome);
            stmt.setString(2, email);
            stmt.setString(3, id);
            stmt.execute();
            stmt.close();
        }catch(Exception erro){
            throw new RuntimeException("Erro update: ", erro);
        }
    }
    
    public List<Cliente> getAllClientes(){
        List<Cliente> list = new ArrayList<Cliente>();
        try{
            stmt = conn.prepareStatement("SELECT * FROM tb_clientes");
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()){
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("id"));
                cliente.setNome(rs.getString("nome"));
                cliente.setEmail(rs.getString("email"));
                list.add(cliente);
            }
            stmt.close();
                    
        }catch(Exception erro){
            throw new RuntimeException("Erro consulta: ", erro);
        }
        return list;
    }
}
