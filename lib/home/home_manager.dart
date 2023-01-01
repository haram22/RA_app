// 하람 //
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../screen_manager/manager_home.dart';

class Home_m extends StatefulWidget {
  const Home_m({super.key});

  @override
  State<Home_m> createState() => _Home_mState();
}

class _Home_mState extends State<Home_m> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  DatePickerController _controller = DatePickerController();
  DateTime _dateTime = DateTime.now();

  DateTime _selectedValue = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight:70,
        elevation: 0,
        backgroundColor: Colors.white70,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/profile.png',
                width: 50,
              ),
              SizedBox(width: 10,)
            ],
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 20.0, right: 20),
        child: Column(
          children: [
            Text("00님! 오늘 하루도 안전한 하루 되세요 :)",
              style: TextStyle(fontSize: 15.5),),
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Padding(
                  //   padding: EdgeInsets.all(10),
                  // ),
                  //Text(_selectedValue.toString()),
                  // Padding(
                  //   padding: EdgeInsets.all(20),
                  // ),
                  Container(
                    child: DatePicker(
                      DateTime.now(),
                      // width: 60,
                      height: 80,
                      controller: _controller,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Colors.black,
                      selectedTextColor: Colors.white,
                      inactiveDates: [
                        // DateTime.now().add(Duration(days: 3)),
                        // DateTime.now().add(Duration(days: 4)),
                        // DateTime.now().add(Duration(days: 7))
                      ],
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          _selectedValue = date;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 180,
              width: 400,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Colors.black,
                  ),
                ),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 20),
                      Text(
                        "📢 오늘의 공지",
                        style: TextStyle(color: Colors.red, fontSize: 17),
                      ),
                      SizedBox(height: 10),
                      Text("✔️ 3번 작업장 기계2 부품 고장")
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 230,
              width: 400,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Colors.black,
                  ),
                ),
                elevation: 0,
                child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 18),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "📑 진행상황 확인하기",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                            Spacer()
                          ],
                        ),
                        ListTile(
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_horiz_rounded),
                          ),
                          leading: Checkbox(
                              // fillColor: Colors.yellow,
                              value: _isChecked1,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked1 = value!;
                                });
                              }),
                          title: Text("3번 작업장 청소"),
                        ),
                      ],
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Manager_home()));
                  },
                  child: Text('+',style: TextStyle(fontSize: 30),),
                ),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}
