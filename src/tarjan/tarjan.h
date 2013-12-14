/*
 * tarjan.h
 *
 *  Created on: Dec 6, 2013
 *      Author: amsterdam
 */

#ifndef TARJAN_H_
#define TARJAN_H_


#include <iostream>

extern int SIZE;


void strongConnect(int i, double ***A, int ***G, int **stack);
void tarjan(double ***A);
void setMatrix(int ***G);
void push(int val, int **stack);
int pop(int **stack);

#endif /* TARJAN_H_ */
