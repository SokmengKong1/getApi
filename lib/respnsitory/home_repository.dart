import 'package:get_api/model/movie_model.dart';
import '../data/network/BaseApiService.dart';
import '../data/network/NetworkApiService.dart';
import '../res/components/app_url.dart';

class HomeRepository {
  final BaseService _apiService = NetworkApiService();

  Future<MovieListModel> fetchMoviesList() async {
    try {
      // Fetch response from the API service
      dynamic response = await _apiService.getGetApiResponse(AppUrl.moviesListEndPoint);

      // Convert response to MovieListModel and return
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      // Optionally log or handle errors in a more user-friendly way
      print('Error fetching movie list: $e');
      rethrow; // Propagates the error while keeping the stack trace intact
    }
  }
}
