import 'dart:async';

import 'package:design_patterns_in_flutter/23-observer/application/stock.dart';
import 'package:faker/faker.dart';

import 'package:meta/meta.dart';

abstract class StockSubscriber {
  late final String title;
  final id = faker.guid.guid();

  @protected
  final StreamController<Stock> stockStreamController =
      StreamController.broadcast();

  Stream<Stock> get stockStream => stockStreamController.stream;

  void update(Stock stock);
}
