<%@page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Consulta JSP</title>
    <style>
        tr:nth-child(even) {
            background-color: rgb(234, 229, 229);
        }
        tr:hover{
            background-color: #29df00;
        }
    </style>
</head>
<body>
    <%
        //variaveis para o banco de dados
        String banco    = "nave5" ;
        String endereco = "jdbc:mysql://localhost:3306/"+banco;
        String usuario  = "root";
        String senha    = "" ;

        //Variavel para o Driver
        String driver = "com.mysql.jdbc.Driver" ;

        //Carregar o driver na memória
        Class.forName( driver ) ;

        //Cria a variavel para conectar com o banco de dados
        Connection conexao ;

        //Abrir a conexao com o banco de dados
        conexao = DriverManager.getConnection(endereco, usuario, senha) ;

        String sql = "SELECT * FROM nave5" ;

        //Cria o statement para executar o comando no banco
        PreparedStatement stm = conexao.prepareStatement(sql) ;

        ResultSet  dados = stm.executeQuery() ;

        out.print("<table border=1 width='500'>");
        out.print("<tr>") ;
            out.print("<th>Codigo</th>") ;
            out.print("<th>CNPJ</th>") ;
            out.print("<th>Nome</th>") ;
            out.print("<th>Email</th>") ;
            out.print("<th>Telefone</th>") ;
            out.print("<th>Estado</th>") ;
        out.print("</tr>") ;
        while( dados.next() ) 
        {
            out.print("<tr>") ;
                out.print("<td>") ;
                    out.print( dados.getString("codigo") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("cnpj") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("nome") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("email") ) ;
                out.print("</td>") ;  

                 out.print("<td>") ;
                    out.print( dados.getString("telefone") ) ;
                out.print("</td>") ;         
                
                out.print("<td>") ;
                    out.print( dados.getString("estado") ) ;
                out.print("</td>") ;         

            out.print("</tr>") ;

        }

        out.print("</table>") ;
    %>
</body>
</html>

