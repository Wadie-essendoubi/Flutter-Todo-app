import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:device_simulator/device_simulator.dart';
import 'package:todoapp/models/todoclass.dart';

import '../Paint/todoPaint.dart';
import '../widgets/textInputs.dart';

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _typeValue = TextEditingController();
  final _titleValue = TextEditingController();
  DateTime pickeddate;

  List<TodoList> listtotdo = [];
  void Add_do() {
    if (_titleValue.text != '' && _typeValue.text != '' && pickeddate != null) {
      setState(() {
        listtotdo.add(TodoList(
            date: pickeddate, title: _titleValue.text, type: _typeValue.text));
        _titleValue.text = '';
        _typeValue.text = '';
        pickeddate = null;

        print(_typeValue.text);
        print(_titleValue.text);
        print(pickeddate);
       //Navigator.pop(context);

        //Navigator.pop(context);
      });
    }
  }

  void showDAtePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2022))
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        pickeddate = value;
      });
    });
  }

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return TexInput(
          typeValue: _typeValue,
          titleValue: _titleValue,
          add_do: Add_do,
          showpicker: showDAtePicker,
        );
        // Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var myweth = MediaQuery.of(context).size.width;
    var myheght = MediaQuery.of(context).size.height;
    var listlenth = listtotdo.length;
    //double mysize = MediaQuery.of(context).size as double;

    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        //resizeToAvoidBottomPadding: false,
        bottomNavigationBar: buildBottomNavigationBar(),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: myheght * 0.02),
                    builAppName_UserImage(myweth, myheght),
                    SizedBox(height: myheght * 0.02),
                    buildPeojectsNumber_andSliders(myweth, myheght, listlenth),
                  ],
                ),
              ),
              Stack(
                overflow: Overflow.visible,
                //alignment: Alignment.center,
                children: <Widget>[
                  build_SHape_Rectangle(myweth, myheght),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: build_See_All_Button(),
                  ),
                  build_Todo_InfoData(myheght, myweth),
                  Positioned(
                      bottom: -20,
                      right: 20,
                      child: buildAddTdodButton(context)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }







































                           //widgets
  FlatButton build_See_All_Button() {
    return FlatButton(
      onPressed: null,
      child: Text(
        'See All',
        style: TextStyle(color: Colors.white70),
      ),
    );
  }

  CustomPaint build_SHape_Rectangle(double myweth, double myheght) {
    return CustomPaint(
      size: Size(
          myweth * 0.8,
          myheght *
              0.60), //You can Replace this with your desired WIDTH and HEIGHT
      painter: RPSCustomPainter(),
    );
  }

  Column buildPeojectsNumber_andSliders(
      double myweth, double myheght, int listlenth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            AutoSizeText(
              'Projects',
              style: TextStyle(fontSize: 25, color: Colors.black54),
            ),
            Expanded(child: SizedBox()),
            buildBackButtonIcon(),
            SizedBox(
              width: myweth * 0.02,
            ),
            buildNextButtonIcon()
          ],
        ),
        SizedBox(height: myheght * 0.009),
        AutoSizeText(
          '$listlenth ONGOING',
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(height: myheght * 0.02),
      ],
    );
  }

  Row builAppName_UserImage(double myweth, double myheght) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.table_chart,
          color: Color(0Xff0c9556),
        ),
        SizedBox(
          width: myweth * 0.01,
        ),
        AutoSizeText('Todo App'),
        Expanded(child: SizedBox()),
        Icon(Icons.notifications),
        ClipOval(
          child: Image.asset(
            'lib/assets/images/ana.png',
            width: myweth * 0.10,
            height: myheght * 0.06,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      currentIndex: 0,
      // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.grid_on,
            color: Colors.black,
          ),
          icon: new Icon(
            Icons.home,
          ),
          title: new Text('hgf'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(
            Icons.swap_vertical_circle,
            color: Colors.grey.withOpacity(0.4),
          ),
          title: new Text('hgf'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.mail, color: Colors.grey.withOpacity(0.4)),
          title: new Text('Messages'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey.withOpacity(0.4)),
            title: Text('Profile'))
      ],
    );
  }

  Container buildNextButtonIcon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), shape: BoxShape.circle),
      child: Icon(
        Icons.navigate_next,
        size: 35,
        color: Colors.grey.withOpacity(0.9),
      ),
    );
  }

  Container buildBackButtonIcon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), shape: BoxShape.circle),
      child: Icon(
        Icons.navigate_before,
        size: 25,
        color: Colors.grey.withOpacity(0.5),
      ),
    );
  }

  Padding build_Todo_InfoData(double myheght, double myweth) {
    return listtotdo.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 52, left: 20),
            child: Card(
              elevation: 5,
              shadowColor: Colors.black.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        'Add Some Tasks !',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Image.asset(
                          'lib/assets/images/jjj.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                     
                      height: myheght * 0.4,
                      width: myweth * 0.6,
                    ),
                  ],
                )))
        : Padding(
            padding: const EdgeInsets.only(
              top: 52,
              left: 16,
              bottom: 2,
            ),
            child: SizedBox(
              height: myheght * 0.5,
              width: myweth * 0.6,
              child: ListView.builder(
                itemCount: listtotdo.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: myweth * 0.1,
                      height: myheght * 0.2,

                      //margin: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                offset: Offset(2, 5))
                          ],
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12)),

                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: AutoSizeText(
                                '#' + listtotdo[index].type,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: AutoSizeText(
                                listtotdo[index].title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: AutoSizeText(
                                DateFormat.yMd().format(listtotdo[index].date),
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                            ),
                            Container(
                              //color: Colors.blue,
                              height: myheght * 0.01,
                              //width: myweth * 0.5,
                              child: Row(
                                //crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.grey,
                                      ),
                                      onPressed: null),
                                  IconButton(
                                      icon: Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                      ),
                                      onPressed: null)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
  }

  Container buildAddTdodButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.yellow,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                blurRadius: 0,
                color: Color(0xffE0BD50),
                offset: Offset(-2, 1.5),
                spreadRadius: 0.5)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            startAddNewTransaction(context);
          },
        ),
      ),
    );
  }
}
