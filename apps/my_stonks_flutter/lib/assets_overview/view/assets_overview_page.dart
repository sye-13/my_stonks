import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_stonks_flutter/assets_overview/assets_overview.dart';
import 'package:my_stonks_flutter/l10n/l10n.dart';
import 'package:server/server.dart';

class AssetsOverviewPage extends StatelessWidget {
  const AssetsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AssetsOverviewBloc(
        assetsRepository: context.read<AssetsRepository>(),
      )..add(const AssetsOverviewSubscriptionRequested()),
      child: const AssetsOverviewView(),
    );
  }
}

class AssetsOverviewView extends StatelessWidget {
  const AssetsOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.assetsOverviewAppBarTitle),
      ),
      body: BlocBuilder<AssetsOverviewBloc, AssetsOverviewState>(
        builder: (context, state) {
          if (state.assets.isEmpty) {
            if (state.status == AssetsOverviewStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status != AssetsOverviewStatus.success) {
              return const SizedBox.shrink();
            } else {
              return Center(
                child: Text(
                  l10n.assetsOverviewEmptyText,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            }
          }
          return ListView.builder(
            itemCount: state.assets.length,
            itemBuilder: (context, index) {
              final asset = state.assets.elementAt(index);
              return AssetCard(
                asset: asset,
                onTap: (asset) {},
              );
            },
          );
        },
      ),
    );
  }
}

class AssetCard extends StatelessWidget {
  const AssetCard({required this.asset, required this.onTap, super.key});

  final Asset asset;
  final void Function(Asset) onTap;

  @override
  Widget build(BuildContext context) {
    final assetType = asset.hasStock() ? 'Stock' : 'ETF';
    final name = asset.hasStock() ? asset.stock.name : asset.etf.name;
    final currentPrice = asset.hasStock()
        ? asset.stock.currentPrice
        : asset.etf.currentPrice;
    final initialPrice = asset.hasStock()
        ? asset.stock.initialPrice
        : asset.etf.initialPrice;

    final percentChange = initialPrice == 0
        ? 0
        : ((currentPrice - initialPrice) / initialPrice) * 100;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(assetType),
        onTap: () => onTap(asset),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\$${currentPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              '${percentChange.toStringAsFixed(2)}%',
              style: TextStyle(
                fontSize: 16,
                color: percentChange >= 0 ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
