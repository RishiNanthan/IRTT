import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'studentmodel.dart';
import 'staffmodel.dart';
import 'adminmodel.dart';


class Authorisation{

  var _user;
  final _auth = FirebaseAuth.instance;
  final _db = Firestore.instance;
  Authorisation(){
    try{_auth.signOut();}
    catch(e){print(e);}
    }

  Future<dynamic> getStudent(String rollno) async {
    try{
      DocumentSnapshot student = await _db.collection('Students').document('17cse35').get();
      return student;
    }
    catch(e){
      print(e);
      return null;
    }
  }

  // Student sign in
  Future studentSignin(String rollno, String password) async{
    try{
      await _auth.signOut();
      rollno = rollno.toLowerCase();
      var student = await getStudent(rollno);
      if(student != null && student.data['password'] == password){
        var res = await _auth.signInAnonymously();
        var user = res.user;
        _user =  Student(uid: user.uid, rollno: rollno, name: student.data['name'], attendance: student.data['attendance'],
        fee:student.data['fee']);
        return _user;        
      }
    }
    catch(e){
      print(e.toString());
    }
    return null;
  }

  Future staffSignin(String staffid, String password) async{
    try{
      staffid = staffid.toLowerCase();
      var res = await _auth.signInAnonymously();
      var user = res.user;
      _user =  Staff(uid: user.uid, staffid: staffid);
      print(_user);
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future administratorSignin(String staffid, String password) async{
    try{
      staffid = staffid.toLowerCase();
      var res = await _auth.signInAnonymously();
      var user = res.user;
      _user =  Administrator(uid: user.uid);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

}


