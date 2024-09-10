import 'package:flutter/cupertino.dart';
import 'package:get_api/data/response/api_response.dart';
import 'package:get_api/model/movie_model.dart';
import 'package:get_api/respnsitory/home_repository.dart';

class HomeViewViewModel with ChangeNotifier{
final _myRepo = HomeRepository();
ApiResponse<MovieListModel> moviesList = ApiResponse.loading();
setMovieList(ApiResponse<MovieListModel>response){
  moviesList=response;
  notifyListeners();
}
Future<void> fetchMoviesListApi ()async{
  setMovieList(ApiResponse.loading());
  _myRepo.fetchMoviesList().then((value){
    setMovieList(ApiResponse.completed(value));
  }).onError((error,StackTrace){
    setMovieList(ApiResponse.error(error.toString()));
  });
}
}