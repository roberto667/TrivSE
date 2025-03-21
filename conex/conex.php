<?php
class Conexao
{
    private static $con;
    public static function conectar()
    {
        if (!isset(self::$con)) {
            $serv = "localhost";
            $user = "root";
            $senha = "";
            $db = "sergipe";
            /**$serv = "localhost";
            $user = "u332583648_root";
            $senha = "#IfsTcc@100";
            $db = "u332583648_banco"; */

            self::$con = mysqli_connect($serv, $user, $senha, $db);
            if (self::$con->connect_error) {
                //die("Conexao falhada" . self::$con->connect_errno);
            } else {
                 //echo "Conexao bem sucedida"; // Descomentar esta linha para imprimir a mensagem
            }
            return self::$con;
        }
    }
}
