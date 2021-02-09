import 'dart:core';

extension StringParsing on String {
  bool toBoolean() {
    return this == '1' || this == 'true';
  }
}
