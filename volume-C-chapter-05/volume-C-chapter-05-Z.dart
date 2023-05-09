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

Future<String> serveCustomer() async {
  print("serveCustomer(): waiting for order.");
  var customerOrder = await simulateCustomerOrder();
  print("serveCustomer(): order '$customerOrder' received.");
  return Future.value(customerOrder);
}

Future<String> simulateCustomerOrder() {
  return Future.delayed(Duration(seconds: 2), () => 'Ice Coffee');
}

void main() async {
  var bgJobFinished = ActivationFlag(false);

  print("main(): started.");
  doBackgroundJob(5, bgJobFinished);

  var customerOrder = await serveCustomer();
  print("main(): serve '$customerOrder'.");

  while (bgJobFinished.activated == false) {
    await Future.delayed(Duration(seconds: 1));
  }
  print("main(): completed.");
}

// References
// https://dart.dev/codelabs/async-await
// https://dart.dev/guides/language/language-tour#asynchrony-support
// https://dart.dev/guides/libraries/library-tour#future
// https://api.dart.dev/stable/dart-async/Future-class.html