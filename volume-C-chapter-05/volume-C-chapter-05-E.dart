void doBackgroundJob(int jobTime) {
  if (jobTime > 0) {
    print("doBackgroundJob(): $jobTime sec remained.");
    Future.delayed(Duration(seconds: 1), () => doBackgroundJob(jobTime - 1));
  } else {
    print("doBackgroundJob(): finished.");
  }
}

void main() {
  print("main(): started.");
  doBackgroundJob(5);
  print("main(): completed.");
}
