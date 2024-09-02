import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class InitializeTranzactionCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    double? amount,
    String? referenceID = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "amount": $amount,
  "reference": "$referenceID"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'initializeTranzaction',
      apiUrl: 'https://api.paystack.co/transaction/initialize',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk_test_ce0ac846b82c7c6bf77383c9406108294349dc87',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.authorization_url''',
      ));
  static String? accessCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.access_code''',
      ));
  static String? referenceID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.reference''',
      ));
}

class VerifyTransactionCall {
  static Future<ApiCallResponse> call({
    String? refID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'verifyTransaction',
      apiUrl: 'https://api.paystack.co/transaction/verify/$refID',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk_test_ce0ac846b82c7c6bf77383c9406108294349dc87',
        'Content-Type': 'application/json',
      },
      params: {
        'refID': refID,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.status''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
