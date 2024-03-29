import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/core/lang/languages.dart';
import 'package:college_app/app/modules/network/bindings/network_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';

void main() async {
  // ErrorWidget.builder = (FlutterErrorDetaildetails) => Material();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();
  final getStorage = GetStorage();
  runApp(
    GetMaterialApp(
      title: "College App",
      initialRoute: AppPages.INITIAL,
      initialBinding: NetworkBinding(),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: getStorage.read('lang') == 'ar' || getStorage.read('lang') == null
          ? const Locale('ar', 'SA')
          : const Locale('en', 'US'),
      fallbackLocale: const Locale('ar', 'SA'),
      theme: ThemeData(
        unselectedWidgetColor: Colors.white,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: CustomColors.primColor),
      ),
    ),
  );
}
