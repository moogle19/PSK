import java.util.Scanner;

class userwhile {
  public static void main (String [] args) {
    String str;
    Scanner in = new Scanner(System.in);

    while (!in.next().toLowerCase().equals("x")) {
      System.out.println("not x - try again!");
    }

    in.close();
  }
}
