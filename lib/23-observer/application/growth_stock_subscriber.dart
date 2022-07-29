import 'package:design_patterns_in_flutter/23-observer/application/stock.dart';
import 'package:design_patterns_in_flutter/23-observer/application/stock_ticker_symbol.dart';
import 'package:design_patterns_in_flutter/23-observer/domain/i_stock_subscriber.dart';

class GrowthStockSubscriber extends StockSubscriber {
  @override
  void update(Stock stock) {
    if (stock.changeDirection == StockChangeDirection.growing) {
      stockStreamController.add(stock);
    }
  }
}
