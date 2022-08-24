import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sampah_officer/data/cubit/cubit.dart';
import 'package:sampah_officer/data/cubit/input_sampah_cubit.dart';
import 'package:sampah_officer/ui/pages/pages.dart';
import 'package:sampah_officer/ui/widgets/widgets.dart';

import 'data/models/models.dart';
import 'data/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final String? userToken = await getUserToken();

  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());

  runApp(MyApp(
    token: userToken,
  ));
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({Key? key, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InputSampahCubit(),
        ),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(
          create: (context) => TransaksiCubit(),
        ),
        BlocProvider(
          create: (context) => JenisSampahCubit(),
        ),
        BlocProvider(
          create: (context) => NasabahCubit(),
        )
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: LoadingOverlay(),
        child: GetMaterialApp(
          title: 'Petugas Sampah',
          theme: ThemeData(primarySwatch: Colors.lightGreen),
          home: token == null ? LoginPage() : MainPage(),
        ),
      ),
    );
  }
}
