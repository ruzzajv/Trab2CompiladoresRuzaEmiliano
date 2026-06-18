package erros;

public class Erro {

    private int linha, coluna;
    private String texto;
    private String tipo;


    public Erro() {
        this.linha = -1;
        this.coluna = -1;
        this.texto = "";
        this.tipo = "Sintático";
    }


    public Erro(int linha, int coluna, String texto, String tipo) {
        this.linha = linha;
        this.coluna = coluna;
        this.texto = texto;
        this.tipo = tipo;
    }


    public Erro(int linha, int coluna, String texto) {
        this(linha, coluna, texto, "Sintático");
    }


    public Erro(int linha, int coluna) {
        this(linha, coluna, null, "Sintático");
    }

    public void imprime() {
        String aux = "linha:" + this.linha + ", coluna:" + this.coluna + ", ";

        if (this.texto == null)
            aux += "erro indefinido!";
        else
            aux += this.texto;

        System.out.println(aux);
    }

    public int getLinha() {
        return linha;
    }

    public void setLinha(int linha) {
        this.linha = linha;
    }

    public int getColuna() {
        return coluna;
    }

    public void setColuna(int coluna) {
        this.coluna = coluna;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}