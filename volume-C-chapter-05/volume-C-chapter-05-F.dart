class ActivationFlag {
  late bool _flag;

  ActivationFlag(bool givenFlag) : _flag = givenFlag;
  bool get activated => _flag;
  set activated(bool givenFlag) => (_flag = givenFlag);
}

void doBackgroundJob(int jobTime, var jobEnd) {
  if (jobTime > 0) {
    print("doBackgroundJob(): $jobTime sec remained.");
    Future.delayed(
        Duration(seconds: 1), () => doBackgroundJob(jobTime - 1, jobEnd));
  } else {
    print("doBackgroundJob(): finished.");
    jobEnd.activated = true;
  }
}

void main() async {
  var bgJobFinished = ActivationFlag(false);

  print("main(): started.");
  doBackgroundJob(5, bgJobFinished);
  while (bgJobFinished.activated == false) {
    await Future.delayed(Duration(seconds: 1));
  }
  print("main(): completed.");
}
