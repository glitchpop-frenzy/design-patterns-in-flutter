import 'dart:async';

import 'package:faker/faker.dart';
import 'package:meta/meta.dart';
import '../application/stock.dart';
import '../application/stock_ticker_symbol.dart';
import 'i_stock_subscriber.dart';

abstract class StockTicker {
  late final String title;
  late final Timer stockTimer;

  setTitle();
  setTimer();

  @protected
  Stock? stock;

  final _subscribers = <StockSubscriber>[];

  void subscribe(StockSubscriber subscriber) => _subscribers.add(subscriber);
  void unsubscribe(StockSubscriber subscriber) => _subscribers.removeWhere(
        (subs) => subs.id == subscriber.id,
      );
  void notifySubscribers() {
    for (final subscriber in _subscribers) {
      subscriber.update(stock!);
    }
  }

  void setStock(StockTickerSymbol stockTickerSymbol, int min, int max) {
    final lastStock = stock;
    final price = faker.randomGenerator.integer(max, min: min) / 100;
    final changeAmount = lastStock != null ? price - lastStock.price : 0.0;

    stock = Stock(
      changeAmount: changeAmount,
      price: price,
      symbol: stockTickerSymbol,
      changeDirection: changeAmount > 0
          ? StockChangeDirection.growing
          : StockChangeDirection.falling,
    );
  }

  void stopTicker() {
    stockTimer.cancel();
  }
}
