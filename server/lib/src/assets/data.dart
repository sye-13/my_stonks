import 'dart:math';

import 'generated/asset.pbgrpc.dart';
import 'package:fixnum/fixnum.dart';

final assets = <AssetWithPerformanceHistory>[
  AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..stock = (Stock()
        ..id = 'stock_1'
        ..name = 'Company A'
        ..initialPrice = 1.0
        ..currentPrice = 2.0))
    ..history.addAll(createPerformanceHistory(1.0, 100)),
  AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..etf = (ETF()
        ..id = 'etf_1'
        ..name = 'ETF Alpha'
        ..initialPrice = 1.0
        ..currentPrice = 2.0))
    ..history.addAll([]),
  // Assuming no performance history for ETFs
  AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..stock = (Stock()
        ..id = 'stock_2'
        ..name = 'Company B'
        ..initialPrice = 1.5
        ..currentPrice = 2.5))
    ..history.addAll(createPerformanceHistory(1.5, 100)),
  AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..stock = (Stock()
        ..id = 'stock_3'
        ..name = 'Company C'
        ..initialPrice = 2.0
        ..currentPrice = 3.0))
    ..history.addAll(createPerformanceHistory(2.0, 100)),
  AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..stock = (Stock()
        ..id = 'stock_4'
        ..name = 'Company D'
        ..initialPrice = 3.5
        ..currentPrice = 4.5))
    ..history.addAll(createPerformanceHistory(3.5, 100)),
  AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..stock = (Stock()
        ..id = 'stock_5'
        ..name = 'Company E'
        ..initialPrice = 2.2
        ..currentPrice = 3.2))
    ..history.addAll(createPerformanceHistory(2.2, 100)),
  AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..stock = (Stock()
        ..id = 'stock_6'
        ..name = 'Company F'
        ..initialPrice = 4.0
        ..currentPrice = 5.5))
    ..history.addAll(createPerformanceHistory(4.0, 100)),
  AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..stock = (Stock()
        ..id = 'stock_7'
        ..name = 'Company G'
        ..initialPrice = 5.0
        ..currentPrice = 6.0))
    ..history.addAll(createPerformanceHistory(5.0, 100)),
  AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..stock = (Stock()
        ..id = 'stock_8'
        ..name = 'Company H'
        ..initialPrice = 3.0
        ..currentPrice = 4.0))
    ..history.addAll(createPerformanceHistory(3.0, 100)),
  AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..etf = (ETF()
        ..id = 'etf_2'
        ..name = 'ETF Beta'
        ..initialPrice = 2.5
        ..currentPrice = 3.5))
    ..history.addAll([]),
  // No performance history for ETFs
  AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..stock = (Stock()
        ..id = 'stock_9'
        ..name = 'Company I'
        ..initialPrice = 4.5
        ..currentPrice = 5.5))
    ..history.addAll(createPerformanceHistory(4.5, 100)),
  AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..stock = (Stock()
        ..id = 'stock_10'
        ..name = 'Company J'
        ..initialPrice = 6.5
        ..currentPrice = 8.0))
    ..history.addAll(createPerformanceHistory(6.5, 100)),
  AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..etf = (ETF()
        ..id = 'etf_3'
        ..name = 'ETF Gamma'
        ..initialPrice = 4.0
        ..currentPrice = 5.0))
    ..history.addAll([]),
  // No performance history for ETFs
  AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..etf = (ETF()
        ..id = 'etf_4'
        ..name = 'ETF Delta'
        ..initialPrice = 3.0
        ..currentPrice = 4.0))
    ..history.addAll([]),
  // No performance history for ETFs
  AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..stock = (Stock()
        ..id = 'stock_11'
        ..name = 'Company K'
        ..initialPrice = 7.0
        ..currentPrice = 8.5))
    ..history.addAll(createPerformanceHistory(7.0, 100)),
  AssetWithPerformanceHistory()
    ..asset = (Asset()
      ..stock = (Stock()
        ..id = 'stock_12'
        ..name = 'Company L'
        ..initialPrice = 9.0
        ..currentPrice = 10.5))
    ..history.addAll(createPerformanceHistory(9.0, 100)),
];

final random = Random();

List<PerformanceHistory> createPerformanceHistory(
  double initialValue,
  int days,
) {
  final history = <PerformanceHistory>[];

  double currentValue = initialValue;

  for (int i = 0; i < days; i++) {
    final date = DateTime.now().subtract(Duration(days: i));
    final timestamp = Int64(date.millisecondsSinceEpoch);

    final change = (random.nextDouble() - 0.5);
    currentValue += change;

    if (currentValue < 0) {
      currentValue = 0;
    }

    final historyEntry = PerformanceHistory()
      ..timestamp = timestamp
      ..value = currentValue;

    history.add(historyEntry);
  }

  return history.reversed.toList();
}
