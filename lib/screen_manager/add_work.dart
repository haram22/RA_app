// 성경 //
import 'dart:io';
<<<<<<< HEAD
import 'package:flutter/material.dart';
=======
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
>>>>>>> 59aab01af563fe6d9789c57f071dcc098d02320a
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import './manager_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

<<<<<<< HEAD
=======

>>>>>>> 59aab01af563fe6d9789c57f071dcc098d02320a
late List<dynamic> name = <dynamic>["김00", "이00", "박00", "정00"];
late List<dynamic> team = <dynamic>["A팀", "B팀", "C팀", "D팀"];
late List<String> selectedTeam = <String>[];
late List<String> selectedName = <String>[];

late List<bool> isCheckedTeam = <bool>[false, false, false, false];
late List<bool> isCheckedName = <bool>[false, false, false, false];

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '업무추가(관리자)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '업무 추가'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
<<<<<<< HEAD
  late String teamName, content, worker, deadlineDate, deadlineTime;
  // bool _isChecked  = false;
=======

  late String teamName, content, worker, deadlineDate, deadlineTime;
  // bool _isChecked  = false;

  DatePickerController _controller = DatePickerController();
  DateTime _dateTime = DateTime.now();

  DateTime _selectedValue = DateTime.now();
 
>>>>>>> 59aab01af563fe6d9789c57f071dcc098d02320a
  DateTime? selectedDate;
  File? _image;
  final inputController1 = TextEditingController();
  final inputController2 = TextEditingController();

  final picker = ImagePicker();
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
            child: ListBody(
              children: ListTile.divideTiles(context: context, tiles: [
                ListTile(
                  title: Text('부서'),
                  trailing: IconButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                            isScrollControlled: true,
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(25),
                                topStart: Radius.circular(25),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return Container(
                                padding: const EdgeInsets.all(20),
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text('부서'),
                                    Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: team.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              leading: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                backgroundImage: AssetImage(
                                                    'assets/images/team.png'),
                                              ),
                                              title: Text('${team[index]}'),
                                              trailing: Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: Colors.redAccent,
<<<<<<< HEAD
                                                value: isCheckedTeam[index],
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isCheckedTeam[index] =
                                                        value!;
                                                    if (isCheckedTeam[index]) {
                                                      selectedTeam
                                                          .add(team[index]);
                                                    } else
                                                      selectedTeam
                                                          .remove(team[index]);
=======
                                                value: _isChecked,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isChecked = value!;
>>>>>>> 59aab01af563fe6d9789c57f071dcc098d02320a
                                                  });
                                                },
                                              ),
                                            );
                                          }),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
<<<<<<< HEAD
                                        ElevatedButton(
                                          child: const Text('취소'),
                                          onPressed: () =>
                                              Navigator.pop(context),
=======

                                        const Text('부서'),
                                        Expanded(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: team.length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  leading: CircleAvatar(
                                                    backgroundColor: Colors.white,
                                                    backgroundImage: AssetImage('assets/images/team.png'),
                                                  ),

                                                  title: Text('${team[index]}'),
                                                  trailing: Checkbox(
                                                    checkColor: Colors.white,
                                                    activeColor: Colors.redAccent,
                                                    value: isCheckedTeam[index],
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        isCheckedTeam[index] = value!;
                                                        if(isCheckedTeam[index]) {
                                                          selectedTeam.add(team[index]);
                                                        } else selectedTeam.remove(team[index]);
                                                      });
                                                    },
                                                  ),
                                                );
                                              }
                                          ),

>>>>>>> 59aab01af563fe6d9789c57f071dcc098d02320a
                                        ),
                                        ElevatedButton(
                                          child: const Text('선택'),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                      ],
                                    ),
<<<<<<< HEAD
                                  ],
=======

                                  );
                                }
                            );
                          }, icon: Icon(Icons.arrow_forward_ios)),
                        ),
                        ListTile(
                          title: Text('업무 내용'),
                          onTap: () {
                          },
                          // trailing: Icon(Icons.arrow_forward_ios),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            // labelText: '업무 내용',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String? newValue) {
                            content = newValue!;
                            print(content);
                          },
                          validator: (value) {
                            if(value!.isEmpty) {
                              return 'Please enter some text';
                            }
                          },
                          controller: inputController1,
                          minLines: 1,
                          maxLines: 5,
                        ),
                        ListTile(
                          title: Text('담당자'),
                          trailing: IconButton(onPressed: () {
                            showModalBottomSheet<void>(
                                isScrollControlled: true,
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusDirectional.only(
                                    topEnd: Radius.circular(25),
                                    topStart: Radius.circular(25),
                                  ),

>>>>>>> 59aab01af563fe6d9789c57f071dcc098d02320a
                                ),
                              );
                            });
                      },
                      icon: Icon(Icons.arrow_forward_ios)),
                ),
                ListTile(
                  title: Text('업무 내용'),
                  onTap: () {},
                  // trailing: Icon(Icons.arrow_forward_ios),
                ),
<<<<<<< HEAD
                TextFormField(
=======
                TextField(
>>>>>>> 59aab01af563fe6d9789c57f071dcc098d02320a
                  decoration: InputDecoration(
                    // labelText: '업무 내용',
                    border: OutlineInputBorder(),
                  ),
<<<<<<< HEAD
                  onChanged: (String? newValue) {
                    content = newValue!;
                    print(content);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                  controller: inputController1,
=======
>>>>>>> 59aab01af563fe6d9789c57f071dcc098d02320a
                  minLines: 1,
                  maxLines: 5,
                ),
                ListTile(
                  title: Text('담당자'),
                  trailing: IconButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                            isScrollControlled: true,
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(25),
                                topStart: Radius.circular(25),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return Container(
                                padding: const EdgeInsets.all(20),
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text('담당자'),
                                    Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: name.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              leading: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    'assets/images/user.png'),
                                              ),
                                              title: Text('${name[index]}'),
                                              trailing: Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: Colors.redAccent,
<<<<<<< HEAD
                                                value: isCheckedName[index],
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isCheckedName[index] =
                                                        value!;
                                                    if (isCheckedName[index]) {
                                                      selectedName
                                                          .add(name[index]);
                                                    } else
                                                      selectedName
                                                          .remove(name[index]);
=======
                                                value: _isChecked,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isChecked = value!;
>>>>>>> 59aab01af563fe6d9789c57f071dcc098d02320a
                                                  });
                                                },
                                              ),
                                            );
                                          }),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
<<<<<<< HEAD
                                        ElevatedButton(
                                          child: const Text('취소'),
                                          onPressed: () =>
                                              Navigator.pop(context),
=======

                                        const Text('담당자'),
                                        Expanded(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: name.length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  leading: CircleAvatar(
                                                    backgroundImage: AssetImage('assets/images/user.png'),
                                                  ),

                                                  title: Text('${name[index]}'),
                                                  trailing: Checkbox(
                                                    checkColor: Colors.white,
                                                    activeColor: Colors.redAccent,
                                                    value: isCheckedName[index],
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        isCheckedName[index] = value!;
                                                        if(isCheckedName[index]) {
                                                          selectedName.add(name[index]);
                                                        } else selectedName.remove(name[index]);
                                                      });
                                                    },
                                                  ),
                                                );
                                              }
                                          ),

>>>>>>> 59aab01af563fe6d9789c57f071dcc098d02320a
                                        ),
                                        ElevatedButton(
                                          child: const Text('선택'),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      icon: Icon(Icons.arrow_forward_ios)),
                ),
                ListTile(
                  title: Text('마감일자'),
                  trailing: Wrap(
                    spacing: 25,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.only(
                                  topEnd: Radius.circular(25),
                                  topStart: Radius.circular(25),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return Container(
                                  padding: const EdgeInsets.all(20),
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Text('날짜 선택'),
                                      CalendarDatePicker(
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2100, 12, 31),
                                        onDateChanged: (date) {
                                          setState(() {
                                            selectedDate = date;
                                          });
                                        },
                                      ),
<<<<<<< HEAD
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          ElevatedButton(
                                            child: const Text('취소'),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                          ElevatedButton(
                                            child: const Text('선택'),
                                            // onPressed: () => Navigator.pop(context),
                                            onPressed: () {},
=======

                                      builder: (BuildContext context) {
                                        return Container(
                                          padding: const EdgeInsets.all(20),
                                          height: MediaQuery.of(context).size.height*0.7,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              const Text('날짜 선택'),
                                              CalendarDatePicker(
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime(2100, 12, 31),
                                                onDateChanged: (date) {
                                                  setState(() {
                                                    selectedDate = date;
                                                  });
                                                },
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget> [
                                                  ElevatedButton(
                                                    child: const Text('취소'),
                                                    onPressed: () => Navigator.pop(context),
                                                  ),
                                                  ElevatedButton(
                                                    child: const Text('선택'),
                                                    // onPressed: () => Navigator.pop(context),
                                                    onPressed: () {

                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],

                                          ),
                                          ElevatedButton(
                                            child: const Text('선택'),
                                            onPressed: () =>
                                                Navigator.pop(context),
>>>>>>> 59aab01af563fe6d9789c57f071dcc098d02320a
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: const Text('날짜 선택'),
                      ),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.only(
                                  topEnd: Radius.circular(25),
                                  topStart: Radius.circular(25),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return Container(
                                  padding: const EdgeInsets.all(20),
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Text('시간 선택'),
<<<<<<< HEAD
=======
                                      TimePickerSpinner(
                                        is24HourMode: false,
                                        normalTextStyle: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        highlightedTextStyle: TextStyle(
                                            fontSize: 20, color: Colors.blue),
                                        spacing: 20,
                                        itemHeight: 50,
                                        isForce2Digits: true,
                                        onTimeChange: (time) {
                                          setState(() {
                                            _dateTime = time;
                                          });
                                        },
                                      ),
>>>>>>> 59aab01af563fe6d9789c57f071dcc098d02320a
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          ElevatedButton(
                                            child: const Text('취소'),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                          ElevatedButton(
                                            child: const Text('선택'),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: const Text('시간 선택'),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text('첨부파일'),
                  trailing: IconButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                            isScrollControlled: true,
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(25),
                                topStart: Radius.circular(25),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return Container(
                                padding: const EdgeInsets.all(20),
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text('첨부 파일'),
                                    MaterialButton(
                                      color: Colors.grey,
                                      child: const Text("갤러리 +",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        // pickImage();
                                        getImage(ImageSource.gallery);
                                      },
                                    ),
                                    MaterialButton(
                                      color: Colors.grey,
                                      child: const Text("카메라 +",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        getImage(ImageSource.camera);
                                      },
                                    ),
                                    Container(
                                        child: Center(
                                      child: _image != null
                                          ? Image.file(File(_image!.path))
                                          : Text("No image selected"),
                                    )),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          ElevatedButton(
                                            child: const Text('취소'),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                          ElevatedButton(
                                            child: const Text('업로드'),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      icon: Icon(Icons.arrow_forward_ios)),
                )
              ]).toList(),
            ),
          )),

          // const SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
<<<<<<< HEAD
              ElevatedButton(child: Text('취소'), onPressed: () {}),
              ElevatedButton(
                  child: Text('확인'),
                  onPressed: () {
                    final managerReference = FirebaseFirestore.instance
                        .collection("관리자")
                        .doc("관리자1");
                    final calendarReference = managerReference
                        .collection("calendar")
                        .doc("2023-01-05 00:00:00.000");
                    final workReference = calendarReference
                        .collection("업무")
                        .doc(inputController1.text);
=======

              ElevatedButton(
                  child: Text('취소'),
                  onPressed: () {

                  }
              ),

              ElevatedButton(
                  child: Text('확인'),
                  onPressed: () {
                    final managerReference = FirebaseFirestore.instance.collection("관리자").doc("관리자1");
                    final calendarReference = managerReference.collection("calendar").doc("2023-01-05 00:00:00.000");
                    final workReference = calendarReference.collection("업무").doc(inputController1.text);
>>>>>>> 59aab01af563fe6d9789c57f071dcc098d02320a
                    workReference.set({
                      "content": inputController1.text,
                      "team": FieldValue.arrayUnion(selectedTeam),
                      "worker": FieldValue.arrayUnion(selectedName),
                      "isComplete": "접수",
                    });
<<<<<<< HEAD
                    for (String worker in selectedName) {
                      workReference.update({
                        worker: {
                          'isComplete': "접수",
                        }
                      });

                      final workerReference = FirebaseFirestore.instance
                          .collection("작업자")
                          .doc(worker);
                      final calReference = workerReference
                          .collection("calendar")
                          .doc("2023-01-05 00:00:00.000");
                      final todayWork = calReference
                          .collection("오늘의 할 일")
                          .doc(inputController1.text);
=======
                    for(String worker in selectedName) {
                      workReference.update({worker: {
                        'isComplete': "접수",
                      }});

                      final workerReference = FirebaseFirestore.instance.collection("작업자").doc(worker);
                      final calReference = workerReference.collection("calendar").doc("2023-01-05 00:00:00.000");
                      final todayWork = calReference.collection("오늘의 할 일").doc(inputController1.text);
>>>>>>> 59aab01af563fe6d9789c57f071dcc098d02320a
                      todayWork.set({
                        "content": inputController1.text,
                        "isComplete": "접수",
                      });
                    }
                    print("selectedTeam: " + selectedTeam.toString());
                    print("selectedName: " + selectedName.toString());
<<<<<<< HEAD
                  })
=======

                  }
              )

>>>>>>> 59aab01af563fe6d9789c57f071dcc098d02320a
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Manager_home()),
          );
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xff485ed9)),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '진행상황',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '설정',
          ),
        ],
        selectedItemColor: Color(0xff485ed9),
      ),
    );
  }
}
