
import 'package:animation_univers/counter_class.dart';
import 'package:flutter_test/flutter_test.dart';
void main(){

  
  test("chech increment method", (){
    Counter c=Counter();
    c.increment();
    expect(c.counter, 1);
  });
  
  test("check decrement met", (){
    Counter c=Counter();
    c.decrement();
    expect(c.counter, -1);
  });
}