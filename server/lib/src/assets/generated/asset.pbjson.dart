// This is a generated file - do not edit.
//
// Generated from asset.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use stockDescriptor instead')
const Stock$json = {
  '1': 'Stock',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'current_price', '3': 2, '4': 1, '5': 1, '10': 'currentPrice'},
    {'1': 'initial_price', '3': 3, '4': 1, '5': 1, '10': 'initialPrice'},
  ],
};

/// Descriptor for `Stock`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockDescriptor = $convert.base64Decode(
    'CgVTdG9jaxISCgRuYW1lGAEgASgJUgRuYW1lEiMKDWN1cnJlbnRfcHJpY2UYAiABKAFSDGN1cn'
    'JlbnRQcmljZRIjCg1pbml0aWFsX3ByaWNlGAMgASgBUgxpbml0aWFsUHJpY2U=');

@$core.Deprecated('Use eTFDescriptor instead')
const ETF$json = {
  '1': 'ETF',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'current_price', '3': 2, '4': 1, '5': 1, '10': 'currentPrice'},
    {'1': 'initial_price', '3': 3, '4': 1, '5': 1, '10': 'initialPrice'},
  ],
};

/// Descriptor for `ETF`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eTFDescriptor = $convert.base64Decode(
    'CgNFVEYSEgoEbmFtZRgBIAEoCVIEbmFtZRIjCg1jdXJyZW50X3ByaWNlGAIgASgBUgxjdXJyZW'
    '50UHJpY2USIwoNaW5pdGlhbF9wcmljZRgDIAEoAVIMaW5pdGlhbFByaWNl');

@$core.Deprecated('Use assetDescriptor instead')
const Asset$json = {
  '1': 'Asset',
  '2': [
    {
      '1': 'stock',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.Stock',
      '9': 0,
      '10': 'stock'
    },
    {'1': 'etf', '3': 2, '4': 1, '5': 11, '6': '.ETF', '9': 0, '10': 'etf'},
  ],
  '8': [
    {'1': 'asset_type'},
  ],
};

/// Descriptor for `Asset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetDescriptor = $convert.base64Decode(
    'CgVBc3NldBIeCgVzdG9jaxgBIAEoCzIGLlN0b2NrSABSBXN0b2NrEhgKA2V0ZhgCIAEoCzIELk'
    'VURkgAUgNldGZCDAoKYXNzZXRfdHlwZQ==');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor =
    $convert.base64Decode('CgVFbXB0eQ==');

@$core.Deprecated('Use assetListUpdateDescriptor instead')
const AssetListUpdate$json = {
  '1': 'AssetListUpdate',
  '2': [
    {'1': 'assets', '3': 1, '4': 3, '5': 11, '6': '.Asset', '10': 'assets'},
    {'1': 'success', '3': 2, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `AssetListUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetListUpdateDescriptor = $convert.base64Decode(
    'Cg9Bc3NldExpc3RVcGRhdGUSHgoGYXNzZXRzGAEgAygLMgYuQXNzZXRSBmFzc2V0cxIYCgdzdW'
    'NjZXNzGAIgASgIUgdzdWNjZXNzEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2U=');
