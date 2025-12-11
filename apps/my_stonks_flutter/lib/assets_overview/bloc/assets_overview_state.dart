part of 'assets_overview_bloc.dart';

enum AssetsOverviewStatus { initial, loading, success, failure }

final class AssetsOverviewState extends Equatable {
  const AssetsOverviewState({
    this.status = AssetsOverviewStatus.initial,
    this.assets = const [],
  });

  final AssetsOverviewStatus status;
  final List<AssetWithPerformanceHistory> assets;

  AssetsOverviewState copyWith({
    AssetsOverviewStatus Function()? status,
    List<AssetWithPerformanceHistory> Function()? assets,
  }) {
    return AssetsOverviewState(
      status: status != null ? status() : this.status,
      assets: assets != null ? assets() : this.assets,
    );
  }

  @override
  List<Object?> get props => [status, assets];
}
