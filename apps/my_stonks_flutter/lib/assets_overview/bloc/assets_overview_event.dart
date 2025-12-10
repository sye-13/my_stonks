part of 'assets_overview_bloc.dart';

sealed class AssetsOverviewEvent extends Equatable {
  const AssetsOverviewEvent();

  @override
  List<Object> get props => [];
}

final class AssetsOverviewSubscriptionRequested extends AssetsOverviewEvent {
  const AssetsOverviewSubscriptionRequested();
}
