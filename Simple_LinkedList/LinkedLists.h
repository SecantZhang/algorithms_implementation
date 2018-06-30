//
// Created by Wilson Zhang on 6/30/18.
//

#ifndef LINKEDLIST_LINKEDLISTS_H
#define LINKEDLIST_LINKEDLISTS_H

#endif //LINKEDLIST_LINKEDLISTS_H

#include <iostream>
using namespace std;

template <class T>
class LinkedList {
    struct Node {
        T item;
        Node * next;
    };

public:
    // Constructor
    LinkedList () {
        head = NULL;
    }

    // Deconstructor
    ~LinkedList () {
        Node * next = head;

        while (next) {
            Node * deleteMe = next;
            next = next -> next;
            delete deleteMe;
        }
    }

    void addValue (T inputItem) {
        Node * n = new Node();
        n -> item = inputItem;
        n -> next = head;

        head = n;
    }

    T popValue () {
        Node * n = head;
        T ret = n -> item;

        head = head -> next;
        delete n;
        return ret;
    }

private:
    Node * head; // Pointer to the first node.
};
