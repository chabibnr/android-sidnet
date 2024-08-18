import 'package:app/app.dart';
import 'package:app/bloc/root/root_cubit.dart';
import 'package:app/config/app_theme.dart';
import 'package:app/config/color_config.dart';
import 'package:app/config/config.dart';
import 'package:app/modules/absensi/bloc/absensi_load/absensi_load_cubit.dart';
import 'package:app/modules/absensi/bloc/absensi_widget/absensi_widget_cubit.dart';
import 'package:app/modules/account/bloc/account_cubit.dart';
import 'package:app/modules/cuti/bloc/cuti_load/cuti_load_cubit.dart';
import 'package:app/modules/gaji/bloc/gaji_load/gaji_load_cubit.dart';
import 'package:app/modules/main/bloc/main_cubit.dart';
import 'package:app/modules/pinjaman/bloc/pinjaman_load/pinjaman_load_cubit.dart';
import 'package:app/modules/spl/bloc/spl_load/spl_load_cubit.dart';
import 'package:app/root.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:month_year_picker/month_year_picker.dart';

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
        BlocProvider<SplLoadCubit>(
          create: (context) => SplLoadCubit(),
        ),
        BlocProvider<MainCubit>(
          create: (context) => MainCubit(),
        ),
        BlocProvider<AccountCubit>(
          create: (context) => AccountCubit(),
        ),
        BlocProvider<CutiLoadCubit>(
          create: (context) => CutiLoadCubit(),
        ),
        BlocProvider<AbsensiLoadCubit>(
          create: (context) => AbsensiLoadCubit(),
        ),
        BlocProvider<AbsensiWidgetCubit>(
          create: (context) => AbsensiWidgetCubit(),
        ),
        BlocProvider<GajiLoadCubit>(
          create: (context) => GajiLoadCubit(),
        ),
        BlocProvider<PinjamanLoadCubit>(
          create: (context) => PinjamanLoadCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'HRD SIDNET',
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        color: ColorConfig.primary,
        localizationsDelegates: const [
          MonthYearPickerLocalizations.delegate,
        ],
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: Container(
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [ColorSchema.titleTextColor, Colors.white],
              // ),
              // borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              color: Color(0xffF0F2F5),
            ),
            child: child!,
          ),
        ),
        home: const Root(),
      ),
    );
  }
}
