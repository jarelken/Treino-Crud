package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import MODEL.Cliente;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Statement;
import java.util.List;


public class DAOCliente {
    
    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    
    
    public DAOCliente(){
        conn = new Conexao().getConexao();
    }
    
    public void inserirCliente(Cliente cliente){
        String sql = "INSERT INTO tb_clientes(nome, email) VALUES(?,?)";
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
        String sql = "DELETE FROM tb_clientes where id =" + i;
        try{
            st = conn.createStatement();
            st.execute(sql);
            st.close();
        }catch(Exception erro){
            throw new RuntimeException("Erro deleção: ",erro);
        }
    }
    
    public void updateCliente(Cliente cli){
        String sql = "UPDATE tb_clientes set nome = ?, email = ? where id = ?";
        try{
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cli.getNome());
            stmt.setString(2, cli.getEmail());
            stmt.setInt(3, cli.getId());
            stmt.execute();
            stmt.close();
        }catch(Exception erro){
            throw new RuntimeException("Erro update: ", erro);
        }
    }
    
    public List<Cliente> getAllClientes(){
        ArrayList<Cliente> list = new ArrayList<Cliente>();
        String sql = "SELECT * FROM tb_clientes";
        try{
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            
            while(rs.next()){
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("id"));
                cliente.setNome(rs.getString("nome"));
                cliente.setEmail(rs.getString("email"));
                list.add(cliente);
            }
            st.close();
        }catch(Exception erro){
            throw new RuntimeException("Erro consulta: ", erro);
        }
        return list;
    }
}
