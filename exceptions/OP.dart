import 'dart:async';

import 'dart:io';

import 'dart:math';

main() {
  try {
    throw TimeoutException("over time");
  } catch (e) {
    print(e);
    if (e is TimeoutException) {
      print("this is TimeoutException");
    }
  }

  try {
    throw TimeoutException("over time");
  } catch (e, stack) {
    print("msg:" + (e as TimeoutException).message);
    print(stack);
  } finally {
    print("finally");
  }

  //try {} on xxException catch(e,[stack])  特定异常类型处理
  try {
    if (Random.secure().nextBool()) {
      throw StdoutException("has error");
    } else {
      throw TimeoutException("over time 2");
    }
  } on IOException catch (e) {
    print("Could not describe object: $e");
  } catch (e) {
    print("catch: $e");
  } finally {}
}
