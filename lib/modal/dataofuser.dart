
import 'dart:io';

class User {
  String name = "";
  String adress = "";
  String email = "";
  String phno = "";
  String skill = "";
  String skill2 = "";
  String aboutyourself = "";
  String cource = "";
  String school = "";
  String persentage = "";
  String yearofpassing = "";
  File? photo ;

  void setUser({
    String name = "",
    String adress = "",
    String email = "",
    String phno = "",
    String skill = "",
    String skill2 = "",
    String aboutyourself = "",
    String cource = "",
    String school = "",
    String persentage = "",
    String yearofpassing = "",
    File? photo,
  }) {
    this.name = name;
    this.adress = adress;
    this.email = email;
    this.phno = phno;
    this.skill = skill;
    this.skill2 = skill2;
    this.aboutyourself = aboutyourself;
    this.cource = cource;
    this.school = school;
    this.persentage = persentage;
    this.yearofpassing = yearofpassing;
    this.photo = photo;
  }

  User getdata() {
    return this;
  }
}

class date{
  String? today;
  void setToday(String day){
    today = day;
  }
  String? getToday(){
    return today;
  }
}