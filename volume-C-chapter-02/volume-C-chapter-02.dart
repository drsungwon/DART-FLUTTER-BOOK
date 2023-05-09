class Integer {
  late int _value;

  Integer([int givenValue = 0]) {
    _value = givenValue;
  }

  int get() {
    return _value;
  }

  void set(int givenValue) {
    _value = givenValue;
  }

  String get asString => "$_value";

  set value(int givenValue) => _value = givenValue;

  Integer operator +(Integer givenValue) {
    return Integer(_value + givenValue.get());
  }
}

mixin ActivationFlag {
  bool _flag = true;

  bool get activated => _flag;
  set activated(bool givenFlag) => (_flag = givenFlag);
}

class TimemachineInteger extends Integer with ActivationFlag {
  List<int> _timemachine = [];

  TimemachineInteger([int givenValue = 0]) {
    _value = givenValue;
  }

  @override
  void set(int givenValue) {
    if (activated == true) {
      _timemachine.add(_value);
      print("set($givenValue) called ==> _timemachine is $_timemachine");
    } else {
      print("set($givenValue) called ==> current $_value is ignored.");
    }

    super.set(givenValue);
  }

  List getOld() {
    return _timemachine;
  }

  @override
  String get asString => "$_value, previously $_timemachine";
}

void main() {
  var tmpTmInteger = TimemachineInteger(0);
  tmpTmInteger.set(2);
  tmpTmInteger.set(4);
  tmpTmInteger.activated = false;
  tmpTmInteger.set(6);
  tmpTmInteger.activated = true;
  tmpTmInteger.set(8);
  print("${tmpTmInteger.asString}");
}
