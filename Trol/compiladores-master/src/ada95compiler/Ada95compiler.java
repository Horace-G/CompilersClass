/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ada95compiler;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author OWNER
 */
public class Ada95compiler {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String path = "src/ada95compiler/lexer_code.flex";
        /*Descomentar este fragmento de código para generar un nuevo lexer
         ,cada vez que se genera un nuevo lexer debe eliminarse el archivo
         creado anteriormente.
         */
        //generateLexer(path);

        /*Descomentar este fragmento para para correr el lexer creado,
         debe dejarse comentado el código para generar el lexer.
         */
        Reader reader;
        try {
            reader = new BufferedReader(new FileReader("texto.txt"));
            Lexer lexer = new Lexer(reader);
            lexer.yylex();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Ada95compiler.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Ada95compiler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void generateLexer(String path) {
        File file = new File(path);
        jflex.Main.generate(file);
    }
;
}
