import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast/Modal/loginuser.dart';

class LoginUserController extends GetxController {
  late SharedPreferences preferences;
  late LoginUserModal userNameModal;
  bool isLogin = false;

  LoginUserController() {
    init();
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
    userNameModal = LoginUserModal(
        name: preferences.getString("userName") ?? 'Demo Name',
        password: preferences.getString("userContact") ?? 'Demo Contact');
    isLogin = preferences.getBool("isLogin") ?? false;
  }

  Future<void> userNameF({required username, required userContact}) async {
    preferences = await SharedPreferences.getInstance();
    userNameModal.userName = username ?? "Demo Name";
    preferences.setString("userName", userNameModal.userName);
    userNameModal.userContact = userContact ?? "Demo Contact";
    preferences.setString("userContact", userNameModal.userContact);
    isLogin = !isLogin;
    preferences.setBool("isLogin", isLogin);
    update();
  }
}
