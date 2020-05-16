

class Student{
  final String usertype = 'student';
  final String uid;
  final String rollno;
  final String name;
  final attendance;
  final fee;

  Student({this.uid, this.rollno, this.name, this.attendance, this.fee});

  String department(){
    return rollno[2]+rollno[3]+rollno[4];
  }

  String year(){
    return rollno[0]+rollno[1];
  }

}
