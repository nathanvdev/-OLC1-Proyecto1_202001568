package Objects;

public class SymbolData {
    private String fileName;
    private String symbolName;
    private String value;

    public SymbolData(String fileName, String symbolName, String value) {
        this.fileName = fileName;
        this.symbolName = symbolName;
        this.value = value;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getSymbolName() {
        return symbolName;
    }

    public void setSymbolName(String symbolName) {
        this.symbolName = symbolName;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}

