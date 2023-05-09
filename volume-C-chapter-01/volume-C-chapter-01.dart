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

class TimemachineInteger extends Integer {
  List<int> _timemachine = [];
  
  TimemachineInteger([int givenValue = 0]) { 
    _value = givenValue;
  }
  
  @override
  void set(int givenValue) {
    _timemachine.add(_value);
    super.set(givenValue);
  }
  
  List getOld() {
    return _timemachine;
  }
  
  @override
  String get asString => "$_value, previously $_timemachine";
}

void main() {
  var tmpInteger1 = Integer();   
  var tmpInteger2 = Integer(3); 
  
  print("[01] ${tmpInteger1._value} and ${tmpInteger2._value}"); 
  print("[02] ${tmpInteger1.runtimeType}");
  print("[03] ${tmpInteger1.get()} and ${tmpInteger2.get()}"); 
  tmpInteger1.set(9);
  print("[04] ${tmpInteger1.get()}"); 
  print("[05] ${tmpInteger1.asString}"); 
  tmpInteger2.value = 2;
  print("[06] ${tmpInteger2.asString}"); 
  var tmpInteger3 = tmpInteger1 + tmpInteger2;
  print("[07] ${tmpInteger3.get()}"); 
  
  var tmpTmInteger1 = TimemachineInteger(); 
  var tmpTmInteger2 = TimemachineInteger(3); 
  
  print("[08] ${tmpTmInteger1._value} and ${tmpTmInteger2._value}"); 
  print("[09] ${tmpTmInteger1.runtimeType}");
  tmpTmInteger1.set(9);
  tmpTmInteger2.value = 2;
  print("[10] ${tmpTmInteger1.get()} and ${tmpTmInteger2.get()}");  
  tmpTmInteger1.set(10);
  print("[11] ${tmpTmInteger1.getOld()}"); 
  print("[12] ${tmpTmInteger1.asString}"); 
}