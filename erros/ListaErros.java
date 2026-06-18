package erros;

import java.util.ArrayList;
import java.util.List;

public class ListaErros {

    private List<Erro> erros = null;

    public ListaErros() {
        this.erros = new ArrayList<Erro>();
    }

    // Garanta que os três métodos abaixo existem exatamente com estes nomes e parâmetros públicos:
    public void defineErro(int linha, int coluna, String texto) {
        Erro e = new Erro(linha, coluna, texto);
        this.erros.add(e);
    }

    public void defineErro(int linha, int coluna) {
        Erro e = new Erro(linha, coluna);
        this.erros.add(e);
    }

    public void defineErro(String texto) {
        for (Erro e: this.erros){
            if (e.getTexto() == null) {
                e.setTexto(texto);
                return;
            }
        }
    }

    public void dump() {
        for (Erro e: this.erros) {
            e.imprime();
        }
    }

    public boolean hasErros(){
        return this.erros.size() > 0;
    }
}