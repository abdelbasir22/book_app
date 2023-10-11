import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/repos/home_reop_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setup() {
  getit.registerSingleton<ApiService>(ApiService(Dio()));

  getit.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(getit.get<ApiService>()),
  );
}
