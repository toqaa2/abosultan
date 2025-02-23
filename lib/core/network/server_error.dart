
abstract class Failures {
  final String errMessage;

  Failures(this.errMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your Requset is not found, please try again later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error please try agai later');
    } else {
      return ServerFailure('Opps there was an error, please try again');
    }
  }
}
