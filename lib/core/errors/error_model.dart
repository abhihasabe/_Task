class ErrorModel {
  String? message;
  String? path;
  String? status;
  int? timestamp;

  ErrorModel({this.message, this.path, this.status, this.timestamp});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    path = json['path'];
    status = json['status'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['path'] = path;
    data['status'] = status;
    data['timestamp'] = timestamp;
    return data;
  }
}
