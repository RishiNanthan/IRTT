import 'package:flutter/material.dart';
import 'package:irtt/auth.dart';
import 'package:irtt/screens/dashboard.dart';
import 'package:irtt/screens/loading.dart';

class StudentLogin extends StatefulWidget{
  
  @override
  _StudentLoginState createState() => _StudentLoginState();
  
}

class _StudentLoginState extends State<StudentLogin>{
  
  final Authorisation _auth = Authorisation();
  final _formKey = GlobalKey<FormState>();
  
  bool loading = false;
  bool login = false;
  String rollno = '';
  String password = '';
  var user;

  bool isdigit(String c){
    if(c == '0' || c == '1' || c == '2' || c == '3' || c == '4' || c == '5' || c == '6' || c == '7' || c == '8'
     || c == '9'){
       return true;
     }
    return false;
  }

  bool isdept(String dept){
    switch(dept.toLowerCase()){
      case 'ece': return true;
      case 'cse': return true;
      case 'eee': return true;
      case 'mec': return true;
      case 'ate': return true;
      case 'ift': return true;
      case 'cve': return true;
      default: return false;
    }
  }

  bool validateRollno(String roll){
    if(roll.length == 7){
      var dept = roll[2] + roll[3] + roll[4];
      if(isdigit(roll[0]) && isdigit(roll[1]) && isdigit(roll[6]) && isdigit(roll[5]) && isdept(dept)){
        return true;
      }
    }
    return false;
  }
  
  Widget build(BuildContext context){

    if(login && user != null){
      return StudentDashboard(student: user,);
    }
    else if(loading){
      return LoadingScreen();
    }
    else{
      return Scaffold(
          appBar: AppBar(
            title: Text('Student Login'),
            backgroundColor: Colors.blue[800],
            ),
          body: ListView(
            children: <Widget>[
              Image.asset("assets/irttlogo.jpg", width: 100, height: 200,),
              
              Container(
                padding: EdgeInsets.symmetric(horizontal:20, vertical:20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) => rollno = val,
                        validator: (val){
                          return validateRollno(val)? null: "Enter valid Roll number Eg 17cse35";
                        },
                        maxLength: 7,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Roll Number",
                          enabledBorder: OutlineInputBorder(
                            borderSide:BorderSide(color: Colors.blue[800], width:2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent, width:2),
                          ),
                        ),
                      ),

                      TextFormField(
                        maxLength: 16,
                        onChanged: (val)=> password = val,
                        validator: (val){
                          return val.length >= 8? null: "Password min 8 chars long";
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Password",
                          enabledBorder: OutlineInputBorder(
                            borderSide:BorderSide(color: Colors.blue[800], width:2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent, width:2),
                          ),
                        ),
                      ),

                      SizedBox(height: 20,),
                      
                      RaisedButton(
                        child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        color: Colors.blueAccent,
                        onPressed: () async{
                          if(_formKey.currentState.validate()){
                            setState(() {
                              loading = true;
                            });
                            dynamic future = _auth.studentSignin(rollno, password);
                            future.then((usr){
                              if(usr == null){
                                setState(() {
                                  loading = false;
                                  AlertDialog(
                                    content: Text("Given credentials are invalid"),
                                    title: Text("Either the rollno or password or both are wrong"),);
                                });
                              }
                              else{
                                AlertDialog(content:Text("Logging in"));
                                setState(() {
                                  user = usr;
                                  login = true;
                                  loading = false;
                                  });
                                }
                              }
                            );
                          }
                        }
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
      );
    }
  }
}

class StaffLogin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => StaffLoginState();
}

class StaffLoginState extends State<StaffLogin>{
  
  final _formKey = GlobalKey<FormState>();
  final _auth = Authorisation();
  var staffid = '';
  var password = '';
  bool login = false;

  Widget build(BuildContext context){
    if(login){
      Navigator.pop(context);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Staff - IRTT'),
          backgroundColor: Colors.blue[800],
          ),
        body: ListView(
          children: <Widget>[
            Image.asset("assets/irttlogo.jpg", width: 100, height: 200,),
            
            Container(
              padding: EdgeInsets.symmetric(horizontal:20, vertical:20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (val) => staffid = val,
                      validator: (val){
                        return val.isNotEmpty? null: "Enter valid Staff ID";
                      },
                      maxLength: 7,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Staff ID",
                        enabledBorder: OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.blue[800], width:2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width:2),
                        ),
                      ),
                    ),

                    TextFormField(
                      maxLength: 16,
                      onChanged: (val)=> password = val,
                      validator: (val){
                        return val.length >= 8? null: "Password min 8 chars long";
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.blue[800], width:2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width:2),
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),
                    
                    RaisedButton(
                      child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      color: Colors.blueAccent,
                      onPressed: () async{
                        if(_formKey.currentState.validate()){
                          dynamic future = _auth.staffSignin(staffid, password);
                          future.then((user){
                            if(user == null){
                              print("Error Signing In");
                            }
                            else{
                              setState(() {
                                login = true;
                                });
                              }
                            }
                          );
                        }
                      }
                    )
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}


class Administrator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AdministratorState();
}

class AdministratorState extends State<Administrator>{
  final _auth = Authorisation();
  final _formKey = GlobalKey<FormState>();
  var adminid = '';
  var password = '';
  bool login = false;


  Widget build(BuildContext context){
    if(login){
      Navigator.pop(context);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Administrator - IRTT'),
          backgroundColor: Colors.blue[800],
          ),
        body: ListView(
          children: <Widget>[
            Image.asset("assets/irttlogo.jpg", width: 100, height: 200,),
            
            Container(
              padding: EdgeInsets.symmetric(horizontal:20, vertical:20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (val) => adminid = val,
                      validator: (val){
                        return val.isNotEmpty? null: "Enter valid Staff ID";
                      },
                      maxLength: 7,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Staff ID",
                        enabledBorder: OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.blue[800], width:2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width:2),
                        ),
                      ),
                    ),

                    TextFormField(
                      maxLength: 16,
                      onChanged: (val)=> password = val,
                      validator: (val){
                        return val.length >= 8? null: "Password min 8 chars long";
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.blue[800], width:2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width:2),
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),
                    
                    RaisedButton(
                      child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      color: Colors.blueAccent,
                      onPressed: () async{
                        if(_formKey.currentState.validate()){
                          dynamic future = _auth.administratorSignin(adminid, password);
                          future.then((user){
                            if(user == null){
                              print("Error Signing In");
                            }
                            else{
                              setState(() {
                                login = true;
                                });
                              }
                            }
                          );
                        }
                      }
                    )
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}


