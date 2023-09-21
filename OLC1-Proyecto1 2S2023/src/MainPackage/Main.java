package MainPackage;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Objects;

import GUI.MainPanel;
import javax.swing.*;
import Objects.*;
import Parser_statpy.Parser;


public class Main {
    public static HashMap<String, String> globalVariables = new HashMap<>();
    public static ArrayList<SymbolData> toFind = new ArrayList<>();
    public static ArrayList<SymbolData> JsonData = new ArrayList<>();

    public static ArrayList<String>  tmplist_values = new ArrayList<>();
    public static ArrayList<String> tmplist_ejex = new ArrayList<>();

    public static BarChart BarChart1 = new BarChart();
    public static void main(String[] args) {
        //analizadores("src/Parser_statpy/", "Lexer.jflex", "Parser.cup");
        //analizadores("src/Parser_json/", "Lexer.jflex", "Parser.cup");





        try {
            UIManager.setLookAndFeel("com.sun.java.swing.plaf.gtk.GTKLookAndFeel");
        } catch(Exception ignored){}
        MainPanel hello = new MainPanel();
        hello.setContentPane(hello.FirstPanel);
        hello.setSize(800, 900);
        hello.setTitle("Compi1");
        hello.setVisible(true);
        hello.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);




        //Statpy_Analizer(entrada);
        //System.out.println(Parser.Statpy_Result);


    }

    public static void analizadores(String ruta, String jflexFile, String cupFile){
        try {
            String[] opcionesJflex =  {ruta+jflexFile,"-d",ruta};
            jflex.Main.generate(opcionesJflex);

            String[] opcionesCup =  {"-destdir", ruta,"-parser","Parser",ruta+cupFile};
            java_cup.Main.main(opcionesCup);

        } catch (Exception e) {
            System.out.println("No se ha podido generar los analizadores");
            System.out.println(e);
        }
    }

    // Realizar Analisis
    public static void Statpy_Analizer (String entrada){
            try {
                tmplist_ejex.clear();
                tmplist_values.clear();
                Parser.Statpy_Result = "";
                Parser_statpy.Lexer lexer = new Parser_statpy.Lexer(new StringReader(entrada));
                Parser_statpy.Parser parser = new Parser_statpy.Parser(lexer);
                parser.parse();

                Parser.Statpy_Result = Tabulaciones();

            } catch (Exception e) {
                System.out.println("Error fatal en compilación de entrada.");
                System.out.println(e);
            }
        }

    public static void Json_Analizer (String entrada, String NameFIle){
        try {
            Parser_json.Lexer lexer = new Parser_json.Lexer(new StringReader(entrada));
            Parser_json.Parser parser = new Parser_json.Parser(lexer);
            parser.parse();

            for (String clave : Parser_json.Parser.JsonData.keySet()) {
                String valor = Parser_json.Parser.JsonData.get(clave);
                JsonData.add(new SymbolData(NameFIle, clave, valor));
            }



        } catch (Exception e) {
            System.out.println("Error fatal en compilación de entrada.");
            System.out.println(e);
        }
    }

    private static void ShowData(ArrayList<SymbolData> jsonData) {
        for (SymbolData symbolData : jsonData) {
            String fileName = symbolData.getFileName();
            String symbolName = symbolData.getSymbolName();
            Object value = symbolData.getValue();
            System.out.println("FileName: " + fileName + ", SymbolName: " + symbolName + ", Value: " + value);
        }
        System.out.println("------------------------------------------------------------------------------------------------------");
    }

    public static String FindVariable(String VarName){

        for (String key : globalVariables.keySet()) {
            String value = globalVariables.get(key);

            if (VarName.equals(key)){
                return value;
            }

        }
        System.out.println("no se encontro la variable");



        return "null";
    }

    public static String FinInJson(String FileName, String VarName){

        for (SymbolData symbolData : JsonData) {
            String fileName = symbolData.getFileName();
            String symbolName = symbolData.getSymbolName();
            String value = symbolData.getValue();

            if (fileName.equals(FileName) && symbolName.equals(VarName)){
                return value;
            }
        }
        System.out.println("No se encontro la Variable");
        return "null";
    }

    public static void createBarChart(){
        ChartGenerator.barras(BarChart1.getTittle(), BarChart1.getTittleX(), BarChart1.getTittleY(), tmplist_values, tmplist_ejex);
    }

    public static void createPieChart(){
        ChartGenerator.Pie(BarChart1.getTittle(), tmplist_values, tmplist_ejex);
    }

    public static String Tabulaciones() {
        String[] lines = Parser.Statpy_Result.split("\n");
        StringBuilder newResult = new StringBuilder();
        newResult.append("def main():\n");
        int tabs = 0;

        for (String line : lines) {
            if (line.equals("IDENT[START]")) {
                tabs++;
            } else if (line.equals("IDENT[FINISH]")) {
                tabs--;
            } else {
                for (int i = 0; i < tabs; i++) {
                    newResult.append("\t"); // Agregar una tabulación antes del texto
                }
                newResult.append(line).append("\n"); // Agregar la línea original sin salto de línea adicional
            }
        }

        return newResult.toString();
    }

}

