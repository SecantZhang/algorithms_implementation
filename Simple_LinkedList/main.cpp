#include <iostream>
#include "LinkedLists.h"
using namespace std;

int main() {
    LinkedList<int> list;

    list.addValue(5);
    list.addValue(10);
    list.addValue(20);

    cout << list.popValue() << endl;
    cout << list.popValue() << endl;
    cout << list.popValue() << endl;

    return 0;
}