class Logindata {
  Logindata({
    this.usr = "",
    this.pass = "",
  });

  String pass;
  String usr;

  void setData({
    String user = "",
    String pass = "",
  }) {
    usr = user;
    this.pass = pass;
  }

  dynamic getdata() {
    return this;
  }
}


