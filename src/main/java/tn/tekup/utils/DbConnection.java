package tn.tekup.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {


    private static final String URL = "jdbc:mysql://localhost:3306/universite";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Connection etablirConnection() throws SQLException {
        try {
            //   forcer l’enregistrement du driver 5ater el biblio installe w 3indou 3 sweyaa3 yguoli driver not found !!!!!!
            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
           throw new SQLException("Driver not found");


        } catch (SQLException e) {
//            e.printStackTrace(); // affiche kol chay msehem fel error  plus generale que getmesssage ema me t7abesech el programme 3matlou comment khater sera execute 2 fois lenna w EtudiantDb
           throw new SQLException("Connexion échouée"); // khater si la connection me mchetech donc etablirConnection() bech traja3 null donc famma nullpointerexception w elle ne sera pas catcher

        }
    }
}
