class Session{
  static int userId = 0;
  static String username = "";

  int getUserId() {
    return userId;
  }

  String getUsername() {
    return username;
  }

  setUserId(int val) {
    userId = val;
  }

  setUsername(String val) {
    username = val;
  }

}