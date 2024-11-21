<%@page language="java" import="java.sql.*" %>


<%
String vcnpj = request.getParameter("cnpj");
String vnome = request.getParameter("txtnome");
String vemail = request.getParameter("txtemail");
String vtelefone = request.getParameter("numero");
String vestado = request.getParameter("estado");



   String banco    = "nave5" ;
    String endereco = "jdbc:mysql://localhost:3306/" + banco;
    String usuario  = "root";
    String senha    = "" ;

 
    String driver = "com.mysql.jdbc.Driver" ;

    Class.forName( driver ) ;


    Connection conexao ;

    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

 String sql = "INSERT INTO nave5 (cnpj, nome, email, telefone,  estado) values (?,?,?,?,?)" ;

    PreparedStatement stm = conexao.prepareStatement(sql) ;
    stm.setString( 1 , vcnpj ) ;
    stm.setString( 2 , vnome) ;
    stm.setString( 3 , vemail ) ;
    stm.setString( 4 , vtelefone ) ;
    stm.setString( 5 , vestado) ;

    stm.execute() ;
    stm.close() ;

    out.print("Entraremos em contato!!!");
    out.print("<br><br>") ;
    out.print("<a href='teste.html'>Voltar</a>") ;
     %>