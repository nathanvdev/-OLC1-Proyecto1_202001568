package GUI;




import Objects.SymbolData;
import Parser_statpy.Parser;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.*;

import static MainPackage.Main.Json_Analizer;
import static MainPackage.Main.Statpy_Analizer;




public class MainPanel extends JFrame {
    public JPanel FirstPanel;
    private JButton btnOpenFile;
    private JButton btnSaveFile;
    private JButton btnSaveAs;
    private JComboBox comboBox1;
    private JButton btnEject;
    private JTextArea textArea1;
    private JTextArea textArea2;
    private JScrollPane scrollPane1;
    private JScrollPane scrollPane2;

    private String  FileName;

    public MainPanel() {


        comboBox1.addItem("JSON");
        comboBox1.addItem("Statpy");

        btnOpenFile.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JFileChooser fileChooser = new JFileChooser();

                // Abre el cuadro de diálogo para seleccionar un archivo
                int returnValue = fileChooser.showOpenDialog(null);

                if (returnValue == JFileChooser.APPROVE_OPTION) {
                    // Obtiene el archivo seleccionado
                    File selectedFile = fileChooser.getSelectedFile();
                    FileName = selectedFile.getName();

                    try (BufferedReader reader = new BufferedReader(new FileReader(selectedFile))) {
                        StringBuilder content = new StringBuilder();
                        String line;

                        // Lee el contenido del archivo línea por línea
                        while ((line = reader.readLine()) != null) {
                            content.append(line).append("\n");
                        }

                        textArea2.setText(content.toString());
                    } catch (IOException ex) {
                        JOptionPane.showMessageDialog(btnOpenFile, "Error al leer el archivo: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);

                    }
                }
            }

        });
        btnEject.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if ("JSON".equals(comboBox1.getSelectedItem())) {
                    Parser_json.Parser.JsonData.clear();
                    Json_Analizer(textArea2.getText(), FileName);

                    String tmptxt = "Se guardaron Las Variables\n\n";
                    for(SymbolData Data : MainPackage.Main.JsonData){
                        tmptxt += "from: "+Data.getFileName()+" --> "+Data.getSymbolName() +": "+Data.getValue() +"\n";
                    }
                    textArea1.setText(tmptxt);

                } else if ("Statpy".equals(comboBox1.getSelectedItem())) {
                    Statpy_Analizer(textArea2.getText());

                    textArea1.setText(Parser.Statpy_Result);

                }
            }
        });
    }



}
