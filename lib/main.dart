import 'package:app/app.dart';
import 'package:app/bloc/root/root_cubit.dart';
import 'package:app/config/app_theme.dart';
import 'package:app/config/config.dart';
import 'package:app/root.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  var config = Config();
  await config.init();
  App.I.config = config;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RootCubit>(
          create: (context) => RootCubit()..load(),
        ),
      ],
      child: MaterialApp(
        title: 'Pejuang Alpha',
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        color: Color(0xffdb5412),
        home: const Root(),
      ),
    );
  }
}
