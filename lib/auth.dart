import 'package:firebase_auth/firebase_auth.dart';


class Authorisation{

  final _auth = FirebaseAuth.instance;
  // Student sign in
  Future student_signin() async{
    try{
      var res = await _auth.signInAnonymously();
      var user = res.user;
      return Student(uid: user.uid);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future staff_signin() async{
    try{
      var res = await _auth.signInAnonymously();
      var user = res.user;
      return Staff(uid: user.uid);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future administrator_signin() async{
    try{
      var res = await _auth.signInAnonymously();
      var user = res.user;
      return Administrator(uid: user.uid);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future logout() async{
    try{
      _auth.signOut();
      return true;
    }
    catch(e){
      print(e);
      return false;
    }
  }

}


class Student{
  final String uid;
  final String rollno = '';
  Student({this.uid});
}

class Staff{
  final String uid;
  final String staffid = '';
  Staff({this.uid});
}

class Administrator{
  final String uid;
  final String staffid = '';
  Administrator({this.uid});
}