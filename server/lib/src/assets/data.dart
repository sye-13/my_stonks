import 'generated/asset.pbgrpc.dart';

final assets = <Asset>[
  Asset()
    ..stock = (Stock()
      ..name = 's_1'
      ..initialPrice = 1.0
      ..currentPrice = 2.0),
  Asset()
    ..etf = (ETF()
      ..name = 'e_1'
      ..initialPrice = 1.0
      ..currentPrice = 2.0),
];
