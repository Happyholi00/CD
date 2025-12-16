#include <iostream>
#include <cctype>
#include <string>
using namespace std;

bool isKeyword(string word) {
    string keywords[] = {"int", "float", "if", "else", "while", "return"};
    for (string kw : keywords)
        if (word == kw) return true;
    return false;
}

int main() {
    string code = "int x = 10; while(x > 0) x = x - 1;";
    string word = "";
    cout << "Tokens:\n";

    for (char c : code) {
        if (isalnum(c))
            word += c;
        else {
            if (!word.empty()) {
                if (isKeyword(word))
                    cout << word << " --> Keyword\n";
                else if (isdigit(word[0]))
                    cout << word << " --> Number\n";
                else
                    cout << word << " --> Identifier\n";
                word = "";
            }
            if (ispunct(c))
                cout << c << " --> Symbol/Operator\n";
        }
    }
}
