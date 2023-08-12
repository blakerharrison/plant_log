import 'dart:developer';

class Logger {
  static void event(String description) {
    log('🪵 $description');
  }

  static void error(String description) {
    log('❌ Error: $description');
  }
}