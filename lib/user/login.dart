import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../home/home_manager.dart';
import '../home/home_worker.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

int? _value = 0;

class _loginState extends State<login> {
  List<String> role = ["작업자", "관리자"];
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(top: 308.0, left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: 'ID',
                hintText: 'ID 번호를 입력해주세요.',
                labelStyle: TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30),
            TextField(
              controller: pwController,
              decoration: InputDecoration(
                labelText: '비밀번호',
                hintText: '비밀번호를 입력해주세요.',
                labelStyle: TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Wrap(
                    spacing: 5.0,
                    children: List<Widget>.generate(
                      2,
                      (int index) {
                        return ChoiceChip(
                          selectedColor: Colors.black,
                          disabledColor: Colors.grey[700],
                          backgroundColor: Colors.grey[400],
                          selected: _value == index,
                          label: Text(
                            '${role[index]}',
                            style: TextStyle(color: Colors.white),
                          ),
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? index : null;
                              print(index);
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 57,
              width: 277,
              child: OutlinedButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    String id = idController.text.trim();
                    String pw = pwController.text.trim();

                    if (id.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("아이디를 입력해주세요"),
                      ));
                    } else if (pw.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("비밀번호를 입력해주세요"),
                      ));
                    } else {
                      QuerySnapshot snap = await FirebaseFirestore.instance
                          .collection("작업자")
                          .where('id', isEqualTo: id)
                          .get();

                      try {
                        if (pw == snap.docs[0]['pw']) {
                          if (_value == 0) {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //       return Home_w();
                            //     }));
                          } else {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Home_m();
                            }));
                          }
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("비밀번호가 일치하지 않습니다"),
                          ));
                        }
                      } catch (e) {
                        String error = " ";
                        if (e.toString() ==
                            "RangeError (index): Invalid value: Valid value range is empty: 0") {
                          setState(() {
                            error = "일치하는 아이디가 존재하지 않습니다";
                          });
                        } else {
                          setState(() {
                            error = "Error occured";
                          });
                        }

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(error),
                        ));
                      }

                      print("⭐️⭐️id: " + snap.docs[0]['id']);
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: OutlinedButton.styleFrom()),
            )
          ],
        ),
      ),
    );
  }
}
// 하람 //