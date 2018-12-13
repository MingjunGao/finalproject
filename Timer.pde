//set up the time to stop the game: 1 min
class Timer {
  int savedTime; 
  int totalTime; 
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
 
  void start() {
    savedTime = millis();
  }
  boolean isFinished() {//stop GAME if finished is true 

    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {//time pass stop
      return true;
    } else {
      return false;
    }
  }
}
