import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isdark = false.obs;

  void ChangeTheme() {
    isdark(!isdark.value);
    print('${isdark}');
  }
}
