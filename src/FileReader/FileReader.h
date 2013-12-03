/*
 * FileReader.h
 *
 *  Created on: Nov 16, 2013
 *      Author: amsterdam
 */

#ifndef FILEREADER_H_
#define FILEREADER_H_

#include <iostream>
#include <string>
#include <fstream>

using namespace std;

class FileReader
{
	/* plik z przykładowymi danymi
	 *
	 * 3
	 * 6 5 0
	 * 5 1 4
	 * 9 4 3
	 */


	private: const string openFilePath, saveFilePath;
	int size;
	double **matrix;
	void openFile();
	void saveFile();
	void setMatrix(ifstream *loadFile);


	public:
	void showMatrix(string s);

	FileReader(string openFilePath = "/home/amsterdam/workspace/gis_file.txt", string saveFilePath = "/home/amsterdam/workspace/gis.txt");
	~FileReader();

};


#endif /* FILEREADER_H_ */
