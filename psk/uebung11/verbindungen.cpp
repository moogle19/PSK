#include <iostream>
#include <string>

using namespace std;

string lower(string str) {

  unsigned int i;

   for(i = 0; i < str.length(); i++) {
      str[i] = tolower(str[i]);
   }
   return str;
}

int main(int argc, char** argv) {

  string start;
  string ziel;
  string startzeit;
  string zielzeit;
  string zugnr;

  while(cin.good()) {
    cin >> start >> ziel >> startzeit >> zielzeit >> zugnr;
    cout << "verbindung(" 
         << lower(start) << ", " 
         << lower(ziel) << ", " 
         << lower(startzeit) << ", " 
         << lower(zielzeit) << ", " 
         << lower(zugnr) << ")." 
         << endl;
  }

  return 0;
}
