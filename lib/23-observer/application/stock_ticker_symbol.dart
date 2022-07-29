enum StockTickerSymbol { GOOGL, TSLA, GME }

extension StockSymbolTickerExtension on StockTickerSymbol {
  String toShortString() => toString().split('.').last;
}

enum StockChangeDirection { falling, growing }
