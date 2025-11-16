// =========================================
// (c) 2025 David SPORN,
// SPDX-License-Identifier: GPL-3.0-or-later
// -----------------------------------------

#include <iostream>
#include "hello.hpp"

void waitForSomeTime() {
    int whatever = 0 ;
    for(int i = 0 ; i < 1000 ; i++) {
        for (int j = 0 ; j < 1000 ; j++) {
            whatever++;
        }
    }
}