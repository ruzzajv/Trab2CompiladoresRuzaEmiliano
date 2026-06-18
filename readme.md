& "C:\Users\jruza\.jdks\openjdk-24.0.1\bin\java.exe" -cp "jflex-1.9.1.jar;java-cup-11b.jar" jflex.Main scanner/Scanner.flex

"C:\Users\jruza\.jdks\openjdk-24.0.1\bin\javac.exe" -cp ".;java-cup-11b.jar" erros/*.java scanner/*.java parser/*.java Main.java

& "C:\Users\jruza\.jdks\openjdk-24.0.1\bin\java.exe" -cp ".;java-cup-11b.jar" Main teste1.mj        