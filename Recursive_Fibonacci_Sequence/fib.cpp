#include <iostream>
using namespace std;

int fib (int n);

int fib (int n) {
    if (n == 0) return 0;
    else if (n == 1) return 1;
    else
        return fib(n - 1) + fib(n - 2);
}

int main() {
    cout << fib(6) << endl;
    cout << fib(15) << endl;

    return 0;
}