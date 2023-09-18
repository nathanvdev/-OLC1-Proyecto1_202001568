package MainPackage;

import java.io.StringReader;


public class Main {
    public static void main(String[] args) {
        //analizadores("src/statpy/", "Lexer.jflex", "Parser.cup");
        //analizadores("src/JsonParser/", "Lexer.jflex", "Parser.cup");

        String entrada = """
                       Console.Write("hola")
                        """;

        String Jsontxt = """
                // Comentario Simple
                /* Comentario
                Multilinea*/
                                
                {
                	"titulo":"Reporte 1",
                	"ejex1":"Reprobado",
                	"ejex2":"Aprobado",
                	"val1": 60.0,
                	"val2": 61.0
                }
                """;

        //analizar(entrada);
        //System.out.println(Parser.Statpy_Result);

        Json_Analizer(Jsontxt);
        for (String clave : JsonParser.Parser.JsonData.keySet()) {
            Object valor = JsonParser.Parser.JsonData.get(clave);
            System.out.println(clave +" : "+ valor);
        }

    }

    public static void analizadores(String ruta, String jflexFile, String cupFile){
        try {
            String opcionesJflex[] =  {ruta+jflexFile,"-d",ruta};
            jflex.Main.generate(opcionesJflex);

            String opcionesCup[] =  {"-destdir", ruta,"-parser","Parser",ruta+cupFile};
            java_cup.Main.main(opcionesCup);

        } catch (Exception e) {
            System.out.println("No se ha podido generar los analizadores");
            System.out.println(e);
        }
    }

    // Realizar Analisis
    public static void analizar (String entrada){
            try {
                statpy.Lexer lexer = new statpy.Lexer(new StringReader(entrada));
                statpy.Parser parser = new statpy.Parser(lexer);
                parser.parse();
            } catch (Exception e) {
                System.out.println("Error fatal en compilación de entrada.");
                System.out.println(e);
            }
        }

    public static void Json_Analizer (String entrada){
        try {
            JsonParser.Lexer lexer = new JsonParser.Lexer(new StringReader(entrada));
            JsonParser.Parser parser = new JsonParser.Parser(lexer);
            parser.parse();
        } catch (Exception e) {
            System.out.println("Error fatal en compilación de entrada.");
            System.out.println(e);
        }
    }
}
