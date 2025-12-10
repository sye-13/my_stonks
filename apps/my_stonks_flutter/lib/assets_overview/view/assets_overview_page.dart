import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_stonks_flutter/assets_overview/assets_overview.dart';
import 'package:my_stonks_flutter/l10n/l10n.dart';

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
              final label = asset.hasStock()
                  ? 'Stock: ${asset.stock.name}'
                  : asset.hasEtf()
                  ? 'ETF: ${asset.etf.name}'
                  : '';
              return ListTile(
                title: Text(label),
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
