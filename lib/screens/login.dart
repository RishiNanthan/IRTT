import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'package:irtt/auth.dart';


class StudentLogin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => StudentLoginState();
}

class StudentLoginState extends State<StudentLogin>{
  final Authorisation _auth = Authorisation();
  final _formKey = GlobalKey<FormState>();
  
  bool login = false;
  String rollno = '';
  String password = '';

  bool isdigit(String c){
    print(c);
    if(c == '0' || c == '1' || c == '2' || c == '3' || c == '4' || c == '5' || c == '6' || c == '7' || c == '8'
     || c == '9'){
       print("true");
       return true;
     }
    print("false");
    return false;
  }

  bool isdept(String dept){
    print(dept);
    switch(dept.toLowerCase()){
      case 'ece': return true;
      case 'cse': return true;
      case 'eee': return true;
      case 'mec': return true;
      case 'ate': return true;
      case 'ift': return true;
      case 'cve': return true;
      default: print("false"); 
      return false;
    }
  }

  bool validateRollno(String roll){
    if(roll.length == 7){
      var dept = roll[2] + roll[3] + roll[4];
      if(isdigit(roll[0]) && isdigit(roll[1]) && isdigit(roll[6]) && isdigit(roll[5]) && isdept(dept)){
        print(roll);
        print("true");
        return true;
      }
    }
    print("false");
    return false;
  }
  
  Widget build(BuildContext context){

    return login ? Dashboard(): Scaffold(
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
                        return val.length > 8? null: "Password min 8 chars long";
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
                          dynamic future = _auth.student_signin();
                          future.then((user){
                            if(user == null){
                              print("Error Signing In");
                            }
                            else{
                              print(user.uid);
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
                        return val.length > 8? null: "Password min 8 chars long";
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
                          dynamic future = _auth.staff_signin();
                          future.then((user){
                            if(user == null){
                              print("Error Signing In");
                            }
                            else{
                              print(user.uid);
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
                        return val.length > 8? null: "Password min 8 chars long";
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
                          dynamic future = _auth.administrator_signin();
                          future.then((user){
                            if(user == null){
                              print("Error Signing In");
                            }
                            else{
                              print(user.uid);
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


