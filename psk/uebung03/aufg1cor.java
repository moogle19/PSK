import java.io.*;
public class aufg1cor {
  public static void main(String[] args){
      if(args.length != 1) {
      System.err.println("Aufruf: java aufg3_1 <Datei oder Verzeichnis>");
      System.exit(0);
    }
    try {
      delete(args[0]);
    }
    catch (IllegalArgumentException e) {
      System.err.println(e.getMessage());
    }
  }

  public static void delete(String datname) {
    File f = new File(datname);
    if (!f.exists()) fail("aufg3_1: Datei existiert nicht: " + datname);
    if (!f.canWrite()) fail("aufg3_1: schreibgeschuetzt: " + datname);
    if (f.isDirectory()) {
	String[] dateien = f.list();
	  if (dateien.length > 0)
        fail("aufg3_1: Verzeichnis nicht leer:" + datname);
    }
    boolean erfolg = f.delete();
    if(!erfolg) fail("aufg3_1: Loeschen fehlgeschlagen");
    }

  protected static void fail(String s) throws IllegalArgumentException {
    throw new IllegalArgumentException(s);
  }
}