#include <iostream>
#include <vector>
#include <sstream>
#include <iomanip>
#include <cctype>
#include <unordered_set>

using namespace std;

// Define keyword and operator sets
unordered_set<string> keywords = {"int", "float", "char", "if", "else", "while", "for", "return", "double", "void"};
unordered_set<char> operators = {'+', '-', '*', '/', '=', '<', '>', '%'};
unordered_set<char> separators = {';', '(', ')', '{', '}', ','};

// Function to check if a string is a number
bool isNumber(const string& str) {
    for (char c : str) {
        if (!isdigit(c)) return false;
    }
    return !str.empty();
}

// Function to tokenize and classify
void analyzeLine(string line, int lineNumber) {
    stringstream ss(line);
    string token;
    vector<tuple<int, string, string, string>> table; // Line, Lexeme, Token, Value

    string current;
    for (size_t i = 0; i < line.length(); ++i) {
        char ch = line[i];

        // Skip whitespace
        if (isspace(ch)) {
            if (!current.empty()) {
                ss.clear();
                ss.str(current);
                string temp;
                while (ss >> temp) {
                    table.push_back({lineNumber, temp, "UNKNOWN", "-"});
                }
                current.clear();
            }
            continue;
        }

        // If operator or separator
        if (operators.count(ch) || separators.count(ch)) {
            if (!current.empty()) {
                string lex = current;
                if (keywords.count(lex))
                    table.push_back({lineNumber, lex, "KEYWORD", "-"});
                else if (isNumber(lex))
                    table.push_back({lineNumber, lex, "NUMBER", lex});
                else
                    table.push_back({lineNumber, lex, "IDENTIFIER", lex});
                current.clear();
            }

            string lexeme(1, ch);
            if (operators.count(ch))
                table.push_back({lineNumber, lexeme, "OPERATOR", "-"});
            else
                table.push_back({lineNumber, lexeme, "SEPARATOR", "-"});
        } else {
            current += ch;
        }
    }

    // Final lexeme check
    if (!current.empty()) {
        if (keywords.count(current))
            table.push_back({lineNumber, current, "KEYWORD", "-"});
        else if (isNumber(current))
            table.push_back({lineNumber, current, "NUMBER", current});
        else
            table.push_back({lineNumber, current, "IDENTIFIER", current});
    }

    // Print table
    cout << "\n+-------------+--------+-----------+--------+\n";
    cout << "| Line Number | Lexeme |   Token   | Value  |\n";
    cout << "+-------------+--------+-----------+--------+\n";
    for (auto& row : table) {
        cout << "|"
             << setw(7) << get<0>(row) << setw(6) << " | "
             << setw(6) << get<1>(row) << " | "
             << setw(9) << get<2>(row) << " | "
             << setw(6) << get<3>(row) << " |\n";
    }
    cout << "+-------------+--------+-----------+--------+\n";
}

int main() {
    string line;
    cout << "Enter a line of code:\n> ";
    getline(cin, line);
    analyzeLine(line, 1);
    return 0;
}
