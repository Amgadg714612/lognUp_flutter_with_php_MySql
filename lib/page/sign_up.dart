import 'package:course_flutter_witphp/co/color.dart';
import 'package:course_flutter_witphp/config.dart';
import 'package:course_flutter_witphp/model/database.dart';
import 'package:flutter/material.dart';

class SignUP extends StatefulWidget {
  const SignUP();
  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  @override
  TextEditingController email = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  databas db = databas();
  signUPs() async {
    var resmy = await db.postreq(pathurisinup,
        {"nameuser": name.text, "email": email.text, "pass": pass.text});
    if (resmy['rest'] == "seccuss") {
      print("seccuess of add");
    } else {
      print(resmy);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: gradient[7],
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Center(
                child: SizedBox(
                  width: 30,
                  height: 40,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Icon(
                  Icons.supervised_user_circle,
                  size: 30.0,
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  "انشاء بيانات المستخدم ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(30)),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextField(
                  controller: email,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    hintText: "Email ",
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextField(
                  controller: name,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      hintText: " اسم المستخدم  "),
                ),
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextField(
                  controller: pass,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      hintText: "كلمة السر"),
                ),
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              GestureDetector(
                onTap: () async {
                  await signUPs();
                },
                child: Container(
                  height: 70.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ارسل البيانات",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
