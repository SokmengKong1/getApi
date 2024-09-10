import 'package:flutter/material.dart';
import 'package:get_api/view_model/home_view_model.dart';
import 'package:get_api/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import '../data/response/status.dart';
import '../utils/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  @override
  void initState() {
    homeViewViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPrefernece = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          InkWell(
              onTap: () {
                userPrefernece.remove().then((value) {
                  Navigator.pushNamed(context, RouteName.login);
                });
              },
              child: Text("Logout")),
          SizedBox(
            width: 20,
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
            builder: (context, value, _) {
              switch(value.moviesList.status){
                case null:
                  // TODO: Handle this case.
                case Status.LOADING:
                  return CircularProgressIndicator();
                case Status.COMPLETED:
                  // return ListView.builder(
                  //   itemCount: value.moviesList.data?.movies?.length,
                  //   // itemCount: value.moviesList?.data?.movies?.length ?? 0,
                  //   itemBuilder: (context,index){
                  //     return Card(
                  //       child: ListTile(
                  //          title: Text(value.moviesList.data!.movies![index].name.toString()),
                  //
                  //       ),
                  //     );
                  //   },
                  // );
                  return ListView.builder(
                    itemCount: value.moviesList?.data?.data?.length,
                    itemBuilder: (context, index) {
                      // Safely access the movie object and its properties
                      final movie = value.moviesList?.data?.data?[index];
                      // Check if movie is not null before accessing its properties
                      if (movie != null) {
                        return Card(
                          child: ListTile(
                            leading: Text(movie.status.toString()),
                            title: Text(movie.name.toString()),
                            subtitle: Text(movie.address.toString()),
                            
                          ),
                          // Safely use the movie's name
                        );
                      } else {
                        return Card(
                          child: Text("Unknown Movie"),
                          // Fallback text if movie is null
                        );
                      }
                    },
                  );

                case Status.ERROR:
                  return Text(value.moviesList.message.toString());

              }
          return Container();
        }),
      ),
    );
  }
}
