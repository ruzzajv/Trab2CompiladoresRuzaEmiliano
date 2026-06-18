import java.io.*;
import erros.ListaErros;
import scanner.Scanner;
import parser.parser;

class Main {
    public static void main(String[] args) throws Exception {
        String nomeArquivo = "teste1.mj";
        if (args.length == 1) {
            nomeArquivo = args[0];
        }

        ListaErros listaErros = new ListaErros();

        try {
            FileReader in = new FileReader(nomeArquivo);
            Scanner scanner = new Scanner(in, listaErros);
            parser parser = new parser(scanner);

            parser.parse();
        } catch (Exception e) {

        }

        if (listaErros.hasErros()) {
            listaErros.dump();
        } else {
            System.out.println("Programa aceito sem erros!");
        }
    }
}