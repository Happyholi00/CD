 
#include <iostream> 
#include <vector> 
#include <string> 
using namespace std; 
 
struct Quadruple { 
    string result, op1, op, op2; 
}; 
 
bool isSameExpression(Quadruple a, Quadruple b) { 

     return (a.op == b.op && a.op1 == b.op1 && a.op2 == b.op2); 
} 
 
int main() { 
    int n; 
    cout << "Enter number of quadruples: "; 
    cin >> n; 
    cin.ignore();  
 
    vector<Quadruple> q(n); 
 
    cout << "\nEnter quadruples in format: result = op1 op op2\n\n"; 
    for(int i = 0; i < n; i++) { 
        string result, eq, op1, op, op2; 
        cin >> result >> eq >> op1 >> op >> op2; 
        q[i] = {result, op1, op, op2}; 
    } 
 
    cout << "\nOptimized Quadruples:\n\n"; 
 
    for(int i = 0; i < n; i++) { 
        bool found = false; 
 
        for(int j = 0; j < i; j++) { 
            if(isSameExpression(q[i], q[j])) { 
                cout << q[i].result << " = " << q[j].result << endl; 
                found = true; 
                break; 
            } 
        } 
 
        if(!found) { 
            cout << q[i].result << " = " << q[i].op1 << " " << q[i].op << " " << q[i].op2 << endl; 
        } 
    } 
 
    return 0; 
}