import 'dart:async';

import 'package:design_patterns_in_flutter/23-observer/application/concrete_stock_tickers.dart';
import 'package:design_patterns_in_flutter/23-observer/application/default_stock_subscriber.dart';
import 'package:design_patterns_in_flutter/23-observer/application/growth_stock_subscriber.dart';
import 'package:design_patterns_in_flutter/23-observer/domain/i_stock_subscriber.dart';
import 'package:design_patterns_in_flutter/23-observer/presentation/stock_subscriber_selection.dart';
import 'package:design_patterns_in_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

import '../application/stock.dart';
import '../application/stock_ticker_model.dart';
import 'stock_ticker_selection.dart';

class ObserverExample extends StatefulWidget {
  const ObserverExample({Key? key}) : super(key: key);

  @override
  State<ObserverExample> createState() => _ObserverExampleState();
}

class _ObserverExampleState extends State<ObserverExample> {
  final _stockSubscriberList = <StockSubscriber>[
    DefaultStockSubscriber(),
    GrowthStockSubscriber(),
  ];

  final _stockTickers = <StockTickerModel>[
    StockTickerModel(stockTicker: GMEStopStockTicker()),
    StockTickerModel(stockTicker: GoogleStockTicker()),
    StockTickerModel(stockTicker: TslaStockTicker()),
  ];

  final _stockEntries = <Stock>[];

  StreamSubscription<Stock>? _stockStreamSubscription;
  StockSubscriber _subscriber = DefaultStockSubscriber();
  int _selectedSubscriberIndex = 0;

  @override
  void initState() {
    super.initState();

    _stockStreamSubscription = _subscriber.stockStream.listen(_onStockChange);
  }

  @override
  void dispose() {
    for (final ticker in _stockTickers) {
      ticker.stockTicker.stopTicker();
    }
    _stockStreamSubscription!.cancel();
    super.dispose();
  }

  void _onStockChange(Stock stock) {
    setState(() {
      _stockEntries.add(stock);
    });
  }

  void _setSelectedSubscriberIndex(int? index) {
    for (final ticker in _stockTickers) {
      if (ticker.subscribed) {
        ticker.toggleSubscribed();
        ticker.stockTicker.unsubscribe(_subscriber);
      }
    }

    _stockStreamSubscription?.cancel();

    setState(() {
      _stockEntries.clear();
      _selectedSubscriberIndex = index!;
      _subscriber = _stockSubscriberList[_selectedSubscriberIndex];
      _stockStreamSubscription = _subscriber.stockStream.listen(_onStockChange);
    });
  }

  void _toggleStockTickerSelection(int index) {
    final stockTickerModel = _stockTickers[index];
    final stockTicker = stockTickerModel.stockTicker;

    stockTickerModel.subscribed
        ? stockTicker.unsubscribe(_subscriber)
        : stockTicker.subscribe(_subscriber);

    setState(() {
      stockTickerModel.toggleSubscribed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: accentColor3,
          appBar: AppBar(
            backgroundColor: primaryBgColor3,
            title: const Text('OMG: Observer - Behavioral'),
          ),
          body: ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Column(
                children: [
                  StockSubscriberSelection(
                    stockSubscriberList: _stockSubscriberList,
                    selectedSubscriberIndex: _selectedSubscriberIndex,
                    onChanged: _setSelectedSubscriberIndex,
                  ),
                  StockTickerSelection(
                    stockTickers: _stockTickers,
                    onToggle: _toggleStockTickerSelection,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
