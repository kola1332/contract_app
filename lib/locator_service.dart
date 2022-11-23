import 'package:contract_app/features/card/data/datasources/basket_local_data_source.dart';
import 'package:contract_app/features/card/data/datasources/basket_remote_data_source.dart';
import 'package:contract_app/features/detail/data/datasources/detail_local_data_source.dart';
import 'package:contract_app/features/detail/data/datasources/detail_remote_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:contract_app/core/platform/network_info.dart';
import 'package:contract_app/features/home/data/datasources/phone_local_data_source.dart';
import 'package:contract_app/features/home/data/datasources/phone_remote_data_source.dart';
import 'package:contract_app/features/home/data/repositories/phone_repository_impl.dart';
import 'package:contract_app/features/home/presentation/bloc/phone_list_cubit.dart';
import 'package:contract_app/features/home/domain/usecases/get_phonesHome.dart';
import 'package:contract_app/features/home/domain/repositories/phone_repository.dart';
import 'package:contract_app/features/detail/domain/usecases/get_phones_detail.dart';
import 'package:contract_app/features/detail/data/repositories/detail_repository_impl.dart';
import 'package:contract_app/features/detail/domain/repositories/detail_repository.dart';
import 'package:contract_app/features/detail/presentation/bloc/detail_list_cubit.dart';
import 'package:contract_app/features/card/data/repositories/basket_repository_impl.dart';
import 'package:contract_app/features/card/domain/repositories/basket_repository.dart';
import 'package:contract_app/features/card/presentation/bloc/basket_list_cubit.dart';
import 'package:contract_app/features/card/domain/usecases/get_basket.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //BLOC / Cubit
  sl.registerFactory(
    () => PhoneListCubit(
      getPhonesHomeStore: sl(),
      getPhonesBestSeller: sl(),
    ),
  );
  sl.registerFactory(
    () => DetailListCubit(
      getPhonesDetail: sl(),
    ),
  );
  sl.registerFactory(
    () => BasketListCubit(
      getBasketItems: sl(),
      getBasket: sl(),
    ),
  );

  //UseCases
  sl.registerLazySingleton(() => GetPhonesHomeStore(sl()));
  sl.registerLazySingleton(() => GetPhonesBestSeller(sl()));
  sl.registerLazySingleton(() => GetPhonesDetail(sl()));
  sl.registerLazySingleton(() => GetBasketItems(sl()));
  sl.registerLazySingleton(() => GetBasket(sl()));

  //Repository
  sl.registerLazySingleton<PhoneRepository>(() => PhoneRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));
  sl.registerLazySingleton<DetailRepository>(() => DetailRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));
  sl.registerLazySingleton<BasketRepository>(() => BasketRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<PhoneRemoteDataSource>(
      () => PhoneRemoteDataSourceImpl(client: http.Client()));

  sl.registerLazySingleton<PhonesLocalDataSource>(
      () => PhonesLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<DetailRemoteDataSource>(
      () => DetailRemoteDataSourceImpl(client: http.Client()));

  sl.registerLazySingleton<DetailLocalDataSource>(
      () => DetailLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<BasketRemoteDataSource>(
      () => BasketRemoteDataSourceImpl(client: http.Client()));

  sl.registerLazySingleton<BasketLocalDataSource>(
      () => BasketLocalDataSourceImpl(sharedPreferences: sl()));

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
