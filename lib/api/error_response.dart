/// status : "error"
/// code : "apiKeyMissing"
/// message : "Your API key is missing. Append this to the URL with the apiKey param, or use the x-api-key HTTP header."
library;

class ErrorResponse {
  ErrorResponse({this.message});

  ErrorResponse.fromJson(dynamic json) {
    message = json['status_message'];
  }
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_message'] = message;
    return map;
  }
}
