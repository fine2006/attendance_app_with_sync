class Subject {
  final String subjectName;
  final int presentClasses;
  final int absentClasses;

  Subject(this.subjectName, this.presentClasses, this.absentClasses);

  Map<String, dynamic> toMap() {
    return {
      'subject': subjectName,
      'present': presentClasses,
      'absent': absentClasses,
    };
  }
}
