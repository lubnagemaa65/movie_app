import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendation.dart';
import 'package:movie_app/movies/presentation/screens/movies_screen.dart';

final GetIt sl = GetIt.instance;

void setup() {
  // Check if GetRecommendationUseCase is already registered
  if (!sl.isRegistered<GetRecommendationUseCase>()) {
    sl.registerFactory(() => GetRecommendationUseCase(
          sl(),
        ));
  }
}

void main() {
  setup(); // Ensure this is called before runApp

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const MainMoviesScreen(),
    );
  }
}
