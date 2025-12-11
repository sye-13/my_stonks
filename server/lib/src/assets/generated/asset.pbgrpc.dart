// This is a generated file - do not edit.
//
// Generated from asset.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'asset.pb.dart' as $0;

export 'asset.pb.dart';

@$pb.GrpcServiceName('AssetsService')
class AssetsServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AssetsServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseStream<$0.AssetListUpdate> streamAssets(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(
        _$streamAssets, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.AssetListUpdate> updateAsset(
    $0.AssetWithPerformanceHistory request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateAsset, request, options: options);
  }

  // method descriptors

  static final _$streamAssets =
      $grpc.ClientMethod<$0.Empty, $0.AssetListUpdate>(
          '/AssetsService/StreamAssets',
          ($0.Empty value) => value.writeToBuffer(),
          $0.AssetListUpdate.fromBuffer);
  static final _$updateAsset =
      $grpc.ClientMethod<$0.AssetWithPerformanceHistory, $0.AssetListUpdate>(
          '/AssetsService/UpdateAsset',
          ($0.AssetWithPerformanceHistory value) => value.writeToBuffer(),
          $0.AssetListUpdate.fromBuffer);
}

@$pb.GrpcServiceName('AssetsService')
abstract class AssetsServiceBase extends $grpc.Service {
  $core.String get $name => 'AssetsService';

  AssetsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.AssetListUpdate>(
        'StreamAssets',
        streamAssets_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.AssetListUpdate value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.AssetWithPerformanceHistory, $0.AssetListUpdate>(
            'UpdateAsset',
            updateAsset_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AssetWithPerformanceHistory.fromBuffer(value),
            ($0.AssetListUpdate value) => value.writeToBuffer()));
  }

  $async.Stream<$0.AssetListUpdate> streamAssets_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async* {
    yield* streamAssets($call, await $request);
  }

  $async.Stream<$0.AssetListUpdate> streamAssets(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$0.AssetListUpdate> updateAsset_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AssetWithPerformanceHistory> $request) async {
    return updateAsset($call, await $request);
  }

  $async.Future<$0.AssetListUpdate> updateAsset(
      $grpc.ServiceCall call, $0.AssetWithPerformanceHistory request);
}
