class ResponseModel {
  final bool isSuccess;
  final int statusCode;
  final dynamic body;

  ResponseModel({
    required this.isSuccess,
    required this.statusCode,
    this.body,
  });
}
