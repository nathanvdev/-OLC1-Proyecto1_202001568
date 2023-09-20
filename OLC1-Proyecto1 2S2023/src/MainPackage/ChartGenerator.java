package MainPackage;

import Objects.SymbolData;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

import java.util.ArrayList;

public class ChartGenerator {
    public static void barras(
            String Titulo,
            String TituloX,
            String TituloY,
            ArrayList<String> valores,
            ArrayList<String> ejex
    )
    {
        //Ingreso de datos
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();

        if (valores.size() == ejex.size()) {
            for (int i = 0; i < valores.size(); i++) {
                String valor = valores.get(i);
                String ejeX = ejex.get(i);

                // Agregar los valores al conjunto de datos
                dataset.addValue(Double.parseDouble(valor), "Valor", ejeX);
            }
        } else {
            // Manejar el caso en el que las listas no tienen la misma cantidad de elementos
            System.out.println("Las listas no tienen la misma cantidad de elementos.");
        }


        // Creación de gráfica
        JFreeChart grafica =
                ChartFactory.createBarChart(
                        Titulo, //TITULO
                        TituloX, TituloY,
                        dataset,
                        PlotOrientation.VERTICAL,
                        true, true, true);


        // Mostrar
        ChartFrame frame = new ChartFrame("Reoporte", grafica);
        frame.pack();
        frame.setVisible(true);
    }


    public static void linea(
            String Titulo,
            String TituloX,
            String TituloY,
            double valores[],
            String ejex []
    )
    {
        //Ingreso de datos
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();


        for(int i = 0; i < 5; i++){
            dataset.addValue(valores[i], "Valor", ejex[i]);
        }

        // Creación de gráfica
        JFreeChart grafica =
                ChartFactory.createLineChart(
                        Titulo,
                        TituloX,
                        TituloY,
                        dataset);


        // Mostrar
        ChartFrame frame = new ChartFrame("Ejemplo", grafica);
        frame.pack();
        frame.setVisible(true);
    }


    public static void Pie(
            String Titulo,
            ArrayList<String> values,
            ArrayList<String> tmpEjeX
    )
    {
        //Ingreso de datos
        DefaultPieDataset dataset = new DefaultPieDataset( );

        if (values.size() == tmpEjeX.size()) {
            for (int i = 0; i < values.size(); i++) {
                String valor = values.get(i);
                String ejeX1 = tmpEjeX.get(i);

                // Agregar los valores al conjunto de datos
                dataset.setValue(ejeX1, Double.parseDouble(valor));
            }
        } else {
            // Manejar el caso en el que las listas no tienen la misma cantidad de elementos
            System.out.println("Las listas no tienen la misma cantidad de elementos.");
        }

        // Creación de gráfica
        JFreeChart grafica =
                ChartFactory.createPieChart(Titulo, dataset);


        // Mostrar
        ChartFrame frame = new ChartFrame("Ejemplo", grafica);
        frame.pack();
        frame.setVisible(true);
    }
}
