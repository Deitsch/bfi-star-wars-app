import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class LoggingService {
  static final LoggingService _instance = LoggingService._internal();

  factory LoggingService() => _instance;

  LoggingService._internal();

  void setupLogging() {
    Logger.root.level = Level.ALL;

    setupDebugPrintLogging();
  }

  void setupDebugPrintLogging() {
    Logger.root.onRecord.listen((record) {
      debugPrint('${record.level.name}: ${record.time}: ${record.message}');
    });
  }
}
