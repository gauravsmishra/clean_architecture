import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:imdb_poc/api/environment.dart';
import 'package:imdb_poc/core/utils/common_widgets.dart';
import '../core/utils/constants.dart';
import 'error_response.dart';
import 'api_service.dart';
import 'network.dart';

bool isRefreshing = false;

InterceptorsWrapper requestInterceptor(Dio dio) => InterceptorsWrapper(
      onRequest: (RequestOptions options,
          RequestInterceptorHandler requestHandler) async {
        final uri = options.uri.toString();
        options.queryParameters['language'] = 'en-US';
        options.queryParameters['api_key'] = Environment.apiKey;
        List<ConnectivityResult> connectivityResult =
            await Connectivity().checkConnectivity();

        if (connectivityResult.contains(ConnectivityResult.none)) {
          showInternetStatusSnackBar(Const.navigatorKey.currentContext!, false,
              options, requestHandler);
        } else if (connectivityResult.contains(ConnectivityResult.mobile)) {
          showInternetStatusSnackBar(Const.navigatorKey.currentContext!, true,
              options, requestHandler);
        } else {}

        if (ApiService().isInDebugMode) {
          // log("Api - URL: ${uri.toString()}");
          // log("Api - Request Body: ${options.data}");
          // log("Api - Request header: ${options.headers}");
        }
        options.cancelToken;
        return requestHandler.next(options);
      },
      onResponse: (Response<dynamic> response,
          ResponseInterceptorHandler requestHandler) {
        // if (ApiService().isInDebugMode) {
        // log("Api - Response: ${response.data}");
        // }
        return requestHandler.next(response);
      },
      onError: onError,
    );

void onError(DioException e, ErrorInterceptorHandler handler) async {
  if (ApiService().isInDebugMode) {}

  await handleErrorStatus(e.response, e.response?.requestOptions);

  handler.next(e);
}

handleTimeOut(DioException e) {
  toast('Connection timeout');
}

handleErrorStatus(response, RequestOptions? requestOptions) async {
  switch (response.statusCode) {
    case 500:
      break;
    case 408:
      break;
    case 400:
      break;
    case 403:
      break;
    case 401:
      break;
    default:
      ErrorResponse.fromJson(response.data);
      break;
  }
  return;
}
