import 'package:design_patterns_in_flutter/23-observer/application/stock.dart';
import 'package:design_patterns_in_flutter/23-observer/domain/i_stock_subscriber.dart';

class DefaultStockSubscriber extends StockSubscriber {
  @override
  void update(Stock stock) {
    stockStreamController.add(stock);
  }
}
