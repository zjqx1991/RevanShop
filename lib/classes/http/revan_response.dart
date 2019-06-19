class RevanResponse {
  final int code;
  final String message;
  final Map data;

  RevanResponse(
      this.code,
      this.message,
      this.data,
      );

  RevanResponse.fromJson(Map response)
  :
        code = response['state'],
        message = response['message'],
        data    = response['data']
  ;
}