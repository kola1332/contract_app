import 'package:contract_app/core/platform/network_info.dart';
import 'package:contract_app/feature/data/datasources/phone_local_data_source.dart';
import 'package:contract_app/feature/domain/usecases/get_basket.dart';
import 'package:contract_app/feature/domain/usecases/get_phones_detail.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:contract_app/feature/data/datasources/phone_remote_data_source.dart';
import 'package:contract_app/feature/data/models/phone_model.dart';
import 'package:contract_app/feature/data/repositories/phone_repository_impl.dart';
import 'package:contract_app/feature/domain/repositories/phone_repository.dart';
import 'package:contract_app/feature/domain/usecases/get_phonesBestSeller.dart';
import 'package:contract_app/feature/domain/usecases/get_phonesHomeStore.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit/phone_list_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feature/presentation/bloc/phone_bloc/phone_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //BLOC / Cubit
  sl.registerFactory(
    () => PhoneListCubit(
      getPhonesHomeStore: sl(),
      getPhonesBestSeller: sl(),
      getPhonesDetail: sl(),
      getBasketItems: sl(),
      getBasket: sl(),
    ),
  );
  sl.registerFactory(
    () => PhoneBloc(getPhonesHomeStore: sl()),
  );

  //Freezed
  sl.registerFactory(() => PhoneHomeStoreModel(
      id: sl(), title: sl(), picture: sl(), subtitle: sl(), is_buy: sl()));

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

  sl.registerLazySingleton<PhoneRemoteDataSource>(
      () => PhoneRemoteDataSourceImpl(client: http.Client()));

  sl.registerLazySingleton<PhonesLocalDataSource>(
      () => PhonesLocalDataSourceImpl(sharedPreferences: sl()));

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
