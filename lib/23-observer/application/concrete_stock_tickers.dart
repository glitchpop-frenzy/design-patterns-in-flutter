import 'dart:async';

import 'package:design_patterns_in_flutter/23-observer/application/stock_ticker_symbol.dart';
import 'package:design_patterns_in_flutter/23-observer/domain/i_stock_ticker.dart';

class GMEStopStockTicker extends StockTicker {
  // GMEStopStockTicker() {
  //   title = StockTickerSymbol.GME.toShortString();
  //   stockTimer = Timer.periodic(const Duration(seconds: 2), (_) {
  //     setStock(StockTickerSymbol.GME, 16000, 22000);
  //     notifySubscribers();
  //   });
  // }

  @override
  setTimer() {
    stockTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      setStock(StockTickerSymbol.GME, 16000, 22000);
      notifySubscribers();
    });
  }

  @override
  setTitle() {
    title = StockTickerSymbol.GME.toShortString();
  }
}

class GoogleStockTicker extends StockTicker {
  @override
  setTimer() {
    stockTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      setStock(StockTickerSymbol.GOOGL, 200000, 204000);
      notifySubscribers();
    });
  }

  @override
  setTitle() {
    title = StockTickerSymbol.GOOGL.toShortString();
  }
}

class TslaStockTicker extends StockTicker {
  @override
  setTimer() {
    stockTimer = Timer.periodic(
      const Duration(seconds: 2),
      (_) => setStock(
        StockTickerSymbol.TSLA,
        60000,
        65000,
      ),
    );
    notifySubscribers();
  }

  @override
  setTitle() {
    title = StockTickerSymbol.TSLA.toShortString();
  }
}
