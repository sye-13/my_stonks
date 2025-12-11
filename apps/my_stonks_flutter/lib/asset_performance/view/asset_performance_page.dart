import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_stonks_flutter/l10n/l10n.dart';
import 'package:server/server.dart';

class AssetPerformancePage extends StatelessWidget {
  const AssetPerformancePage({
    required this.assetWithPerformanceHistory,
    super.key,
  });

  final AssetWithPerformanceHistory assetWithPerformanceHistory;

  static Route<void> route({
    required AssetWithPerformanceHistory assetWithPerformanceHistory,
  }) {
    return MaterialPageRoute(
      builder: (context) => AssetPerformancePage(
        assetWithPerformanceHistory: assetWithPerformanceHistory,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AssetPerformanceView(
      assetWithPerformanceHistory: assetWithPerformanceHistory,
    );
  }
}

class AssetPerformanceView extends StatelessWidget {
  const AssetPerformanceView({
    required this.assetWithPerformanceHistory,
    super.key,
  });

  final AssetWithPerformanceHistory assetWithPerformanceHistory;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.assetsPerformanceAppBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ChartView(
          assetWithPerformanceHistory: assetWithPerformanceHistory,
        ),
      ),
    );
  }
}

class ChartView extends StatelessWidget {
  const ChartView({
    required this.assetWithPerformanceHistory,
    super.key,
  });

  final AssetWithPerformanceHistory assetWithPerformanceHistory;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final priceHistory = assetWithPerformanceHistory.history
        .map(
          (e) => (
            DateTime.fromMillisecondsSinceEpoch(e.timestamp.toInt()),
            e.value,
          ),
        )
        .toList();
    final asset = assetWithPerformanceHistory.asset;
    final name = asset.hasStock()
        ? asset.stock.name
        : asset.hasEtf()
        ? asset.etf.name
        : '';

    final hasHistory = priceHistory.isNotEmpty;

    return !hasHistory
        ? Center(child: Text(l10n.assetsPerformanceEmptyText(name)))
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              _ChartTitle(
                name: name,
                startDate: priceHistory.first.$1,
                endDate: priceHistory.last.$1,
              ),
              AspectRatio(
                aspectRatio: 1.4,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(
                        show: false,
                        drawHorizontalLine: false,
                        drawVerticalLine: false,
                        horizontalInterval: 10,
                        verticalInterval: 1,
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: const Border(
                          left: BorderSide(color: Colors.green, width: 2),
                          bottom: BorderSide(color: Colors.green, width: 2),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: priceHistory.asMap().entries.map((e) {
                            final index = e.key;
                            final item = e.value;
                            final value = item.$2;
                            return FlSpot(index.toDouble(), value);
                          }).toList(),
                          dotData: const FlDotData(show: false),
                          color: Colors.green,
                          shadow: const Shadow(
                            color: Colors.green,
                            blurRadius: 2,
                          ),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                Colors.green.withValues(alpha: 2),
                                Colors.green.withValues(alpha: 0.5),
                              ],
                              stops: const [0.5, 1.0],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ],
                      lineTouchData: LineTouchData(
                        touchSpotThreshold: 5,
                        getTouchedSpotIndicator:
                            (LineChartBarData barData, List<int> spotIndexes) {
                              return spotIndexes.map((spotIndex) {
                                return TouchedSpotIndicatorData(
                                  const FlLine(
                                    color: Colors.red,
                                    strokeWidth: 1.5,
                                    dashArray: [8, 2],
                                  ),
                                  FlDotData(
                                    getDotPainter:
                                        (spot, percent, barData, index) {
                                          return FlDotCirclePainter(
                                            radius: 6,
                                            strokeColor: Colors.green,
                                          );
                                        },
                                  ),
                                );
                              }).toList();
                            },
                        touchTooltipData: LineTouchTooltipData(
                          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                            return touchedBarSpots.map((barSpot) {
                              final price = barSpot.y;
                              final date = priceHistory[barSpot.x.toInt()].$1;
                              return LineTooltipItem(
                                '',
                                const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        '${date.year}/${date.month}/${date.day}',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\n\$${price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              );
                            }).toList();
                          },
                          getTooltipColor: (LineBarSpot barSpot) =>
                              Colors.black,
                        ),
                      ),
                      titlesData: FlTitlesData(
                        rightTitles: const AxisTitles(),
                        topTitles: const AxisTitles(),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 52,
                            maxIncluded: false,
                            minIncluded: false,
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 38,
                            maxIncluded: false,
                            getTitlesWidget: (double value, TitleMeta meta) {
                              final date = priceHistory[value.toInt()].$1;
                              return SideTitleWidget(
                                meta: meta,
                                child: Transform.rotate(
                                  angle: -45 * 3.14 / 180,
                                  child: Text(
                                    '${date.month}/${date.day}',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    duration: const Duration(milliseconds: 300),
                  ),
                ),
              ),
            ],
          );
  }
}

class _ChartTitle extends StatelessWidget {
  const _ChartTitle({
    required this.name,
    required this.startDate,
    required this.endDate,
  });

  final String name;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          name,
          style: const TextStyle(
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        if (startDate != null && endDate != null)
          Text(
            '${startDate!.year}/${startDate!.month}/${startDate!.day} - ${endDate!.year}/${endDate!.month}/${endDate!.day}',
            style: const TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        const SizedBox(height: 16),
      ],
    );
  }
}
