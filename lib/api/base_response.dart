class BaseResponse {
  BaseResponse({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  dynamic status;
  String? message;
  String? error;
  dynamic data;

  BaseResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
    error = json['error'];
    //!= null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
