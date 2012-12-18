#include <cstdlib>
#include <iostream>
//#include <fstream>
//#include <vector>
//#include <math.h>

using namespace std;

int main(int argc, char* argv[]) {
  int zahl = atoi(argv[1]);
  int    a = atoi(argv[2]);
  int    b = atoi(argv[3]);

  float  x = a;
  float  y = b;

  while ((x != y) && (((x - y) > 0.0001) || ((y - x) > 0.0001))) {
    x = (x + y) / 2;
    y = zahl / x;
  }

  cout << x << endl;
}