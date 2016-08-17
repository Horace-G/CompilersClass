/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package alexico;

import java.io.File;

/**
 *
 * @author horac
 */
public class Alexico {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String path = "C:\\Users\\horac\\Documents\\NetBeansProjects\\alexico\\src\\alexico\\Lexer.flex";
        File file = new File(path);
        jflex.Main.generate(file);
    }
    
}
