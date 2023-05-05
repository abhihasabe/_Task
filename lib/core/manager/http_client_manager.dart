import 'package:task/core/constants/app_network_constants.dart';
import 'package:task/core/constants/app_constant.dart';
import 'package:task/core/constants/http_constants.dart';
import 'package:task/core/errors/http/http_error.dart';
import 'package:task/core/errors/error_model.dart';
import 'package:meta/meta.dart' show required;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

abstract class HttpClientManager {
  Future<dynamic> request({
    @required Uri url,
    @required String method,
    Map body,
    Map<String, String> headers,
    String? screenName,
  });
}

class HttpClientManagerImpl implements HttpClientManager {
  final http.Client initClient;
  http.StreamedResponse? streamedResponse;

  HttpClientManagerImpl({required this.initClient});

  Future<dynamic> request(
      {@required Uri? url,
      @required String? method,
      Map? body,
      String? screenName,
      Map<String, String>? headers}) async {
    final defaultHeaders = headers ??
        {'content-type': 'application/json', 'accept': 'application/json'};
    final jsonBody = body != null ? jsonEncode(body) : null;
    var response = http.Response('', 500);
    Future<http.Response>? futureResponse;

    print("url: $url");
    print("method: $method");
    print("body: $body");
    print("headers: $headers");

    try {
      switch (method) {
        case AppNetworkConstants.get:
          futureResponse = initClient.get(url!, headers: defaultHeaders);
          break;
        case AppNetworkConstants.post:
          futureResponse = initClient
              .post(url!, headers: defaultHeaders, body: jsonBody)
              .timeout(
                  const Duration(seconds: AppConstants.DEFAULT_HTTP_TIMEOUT));
          break;
        case AppNetworkConstants.put:
          futureResponse = initClient
              .put(url!, headers: defaultHeaders, body: jsonBody)
              .timeout(
                  const Duration(seconds: AppConstants.DEFAULT_HTTP_TIMEOUT));
          break;
        case AppNetworkConstants.delete:
          futureResponse = initClient
              .delete(url!, headers: defaultHeaders)
              .timeout(
                  const Duration(seconds: AppConstants.DEFAULT_HTTP_TIMEOUT));
          break;
        case AppNetworkConstants.image:
          http.MultipartRequest request = http.MultipartRequest("POST", url!);
          http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
              'challan_photo', body?['challan_photo']);
          request.files.add(multipartFile);
          request.fields['qnt'] = body?['qnt'];
          request.fields['fuelopp_id'] = body?['fuelopp_id'];
          request.fields['vehicle_number'] = body?['vehicle_number'];
          print("request: ${request.fields}");
          request.headers.addAll(defaultHeaders);
          streamedResponse = await request.send();
          streamedResponse?.stream.transform(utf8.decoder).listen((value) {
            print("value: $value");
          });
          break;
      }
      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 30));
      }
    } catch (error) {
      throw HttpError.serverError();
    }
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    print("response: $response");
    if (response.statusCode == HTTP_OK || response.statusCode == HTTP_CREATED) {
      return jsonDecode(response.body);
    } else if (response.statusCode == HTTP_NO_CONTENT) {
      return {};
    } else if (response.statusCode == HTTP_BAD_REQUEST) {
      throw HttpError.badRequest(
          message: ErrorModel.fromJson(jsonDecode(response.body))
              .message
              .toString());
    } else if (response.statusCode == HTTP_UNAUTHORIZED) {
      throw HttpError.unauthorized();
    } else if (response.statusCode == HTTP_FORBIDDEN) {
      throw HttpError.forbidden();
    } else if (response.statusCode == HTTP_NOT_FOUND) {
      throw HttpError.notFound();
    } else if (response.statusCode == HTTP_INVALID_TYPE) {
      throw HttpError.invalidData();
    } else {
      throw HttpError.serverError();
    }
  }
}
