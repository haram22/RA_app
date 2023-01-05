
import '../screen_manager/alarm_detail.dart';
import '../screen_manager/manager_home.dart';
import '../screen_manager/work_detail.dart';
import '../screen_worker/setting_w.dart';
import 'home_manager.dart';

enum SingingCharacter { ten, fifteen, twenty, none }




  @override
  State<Home_w> createState() => _Home_wState();
}

class _Home_wState extends State<Home_w> {
  List todos = [];
  //  final List<ListItem> todos;
  String addMyWork = '';
  SingingCharacter? _character = SingingCharacter.ten;
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  DatePickerController _controller = DatePickerController();
  DateTime _dateTime = DateTime.now();

  DateTime _selectedValue = DateTime.now();

  @override
  void initState() {
    super.initState();
    todos.add("작업복 세탁");
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white70,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return setting_w();
                  }));
                },
                iconSize: 70,
                icon: Image.asset('assets/profile.png'),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 20.0, right: 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "00님! 오늘 하루도 안전한 하루 되세요 :)",
                    style: TextStyle(fontSize: 15.5),
                  ),
                ],
              ),
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
                height: 140,
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
                    padding:
                        const EdgeInsets.only(left: 20, top: 18, bottom: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "📢 오늘의 공지",
                          style: TextStyle(color: Colors.red, fontSize: 17),
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          dense: true,
                          visualDensity: VisualDensity(vertical: -4),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AlarmDetails()));
                          },
                          title: Text(
                            "✔️ 3번 작업장 기계2 부품 고장",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          visualDensity: VisualDensity(vertical: -4),
                          onTap: () {},
                          title: Text(
                            "✔️ 작업 시 안전모를 꼭 착용하세요.",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 180,
                width: 400,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black),
                  ),
                  elevation: 0,
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 18.0, top: 18, bottom: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("📑 오늘의 할 일",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17)),
                              Spacer()
                            ],
                          ),
                          ListTile(
                            dense: true,
                            visualDensity: VisualDensity(vertical: -3),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TaskDetails()));
                            },
                            trailing: IconButton(
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  enableDrag: true,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30.0))),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Container(
                                        height: 300,
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 0, 0),
                                        child: Column(
                                          children: <Widget>[
                                            RadioListTile(
                                                title: Text("10분 전에 알리기"),
                                                value: SingingCharacter.ten,
                                                groupValue: _character,
                                                onChanged: (value) {
                                                  _character = value;
                                                }),
                                            RadioListTile(
                                                title: Text("15분 전에 알리기"),
                                                value: SingingCharacter.fifteen,
                                                groupValue: _character,
                                                onChanged: (value) {
                                                  _character = value;
                                                }),
                                            RadioListTile(
                                                title: Text("20분 전에 알리기"),
                                                value: SingingCharacter.twenty,
                                                groupValue: _character,
                                                onChanged: (value) {
                                                  _character = value;
                                                }),
                                            RadioListTile(
                                                title: Text("없음"),
                                                value: SingingCharacter.none,
                                                groupValue: _character,
                                                onChanged: (value) {
                                                  _character = value;
                                                }),
                                            OutlinedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("저장"),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                                  },
                                );
                              },
                              icon: Icon(Icons.more_horiz_rounded),
                            ),
                            leading: Icon(
                              Icons.check_box_outlined,
                              color: Colors.grey,
                            ),
                            title: Text("3번 작업장 청소"),
                            subtitle: Text(
                              "15:30까지",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          ListTile(
                            dense: true,
                            visualDensity: VisualDensity(vertical: -3),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TaskDetails()));
                            },
                            trailing: IconButton(
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  enableDrag: true,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30.0))),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Container(
                                        height: 300,
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 0, 0),
                                        child: Column(
                                          children: <Widget>[
                                            RadioListTile(
                                                title: Text("10분 전에 알리기"),
                                                value: SingingCharacter.ten,
                                                groupValue: _character,
                                                onChanged: (value) {
                                                  _character = value;
                                                }),
                                            RadioListTile(
                                                title: Text("15분 전에 알리기"),
                                                value: SingingCharacter.fifteen,
                                                groupValue: _character,
                                                onChanged: (value) {
                                                  _character = value;
                                                }),
                                            RadioListTile(
                                                title: Text("20분 전에 알리기"),
                                                value: SingingCharacter.twenty,
                                                groupValue: _character,
                                                onChanged: (value) {
                                                  _character = value;
                                                }),
                                            RadioListTile(
                                                title: Text("없음"),
                                                value: SingingCharacter.none,
                                                groupValue: _character,
                                                onChanged: (value) {
                                                  _character = value;
                                                }),
                                            OutlinedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("저장"),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                                  },
                                );
                              },
                              icon: Icon(Icons.more_horiz_rounded),
                            ),
                            leading: Icon(
                              Icons.check_box_outlined,
                              color: Colors.grey,
                            ),
                            title: Text("기계2 부품 확인"),
                            subtitle: Text(
                              "18:00까지",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 300,
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
                      child: SingleChildScrollView(
                        physics: ScrollPhysics(),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  "📑 내가 추가한 일",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                                IconButton(
                                    onPressed: () {
                                      // showDialog(
                                      //     context: context,
                                      //     builder: (BuildContext context) {
                                      //       return AlertDialog(
                                      //           title: Text("오늘 할 일을 추가해주세요"),
                                      //           content: TextField(
                                      //             onChanged: (String value) {
                                      //               addMyWork = value;
                                      //             },
                                      //           ),
                                      //           actions: <Widget>[
                                      //             TextButton(
                                      //                 onPressed: () {
                                      //                   setState(() {
                                      //                     todos.add(addMyWork);
                                      //                   });
                                      //                   Navigator.of(context)
                                      //                       .pop(); // input 입력 후 창 닫히도록
                                      //                 },
                                      //                 child: Text("추가하기"))
                                      //           ]);
                                      //     });
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                TextField(onChanged: (text) {
                                                  setState(() {
                                                    addMyWork = text;
                                                  });
                                                }),
                                                TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        todos.add(addMyWork);
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("확인"))
                                              ],
                                            );
                                          });
                                    },
                                    icon: Icon(Icons.add)),
                                Spacer()
                              ],
                            ),
                            SingleChildScrollView(
                              physics: ScrollPhysics(),
                              child: Container(
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: todos.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        title: Text(todos[index]),
                                      );
                                    }),
                              ),
                            )
                            // Container(
                            //   color: Colors.red,
                            //   child: ListView.builder(
                            //       itemCount: todos.length,
                            //       itemBuilder: (BuildContext context, int index) {
                            //         return Dismissible(
                            //             key: Key(todos[index]),
                            //             child: Card(
                            //                 child: ListTile(
                            //               title: Text(todos[index]),
                            //             )));
                            //       }),
                            // ),
                            // ListView.builder(
                            //     itemCount: todos.length,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       return Dismissible(
                            //           // 삭제 버튼 및 기능 추가
                            //           key: Key(todos[index]),
                            //           child: Card(
                            //               elevation: 4,
                            //               margin: EdgeInsets.all(8),
                            //               shape: RoundedRectangleBorder(
                            //                   borderRadius:
                            //                       BorderRadius.circular(8)),
                            //               child: ListTile(
                            //                 title: Text(todos[index]),
                            //                 trailing: IconButton(
                            //                     icon: Icon(Icons.delete,
                            //                         color: Colors.red),
                            //                     onPressed: () {
                            //                       setState(() {
                            //                         todos.removeAt(index);
                            //                       });
                            //                     }),
                            //               )));
                            //     }),

                            // ListTile(
                            //   trailing: IconButton(
                            //     onPressed: () {
                            //       showModalBottomSheet(
                            //           context: context,
                            //           builder: (context) {
                            //             return Column(
                            //               mainAxisSize: MainAxisSize.min,
                            //               children: <Widget>[
                            //                 SizedBox(
                            //                   height: 20,
                            //                 ),
                            //                 TimePickerSpinner(
                            //                   is24HourMode: false,
                            //                   normalTextStyle: TextStyle(
                            //                       fontSize: 20,
                            //                       color: Colors.black),
                            //                   highlightedTextStyle: TextStyle(
                            //                       fontSize: 20, color: Colors.blue),
                            //                   spacing: 20,
                            //                   itemHeight: 50,
                            //                   isForce2Digits: true,
                            //                   onTimeChange: (time) {
                            //                     setState(() {
                            //                       _dateTime = time;
                            //                     });
                            //                   },
                            //                 ),
                            //                 Text(
                            //                   _dateTime.hour
                            //                           .toString()
                            //                           .padLeft(2, '0') +
                            //                       ':' +
                            //                       _dateTime.minute
                            //                           .toString()
                            //                           .padLeft(2, '0'),
                            //                   style: TextStyle(
                            //                       fontSize: 24,
                            //                       fontWeight: FontWeight.bold),
                            //                 ),
                            //                 TextButton(
                            //                     onPressed: () {
                            //                       Navigator.pop(context);
                            //                     },
                            //                     child: Text("확인"))
                            //               ],
                            //             );
                            //           });
                            //     },
                            //     icon: Icon(Icons.more_horiz_rounded),
                            //   ),
                            //   leading: Checkbox(
                            //       // fillColor: Colors.yellow,
                            //       value: _isChecked2,
                            //       onChanged: (bool? value) {
                            //         setState(() {
                            //           _isChecked2 = value!;
                            //         });
                            //       }),
                            //   title: Text("$addMyWork"),
                            // ),

                            //성경 파트 연결 버튼
                            /*Row(
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
                            ),*/
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}

