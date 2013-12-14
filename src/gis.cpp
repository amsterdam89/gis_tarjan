//============================================================================
// Name        : gis.cpp
// Author      : lmetrak
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include "FileReader/FileReader.h"
#include "tarjan/tarjan.h"
using namespace std;
int SIZE;

int main() {
	cout << "projekt gis" << endl; // prints !!!Hello World!!!

	FileReader *f = new FileReader();
	f->showMatrix("macierz test");
	SIZE = f->getSize();
	tarjan(f->getMatrix());
	delete f;
	return 0;
}
