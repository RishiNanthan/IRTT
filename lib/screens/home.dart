import 'package:flutter/material.dart';
import 'package:irtt/screens/login.dart';


class HomeScreen extends StatefulWidget {
  
  final String title;
  HomeScreen({this.title});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var selectedbtn;
  @override
  Widget build(BuildContext context) {

    const dropdownstyle = TextStyle(
      color: Colors.blueAccent,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );

    const whitetext = TextStyle(color: Colors.white);

    if(selectedbtn == "Login"){
      return StudentLogin();
    }
    else if(selectedbtn == "Staff"){
      return StaffLogin();
    }
    else if(selectedbtn == "Administrator"){
      return Administrator();
    }
    else{
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Text("IRTT"),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical:5),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  style: TextStyle(color: Colors.blueAccent),
                  hint: null,
                  icon: Icon(Icons.more_vert, color: Colors.white,),
                  items: <DropdownMenuItem>[
                    DropdownMenuItem(child:Text('Login', style: dropdownstyle,), value: 'Login',),
                    DropdownMenuItem(child: Text('Staff', style: dropdownstyle,), value: 'Staff',),
                    DropdownMenuItem(child: Text('Administrator', style: dropdownstyle,), value: 'Administrator',),
                  ],
                  onChanged: (val){
                    if(val == "Login"){
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return StudentLogin();
                      }));
                    }
                    else if(val == "Staff"){
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return StaffLogin();
                      }));
                    }
                    else if(val == "Administrator"){
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return Administrator();
                      }));
                    }
                  },
                ),
              ),
            ),

            SizedBox(width: 20,),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: (){},
            )
          ],
        ),
        
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal:20),
          children: <Widget>[
            Center(
              child: Image.asset('assets/irttlogo.jpg'),
            ),
            SizedBox(height: 20,),
            Text("Institute of Road and Transport Technology - Erode", 
              style: TextStyle(color: Colors.blue[800], fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40,),
            FlatButton(
              onPressed: (){},
              color: Colors.blueAccent[200],
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text("Computer Science and Engineering", style: whitetext),
                leading: Image.asset('assets/irttlogo.jpg', height: 50,),
                //trailing: Text("Department", style: whitetext,),
              ),
            ),
            
            SizedBox(height: 15,),

            FlatButton(
              onPressed: (){},
              color: Colors.blueAccent[200],
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text("Electronics and Communication Engineering", style: whitetext,),
                leading: Image.asset('assets/irttlogo.jpg', height: 50,),
                //trailing: Text("", style: whitetext,),
              ),
            ),

            SizedBox(height: 15,),

            FlatButton(
              onPressed: (){},
              color: Colors.blueAccent[200],
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text("Electrical and Electronics Engineering", style: whitetext,),
                leading: Image.asset('assets/irttlogo.jpg', height: 50,),
              ),
            ),

            SizedBox(height: 15,),

            FlatButton(
              onPressed: (){},
              color: Colors.blueAccent[200],
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text("Information Technology", style: whitetext,),
                leading: Image.asset('assets/irttlogo.jpg', height: 50,),
                //trailing: Text("Department", style: whitetext,),
              ),
            ),

            SizedBox(height: 15,),

            FlatButton(
              onPressed: (){},
              color: Colors.blueAccent[200],
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text("Mechanical Engineering", style: whitetext,),
                leading: Image.asset('assets/irttlogo.jpg', height: 50,),
                //trailing: Text("Department", style: whitetext,),
              ),
            ),

            SizedBox(height: 15,),

            FlatButton(
              onPressed: (){},
              color: Colors.blueAccent[200],
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text("Automobile Engineering", style: whitetext,),
                leading: Image.asset('assets/irttlogo.jpg', height: 50,),
              ),
            ),

            SizedBox(height: 15,),

            FlatButton(
              onPressed: (){},
              color: Colors.blueAccent[200],
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text("Civil Engineering", style: whitetext,),
                leading: Image.asset('assets/irttlogo.jpg', height: 50,),
              ),
            ),

            SizedBox(height: 55,),

          ],
        ),


        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.blue[800]),
          height: 50,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal:20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon:Icon(Icons.home),
                      color: Colors.white,
                      onPressed: (){},
                    ),

                    IconButton(
                      icon:Icon(Icons.notifications),
                      color: Colors.white,
                      onPressed: (){},
                    ),

                    IconButton(
                      icon:Icon(Icons.event_note),
                      color: Colors.white,
                      onPressed: (){},
                    ),

                    IconButton(
                      icon:Icon(Icons.settings),
                      color: Colors.white,
                      onPressed: (){},
                    ),

                  ],
            ),
          ),
        )
      );
    }
  }
}