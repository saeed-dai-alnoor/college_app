import 'package:college_app/app/core/lang/ar.dart';
import 'package:college_app/app/core/lang/en.dart';
import 'package:get/route_manager.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': ar,
        'en': en,
      };
}
