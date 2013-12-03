//============================================================================
// Name        : gis.cpp
// Author      : lmetrak
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include "FileReader/FileReader.h"
using namespace std;

int main() {
	cout << "projekt gis" << endl; // prints !!!Hello World!!!

	FileReader *f = new FileReader();
	delete f;

	return 0;
}
