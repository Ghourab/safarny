import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';
import 'provider_auth.dart';

// Future userData = Auth().getUser();

//  var userDataProviderRepository = StateProvider<Future>((ref) => userData);

//  var userDataProvider = FutureProvider(
//   (ref) async {
//     return ref.watch(userDataProviderRepository);
//   },
// );

// Future userPrivateData = Auth().viewData();
// final userPrivateDataProviderRepository = StateProvider<Future>((ref) => userPrivateData);

// final userPrivateDataProvider = FutureProvider(
//   (ref) async {
//     return ref.watch(userPrivateDataProviderRepository);
//   },
// );
final themeProvider = StateNotifierProvider<ThemesState, AsyncValue<String>>(
    (ref) => ThemesState());

final newUserDataProivder = StateProvider<Users?>((ref) {
  return null;
});
