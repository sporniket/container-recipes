//hello.cpp
//Just print "hello, TOS !" to std stream

#include <iostream>

int main() {
    std::cout << "Hello, TOS !" << std::endl;
    // loop for some time
    int whatever = 0 ;
    for(int i = 0 ; i < 1000 ; i++) {
        for (int j = 0 ; j < 1000 ; j++) {
            whatever++;
        }
    }
    return 0;
}

