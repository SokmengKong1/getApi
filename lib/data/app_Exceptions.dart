class AppException implements Exception{
  final _message;
  final _prefix;
  AppException([this._prefix,this._message]);


  String toString(){
    return '$_prefix $_message';
  }
}

class FetchDataExceptions extends AppException{
  FetchDataExceptions([String? message]) :super(message," Error During Communication");
}
class BadDataExceptions extends AppException{
  BadDataExceptions([String? message]) :super(message," Invalid request");
}
class UnauthorisedExceptions extends AppException{
  UnauthorisedExceptions([String? message]) :super(message," Unauthorised request");
}
class InvalidExceptions extends AppException{
  InvalidExceptions([String? message]) :super(message," Invalid request");
}
