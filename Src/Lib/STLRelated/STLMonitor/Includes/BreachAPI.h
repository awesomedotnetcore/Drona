#ifndef BREACHAPI
#define BREACHAPI

#include "engine.h"
#include <iostream>
#include <fstream>
#include <stdio.h>
#include <vector>
#include <string.h>

using namespace std;

class BreachAPI
{
private:
    Engine *matEng;    // Matlab engine
    bool engOn;
    bool initBreach;

public:
    BreachAPI();

    bool StartMatlabEngine();
    bool StopMatlabEngine();

    bool InitBreach(char* pathToBreach);

    double STLEval(char* spec, char* fileName);
    double* STLEvalOnLine(const char* spec, const char* fileName);

};
#endif // !BreachAPI
