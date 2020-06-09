#include <iostream>
#include <unistd.h>

#define EXTERNC extern "C" __attribute__((visibility("default"))) __attribute__((used))

static bool isRunning = false;

/// Starts a long runng process
EXTERNC
int start(){
  if(isRunning) return 1;

  isRunning = true;

  std::cerr << "Long running process started ..." << std::endl;

  while(isRunning){
    sleep(1);
  }
  std::cerr << "Long running process stopped ..." << std::endl;
  return 0;
}

/// Stops the long running process
EXTERNC
void stop(){
  isRunning = false;
}
