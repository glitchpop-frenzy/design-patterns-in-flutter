import 'package:design_patterns_in_flutter/23-observer/application/stock_ticker_model.dart';

import 'package:flutter/material.dart';

class StockTickerSelection extends StatelessWidget {
  final List<StockTickerModel> stockTickers;
  final ValueChanged<int> onToggle;
  const StockTickerSelection({
    Key? key,
    required this.stockTickers,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
