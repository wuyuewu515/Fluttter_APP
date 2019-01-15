import 'package:flutter/foundation.dart';

class LogUtils {
  ///log日志输出   filter---过滤器（最好是当前的类名）   msg---日志信息
  static showLog(filter, String msg) {
    debugPrint(filter.toString() + '---------------' + msg);
  }
}
