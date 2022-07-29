import 'package:design_patterns_in_flutter/23-observer/application/stock_ticker_symbol.dart';

class Stock {
  late StockTickerSymbol symbol;
  late double price;
  late double changeAmount;
  final StockChangeDirection changeDirection;

  Stock({
    required this.changeAmount,
    required this.changeDirection,
    required this.price,
    required this.symbol,
  });
}
