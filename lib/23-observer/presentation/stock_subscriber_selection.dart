import 'package:design_patterns_in_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

import '../domain/i_stock_subscriber.dart';

class StockSubscriberSelection extends StatefulWidget {
  final List<StockSubscriber> stockSubscriberList;
  final int selectedSubscriberIndex;
  final ValueChanged<int> onChanged;
  const StockSubscriberSelection({
    Key? key,
    required this.stockSubscriberList,
    required this.selectedSubscriberIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<StockSubscriberSelection> createState() =>
      _StockSubscriberSelectionState();
}

class _StockSubscriberSelectionState extends State<StockSubscriberSelection> {
  late StockSubscriber _stockSubscriber;

  @override
  void didChangeDependencies() {
    _stockSubscriber =
        widget.stockSubscriberList[widget.selectedSubscriberIndex];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          activeColor: primaryBgColor3,
          value: widget.stockSubscriberList[0],
          groupValue: _stockSubscriber,
          onChanged: (StockSubscriber? val) {
            setState(() {
              _stockSubscriber = val!;
            });
          },
          title: const Text('Default Stock Subscriber'),
        ),
        RadioListTile(
          activeColor: primaryBgColor3,
          value: widget.stockSubscriberList[1],
          groupValue: _stockSubscriber,
          onChanged: (StockSubscriber? val) {
            setState(() {
              _stockSubscriber = val!;
            });
          },
          title: const Text('Growing Stock Subscriber'),
        ),
      ],
    );
  }
}
