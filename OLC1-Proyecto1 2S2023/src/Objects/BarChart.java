package Objects;

public class BarChart {

    private String Tittle;
    private String TittleX;
    private String TittleY;
    private double Values[];
    private String EjeX[];

    public BarChart() {
        Tittle = null;
        TittleX = null;
        TittleY = null;
        Values = null;
        EjeX = null;
    }

    public String getTittle() {
        return Tittle;
    }

    public void setTittle(String tittle) {
        Tittle = tittle;
    }

    public String getTittleX() {
        return TittleX;
    }

    public void setTittleX(String tittleX) {
        TittleX = tittleX;
    }

    public String getTittleY() {
        return TittleY;
    }

    public void setTittleY(String tittleY) {
        TittleY = tittleY;
    }

    public double[] getValues() {
        return Values;
    }

    public void setValues(double[] values) {
        Values = values;
    }

    public String[] getEjeX() {
        return EjeX;
    }

    public void setEjeX(String[] ejeX) {
        EjeX = ejeX;
    }

}
