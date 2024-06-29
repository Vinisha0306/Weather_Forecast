class LoginUserModal {
  late String userName;
  late String userContact;

  String get getUserName => userName;
  String get getUserContact => userContact;

  LoginUserModal({required String name, required String password}) {
    userName = name;
    userContact = password;
  }
}
