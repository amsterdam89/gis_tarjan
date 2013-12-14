/*
 * tarjan.cpp
 *
 *  Created on: Dec 6, 2013
 *      Author: amsterdam
 */
#include "tarjan.h"

using namespace std;


int cursor = 0;
int index = 0;
int STACK_SIZE;


//4 index
//5 lowlink


void tarjan(double ***A)
{
	int **G;//[SIZE][2];
	int *stack;

	cursor = 0;
	index = 0;
	STACK_SIZE = SIZE * 100;

    cout << "tarjan!" << endl;

    stack = new int[STACK_SIZE];
    G = new int * [SIZE];
    for(int i = 0; i < SIZE; i++)
    	G[i] = new int[2];

    setMatrix(&G);


	for (int i = 0; i < SIZE; i++)
	{
		if (G[i][0] == -1)
		{
			strongConnect(i, A, &G, &stack);
		}
	}



	for (int i = 0; i < SIZE; i++)
    	delete G[i];
	delete G;
	delete stack;
}

void setMatrix(int ***G) {

	for(int i = 0 ; i < SIZE ; i++)
		for(int k = 0 ; k < 2 ; k++)
			(*G)[i][k] = -1;
}


void push(int val, int **stack)
{
	(*stack)[cursor++] = val;
}

int pop(int **stack)
{
	if (cursor > 0)
		return (*stack)[--cursor];
	else
		return 999999;

}

void strongConnect(int i, double ***A, int ***G, int **stack)
{

	(*G)[i][0] = index;
	(*G)[i][1] = index;

	index++;
	push(i, stack);

	for (int j = 0; j < SIZE; j++)
	{
		if ((*A)[i][j] == 1)
		{
			if ( (*G)[j][0] == -1)
			{
				strongConnect(j,A,G,stack);
				(*G)[i][1] = min((*G)[j][1], (*G)[i][1]);
			}
			else
			{
				int found = 0;
				for (int k = 0; k < STACK_SIZE; k++)
				{
					if ((*stack)[k] == j)
					{
						found = 1;
					}
				}
				if (found == 1)
				{
					(*G)[i][1] = min((*G)[j][0], (*G)[i][1]);
				}
			}
		}
	}

	if ((*G)[i][0] == (*G)[i][1])
	{

		cout << "#######" << endl;
		int p;
		do
		{
			p = pop(stack);
			cout << p << endl;

		}
		while (p != i);
	}


}

