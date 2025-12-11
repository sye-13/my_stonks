// This is a generated file - do not edit.
//
// Generated from asset.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Stock extends $pb.GeneratedMessage {
  factory Stock({
    $core.String? id,
    $core.String? name,
    $core.double? currentPrice,
    $core.double? initialPrice,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (currentPrice != null) result.currentPrice = currentPrice;
    if (initialPrice != null) result.initialPrice = initialPrice;
    return result;
  }

  Stock._();

  factory Stock.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Stock.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Stock',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aD(3, _omitFieldNames ? '' : 'currentPrice')
    ..aD(4, _omitFieldNames ? '' : 'initialPrice')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Stock clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Stock copyWith(void Function(Stock) updates) =>
      super.copyWith((message) => updates(message as Stock)) as Stock;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Stock create() => Stock._();
  @$core.override
  Stock createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Stock getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Stock>(create);
  static Stock? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get currentPrice => $_getN(2);
  @$pb.TagNumber(3)
  set currentPrice($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCurrentPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentPrice() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get initialPrice => $_getN(3);
  @$pb.TagNumber(4)
  set initialPrice($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasInitialPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearInitialPrice() => $_clearField(4);
}

class ETF extends $pb.GeneratedMessage {
  factory ETF({
    $core.String? id,
    $core.String? name,
    $core.double? currentPrice,
    $core.double? initialPrice,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (currentPrice != null) result.currentPrice = currentPrice;
    if (initialPrice != null) result.initialPrice = initialPrice;
    return result;
  }

  ETF._();

  factory ETF.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ETF.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ETF',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aD(3, _omitFieldNames ? '' : 'currentPrice')
    ..aD(4, _omitFieldNames ? '' : 'initialPrice')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ETF clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ETF copyWith(void Function(ETF) updates) =>
      super.copyWith((message) => updates(message as ETF)) as ETF;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ETF create() => ETF._();
  @$core.override
  ETF createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ETF getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ETF>(create);
  static ETF? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get currentPrice => $_getN(2);
  @$pb.TagNumber(3)
  set currentPrice($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCurrentPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentPrice() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get initialPrice => $_getN(3);
  @$pb.TagNumber(4)
  set initialPrice($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasInitialPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearInitialPrice() => $_clearField(4);
}

enum Asset_AssetType { stock, etf, notSet }

class Asset extends $pb.GeneratedMessage {
  factory Asset({
    Stock? stock,
    ETF? etf,
  }) {
    final result = create();
    if (stock != null) result.stock = stock;
    if (etf != null) result.etf = etf;
    return result;
  }

  Asset._();

  factory Asset.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Asset.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Asset_AssetType> _Asset_AssetTypeByTag = {
    1: Asset_AssetType.stock,
    2: Asset_AssetType.etf,
    0: Asset_AssetType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Asset',
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Stock>(1, _omitFieldNames ? '' : 'stock', subBuilder: Stock.create)
    ..aOM<ETF>(2, _omitFieldNames ? '' : 'etf', subBuilder: ETF.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Asset clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Asset copyWith(void Function(Asset) updates) =>
      super.copyWith((message) => updates(message as Asset)) as Asset;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Asset create() => Asset._();
  @$core.override
  Asset createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Asset getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Asset>(create);
  static Asset? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  Asset_AssetType whichAssetType() => _Asset_AssetTypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearAssetType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Stock get stock => $_getN(0);
  @$pb.TagNumber(1)
  set stock(Stock value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStock() => $_has(0);
  @$pb.TagNumber(1)
  void clearStock() => $_clearField(1);
  @$pb.TagNumber(1)
  Stock ensureStock() => $_ensure(0);

  @$pb.TagNumber(2)
  ETF get etf => $_getN(1);
  @$pb.TagNumber(2)
  set etf(ETF value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEtf() => $_has(1);
  @$pb.TagNumber(2)
  void clearEtf() => $_clearField(2);
  @$pb.TagNumber(2)
  ETF ensureEtf() => $_ensure(1);
}

class PerformanceHistory extends $pb.GeneratedMessage {
  factory PerformanceHistory({
    $fixnum.Int64? timestamp,
    $core.double? value,
  }) {
    final result = create();
    if (timestamp != null) result.timestamp = timestamp;
    if (value != null) result.value = value;
    return result;
  }

  PerformanceHistory._();

  factory PerformanceHistory.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PerformanceHistory.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PerformanceHistory',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timestamp')
    ..aD(2, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PerformanceHistory clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PerformanceHistory copyWith(void Function(PerformanceHistory) updates) =>
      super.copyWith((message) => updates(message as PerformanceHistory))
          as PerformanceHistory;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PerformanceHistory create() => PerformanceHistory._();
  @$core.override
  PerformanceHistory createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PerformanceHistory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PerformanceHistory>(create);
  static PerformanceHistory? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);
}

class AssetWithPerformanceHistory extends $pb.GeneratedMessage {
  factory AssetWithPerformanceHistory({
    Asset? asset,
    $core.Iterable<PerformanceHistory>? history,
  }) {
    final result = create();
    if (asset != null) result.asset = asset;
    if (history != null) result.history.addAll(history);
    return result;
  }

  AssetWithPerformanceHistory._();

  factory AssetWithPerformanceHistory.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssetWithPerformanceHistory.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssetWithPerformanceHistory',
      createEmptyInstance: create)
    ..aOM<Asset>(1, _omitFieldNames ? '' : 'asset', subBuilder: Asset.create)
    ..pPM<PerformanceHistory>(2, _omitFieldNames ? '' : 'history',
        subBuilder: PerformanceHistory.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetWithPerformanceHistory clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetWithPerformanceHistory copyWith(
          void Function(AssetWithPerformanceHistory) updates) =>
      super.copyWith(
              (message) => updates(message as AssetWithPerformanceHistory))
          as AssetWithPerformanceHistory;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetWithPerformanceHistory create() =>
      AssetWithPerformanceHistory._();
  @$core.override
  AssetWithPerformanceHistory createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AssetWithPerformanceHistory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssetWithPerformanceHistory>(create);
  static AssetWithPerformanceHistory? _defaultInstance;

  @$pb.TagNumber(1)
  Asset get asset => $_getN(0);
  @$pb.TagNumber(1)
  set asset(Asset value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAsset() => $_has(0);
  @$pb.TagNumber(1)
  void clearAsset() => $_clearField(1);
  @$pb.TagNumber(1)
  Asset ensureAsset() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<PerformanceHistory> get history => $_getList(1);
}

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();

  Empty._();

  factory Empty.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Empty.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Empty',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Empty clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Empty copyWith(void Function(Empty) updates) =>
      super.copyWith((message) => updates(message as Empty)) as Empty;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  @$core.override
  Empty createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class AssetListUpdate extends $pb.GeneratedMessage {
  factory AssetListUpdate({
    $core.Iterable<AssetWithPerformanceHistory>? assets,
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (assets != null) result.assets.addAll(assets);
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  AssetListUpdate._();

  factory AssetListUpdate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssetListUpdate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssetListUpdate',
      createEmptyInstance: create)
    ..pPM<AssetWithPerformanceHistory>(1, _omitFieldNames ? '' : 'assets',
        subBuilder: AssetWithPerformanceHistory.create)
    ..aOB(2, _omitFieldNames ? '' : 'success')
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetListUpdate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetListUpdate copyWith(void Function(AssetListUpdate) updates) =>
      super.copyWith((message) => updates(message as AssetListUpdate))
          as AssetListUpdate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetListUpdate create() => AssetListUpdate._();
  @$core.override
  AssetListUpdate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AssetListUpdate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssetListUpdate>(create);
  static AssetListUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<AssetWithPerformanceHistory> get assets => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
