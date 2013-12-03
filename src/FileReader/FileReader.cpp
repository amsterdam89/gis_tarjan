/*
 * FileReader.cpp
 *
 *  Created on: Nov 16, 2013
 *      Author: amsterdam
 */

#include "FileReader.h"

FileReader::FileReader(string const openFilePath, string const saveFilePath):
openFilePath(openFilePath),
saveFilePath(saveFilePath)
{
	openFile();
	//saveFile();
}

void FileReader::openFile(){

	ifstream loadFile;
	loadFile.open(openFilePath.c_str(),ifstream::in);
	if(loadFile.is_open()) {

		loadFile >> size;
		setMatrix(&loadFile);


		loadFile.close();
	}
}

void  FileReader::saveFile(){

    ofstream saveFile (saveFilePath.c_str());

    saveFile << "Zadanie rozwiązane pomyślnie przez algorytm " <<endl;
	for(int i = 0; i < size; i++) {
		for(int j = 0; j < size; j++)
			saveFile << matrix[i][j] << " ";
		saveFile << endl;
	}

    saveFile.close();
}

void FileReader::setMatrix(ifstream *loadFile) {

	matrix = new double*[size];
	for (int i = 0; i < size; i++) {
		matrix[i] = new double[size];}

	for(int i = 0; i < size; i++)
		for(int j = 0; j < size; j++)
			*loadFile >> matrix[i][j];
}

