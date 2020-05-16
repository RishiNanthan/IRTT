
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:irtt/screens/loading.dart';
import 'package:irtt/studentmodel.dart';

class StudentDashboard extends StatefulWidget {
  final Student student;

  StudentDashboard({this.student});

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  
  void showFee(){
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        color: Colors.blueAccent[100],
        padding: EdgeInsets.symmetric(vertical:60, horizontal:20),
        child: Text("Your Balance Fee : Rs " + widget.student.fee.toString(),
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    });
  }

  void showAttendance(){
    showModalBottomSheet(context: context, builder: (_){
      return Container(
        color: Colors.blueAccent[100],
        padding: EdgeInsets.symmetric(vertical:60, horizontal:20),
        child: Text(
          "Your Attendance Percentage : " + widget.student.attendance.toString() + "%",
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle val = TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 15);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Text("DashBoard - IRTT"),
          actions: <Widget>[
            
          ],
        ),
        
        body: GestureDetector(
          child: ListView(
            children: <Widget>[
              Image.asset('assets/irttlogo.jpg', height: 150,),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Welcome " + widget.student.name + " !",
                  style: TextStyle(fontSize: 20, color: Colors.blue[800], fontWeight: FontWeight.bold),
                  ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return Assignment(student:widget.student);
                            }));
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.assignment, color: Colors.blueAccent, size: 50,),
                              Text("Assignment", style: val,),
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return TimeTable(student:widget.student);
                            }));
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.calendar_today, color: Colors.blueAccent, size: 50,),
                              Text("Time Table", style: val,),
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: (){},
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.find_in_page, color: Colors.blueAccent, size: 50,),
                              Text("Exams", style: val,),
                            ],
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 40,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return Notification(student: widget.student,);
                            }));
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.notifications, color: Colors.blueAccent, size: 50,),
                              Text("Notifications", style: val,),
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: (){
                            showFee();
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.attach_money, color: Colors.blueAccent, size: 50,),
                              Text("Fees", style: val,),
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: (){
                            showAttendance();
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.library_books, color: Colors.blueAccent, size: 50,),
                              Text("Attendance", style: val,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return Profile(student: widget.student,);
                            }));

                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.person_outline, color: Colors.blueAccent, size: 50,),
                              Text("Profile", style: val,),
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return Chat(student: widget.student);
                            }));
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.textsms, color: Colors.blueAccent, size: 50,),
                              Text("Chat", style: val,),
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return Events(student:widget.student);
                            }));
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.event, color: Colors.blueAccent, size: 50,),
                              Text("Events", style: val,),
                            ],
                          ),
                        ),

                      ],
                    )

                  ],
                ),
              ),
              SizedBox(height: 50,),
            ],
            
          ),
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


class Notification extends StatelessWidget{

  final _db = Firestore.instance.collection('Notification');
  final Student student;
  Notification({this.student});

  Stream<QuerySnapshot> notification({Student user}){
    var notifications = _db
    .where("year", isEqualTo: student.year())
    .where('department', isEqualTo: student.department())
    .snapshots();
    return notifications;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Notification'), backgroundColor: Colors.blueAccent,),
      body: StreamBuilder(
        stream: notification(user:student),
        builder: (_, snapshot){
          if(snapshot.hasData){
            int count = snapshot.data.documents.length;
            return ListView.builder(
              itemCount: count,
              itemBuilder: (_, int index){
                var document = snapshot.data.documents[index];
                if(count > 0){
                  return Container(
                    padding: EdgeInsets.symmetric(vertical:10, horizontal:0),
                    child: Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent[100])),
                      child: ListTile(
                        title: Text("${document['staff'].toString().toUpperCase()} : ${document['message']}",
                          style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                  );
                }
                else{
                  return Center(child: Text("You Have no notifications now"),);
                }
              });
          }
          else{
            return Container(
              color: Colors.white,
              child: Center(child: SpinKitDualRing(color: Colors.blueAccent, size: 70,))
            );
          }
        },
      ),
    );
  }
}



class TimeTable extends StatelessWidget{
  final Student student;
  TimeTable({this.student});
  final _db = Firestore.instance.collection('TimeTable');

  void showTimeTable(var context, String day){
    var data = _db.where('year', isEqualTo: student.year())
      .where('department', isEqualTo: student.department().toLowerCase())
      .where('day', isEqualTo:day).snapshots();


    showModalBottomSheet(context:context, builder: (_){
      return StreamBuilder(stream: data, builder: (_, snapshot){
          if(snapshot.hasData){
            int count = snapshot.data.documents.length;
            if(count == 0){
              return Container(
                padding: EdgeInsets.symmetric(vertical:20, horizontal:20),
                color: Colors.blueAccent,
                child: Center(
                  child:Text(
                    "You have no classes on $day this week.",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    )
                ),
              );
            }
            return ListView.builder(
              itemCount: count,
              itemBuilder: (_, int index){
                var timetable = snapshot.data.documents[index];
                return Container(
                  padding: EdgeInsets.symmetric(vertical:10, horizontal:20),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical:5, horizontal:10),
                    color: Colors.blueAccent,
                    child: Text(
                      "${timetable['subject']} (${timetable['staff']}) At ${timetable['time']} For ${timetable['duration']} minutes",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }
            );
          }
          else{
            return LoadingScreen();
          }
        },);
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle days = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueAccent, title: Text("TimeTable - This Week"),),
      body: ListView(
        children: <Widget>[
          Image.asset('assets/irttlogo.jpg',height: 150,),
          Container(
            padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
            child: FlatButton(
              color: Colors.blueAccent,
              child: ListTile(title: Text("Monday", style: days,),),
              onPressed: (){
                showTimeTable(context, "monday");
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
            child: FlatButton(
              color: Colors.blueAccent,
              child: ListTile(title: Text("Tuesday", style: days,),),
              onPressed: (){
                showTimeTable(context, "tuesday");
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
            child: FlatButton(
              color: Colors.blueAccent,
              child: ListTile(title: Text("Wednesday", style: days,),),
              onPressed: (){
                showTimeTable(context, "wednesday");
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
            child: FlatButton(
              color: Colors.blueAccent,
              child: ListTile(title: Text("Thursday", style: days,),),
              onPressed: (){
                showTimeTable(context, "thursday");
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
            child: FlatButton(
              color: Colors.blueAccent,
              child: ListTile(title: Text("Friday", style: days,),),
              onPressed: (){
                showTimeTable(context, "friday");
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
            child: FlatButton(
              color: Colors.blueAccent,
              child: ListTile(title: Text("Saturday", style: days,),),
              onPressed: (){
                showTimeTable(context, "saturday");
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
            child: FlatButton(
              color: Colors.blueAccent,
              child: ListTile(title: Text("Sunday", style: days,),),
              onPressed: (){
                showTimeTable(context, "sunday");
              },
            ),
          ),

        ],
      ),
    );   
  }
}



class Assignment extends StatelessWidget{

  final _db = Firestore.instance.collection('Assignment');
  final Student student;
  Assignment({this.student});

  Stream<QuerySnapshot> notification({Student user}){
    var notifications = _db
    .where("year", isEqualTo: student.year())
    .where('department', isEqualTo: student.department())
    .snapshots();
    return notifications;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Assignments'), backgroundColor: Colors.blueAccent,),
      body: StreamBuilder(
        stream: notification(user:student),
        builder: (_, snapshot){
          if(snapshot.hasData){
            int count = snapshot.data.documents.length;
            return ListView.builder(
              itemCount: count,
              itemBuilder: (_, int index){
                var document = snapshot.data.documents[index];
                return Container(
                  padding: EdgeInsets.symmetric(vertical:10, horizontal:0),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent[100])),
                    child: Column(
                      children: <Widget>[
                        Text("${document['staff'].toString().toUpperCase()} : ${document['about']} (${document['subject']})",
                        style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 20),),
                        SizedBox(height: 5,),
                        Text('Due Date : ${document['due_date']}', style: TextStyle(color: Colors.red),),
                      ],
                      ),
                    ),
                );
              });
          }
          else{
            return Container(
              color: Colors.white,
              child: Center(child: SpinKitDualRing(color: Colors.blueAccent, size: 70,))
            );
          }
        },
      ),
    );
  }
}



class Exam extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Exam"));
  }
}



class Profile extends StatelessWidget{
  final Student student;
  Profile({this.student});

  @override
  Widget build(BuildContext context) {
    const TextStyle title = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black);
    const TextStyle value = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blueAccent);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile - " + student.name),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:10, horizontal:20),
        child: ListView(
          children: <Widget>[
            CircleAvatar(
              child: Icon(Icons.person_outline, size: 50,),
              radius: 50,
              foregroundColor: Colors.brown,
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(
                student.name, 
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Roll Number : ", style: title,),
                Text(student.rollno.toLowerCase(), style: value,)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Department  : ", style: title,),
                Text(student.department().toUpperCase(), style: value,)
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class Chat extends StatefulWidget {
  final Student student;
  Chat({this.student});

  @override
  _ChatState createState() => _ChatState();
}


class _ChatState extends State<Chat>{
  final _db = Firestore.instance.collection('Chat');
  String userMsg = '';
  final input = TextEditingController();


  Future<void> sendMessage(String message) async {
    _db.document(widget.student.uid.toString()).setData(
      {
        'name': widget.student.name,
        'year': widget.student.year(),
        'department': widget.student.department(),
        'rollno': widget.student.rollno,
        'message': message
      }
    );
  }

  void clearText(){
    input.clear();
  }

  Column getChats(documents){
    List<Widget> children = [];
    int count = documents.length;
    int i;
    for(i=0; i<count; i++){
      var message = documents[i];
      var color;
      message['rollno'] == widget.student.rollno ? color = Colors.blueAccent: color = Colors.blue[800];

      children.add(
        Row(
          mainAxisAlignment: message['rollno'] == widget.student.rollno? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Card(
              color: color,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
                child:Text("${message['rollno']==widget.student.rollno? 'You': message['name']}: ${message['message']}",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                 ),
              )
            ),
          ],
        )
      );
    }

    children = [Expanded(child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,),)
    ];

    children.add(
      Container(
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
            width: 250,
            child: TextField(
              maxLength: 200,
              maxLines: 5,
              controller: input,
              onChanged: (val){
                userMsg = val;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter Message",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent)
                )
              ),
            ),
          ),
          RaisedButton(
            child: Text("Send", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),),
            color: Colors.white,
            onPressed: (){
              userMsg = userMsg.trim();
              if(userMsg != null && userMsg != ''){
                sendMessage(userMsg);
                clearText();
                userMsg = '';
              }
            },
          )
        ],),
      )
    );

    return Column(children: children,);
  }

  @override
  Widget build(BuildContext context) {
    var snapshots = _db.where('year', isEqualTo: widget.student.year())
    .where('department', isEqualTo: widget.student.department()).snapshots();

    return StreamBuilder(
      stream: snapshots,
      builder: (_, snapshot){
        if(snapshot.hasData){
          var documents = snapshot.data.documents;
          return Scaffold(
            appBar: AppBar(title: Text("Chats"),),
            body: getChats(documents),
          );
        }
        else{
          return LoadingScreen();
        }
    },);
  }
}



class Events extends StatelessWidget{

  final _db = Firestore.instance.collection('Event');
  final Student student;
  Events({this.student});

  Stream<QuerySnapshot> notification({Student user}){
    var notifications = _db
    .where("year", isEqualTo: student.year())
    .where('department', isEqualTo: student.department())
    .snapshots();
    return notifications;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Events'), backgroundColor: Colors.blueAccent,),
      body: StreamBuilder(
        stream: notification(user:student),
        builder: (_, snapshot){
          if(snapshot.hasData){
            int count = snapshot.data.documents.length;
            return ListView.builder(
              itemCount: count,
              itemBuilder: (_, int index){
                var document = snapshot.data.documents[index];
                return Container(
                  padding: EdgeInsets.symmetric(vertical:10, horizontal:0),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent[100])),
                    child: ListTile(
                      title: Text("${document['name'].toString().toUpperCase()} : ${document['about']}",
                        style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                );
              });
          }
          else{
            return Container(
              color: Colors.white,
              child: Center(child: SpinKitDualRing(color: Colors.blueAccent, size: 70,))
            );
          }
        },
      ),
    );
  }
}
