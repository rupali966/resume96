class studyprogram {
  String studyprograms;
  String cgpa;
  String placeofeducation;
  String project;

  studyprogram(
      this.studyprograms, this.cgpa, this.placeofeducation, this.project);
}

class studyprogramlist {
  List studyprograms = [];
  List cgpa = [];
  List placeofeducation = [];
  List project = [];

  void setstudyprogram(int num, studyprogram study) {
    studyprograms.insert(num, study.studyprograms);
    cgpa.insert(num, study.cgpa);
    placeofeducation.insert(num, placeofeducation);
    project.insert(num, project);
  }
}

class workprogram {
  String title;
  String workplace;
  String companeydiscription;
  String refrence_person;
  String companey_contact_number;

  workprogram(this.title, this.workplace, this.companeydiscription,
      this.refrence_person, this.companey_contact_number);
}

class workprogramlist {
  List title = [];
  List workplace = [];
  List companeydiscription = [];
  List refrence_person = [];
  List companey_contact_number = [];

  void setworkprogram(int num, workprogram work) {
    title.insert(num, work.title);
    workplace.insert(num, work.workplace);
    companeydiscription.insert(num, work.companeydiscription);
    refrence_person.insert(num, work.refrence_person);
    companey_contact_number.insert(num, work.companey_contact_number);
  }
}
