import 'package:flutter/material.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final formKey = GlobalKey<FormState>();
  String? name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 30, bottom: 30),
          child: Form(
            key: this.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /** 포켓몬 이름 **/
                CustomTextField(
                    context: context,
                    hint: "포켓몬 이름",
                    inputType: TextInputType.text,
                    onSaved: (val) {
                      setState(() {
                        this.name = val;
                      });
                    }),
                /** 포켓몬 번호 **/
                CustomTextField(
                    context: context,
                    hint: "포켓몬 번호",
                    inputType: TextInputType.text,
                    onSaved: (val) {
                      setState(() {
                        this.name = val;
                      });
                    }),
                /** 스테이터스 **/
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                            context: context,
                            inputType: TextInputType.number,
                            hint: "HP",
                            onSaved: (val) {
                              setState(() {
                                this.name = val;
                              });
                            }),
                        flex: 1),
                    Expanded(
                        child: CustomTextField(
                            context: context,
                            hint: "공격",
                            inputType: TextInputType.number,
                            onSaved: (val) {
                              setState(() {
                                this.name = val;
                              });
                            }),
                        flex: 1),
                    Expanded(
                        child: CustomTextField(
                            context: context,
                            inputType: TextInputType.number,
                            hint: "방어",
                            onSaved: (val) {
                              setState(() {
                                this.name = val;
                              });
                            }),
                        flex: 1)
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                            context: context,
                            inputType: TextInputType.number,
                            hint: "특공",
                            onSaved: (val) {
                              setState(() {
                                this.name = val;
                              });
                            }),
                        flex: 1),
                    Expanded(
                        child: CustomTextField(
                            context: context,
                            inputType: TextInputType.number,
                            hint: "특방",
                            onSaved: (val) {
                              setState(() {
                                this.name = val;
                              });
                            }),
                        flex: 1),
                    Expanded(
                        child: CustomTextField(
                            context: context,
                            inputType: TextInputType.number,
                            hint: "스피드",
                            onSaved: (val) {
                              setState(() {
                                this.name = val;
                              });
                            }),
                        flex: 1)
                  ],
                ),
                /** 설명 **/
                CustomTextField(
                    context: context,
                    hint: "설명",
                    inputType: TextInputType.text,
                    onSaved: (val) {
                      setState(() {
                        this.name = val;
                      });
                    }),
                /** 분류 **/
                CustomTextField(
                    context: context,
                    hint: "분류",
                    inputType: TextInputType.text,
                    onSaved: (val) {
                      setState(() {
                        this.name = val;
                      });
                    }),
                /** 특성 **/
                CustomTextField(
                    context: context,
                    hint: "특성",
                    inputType: TextInputType.text,
                    onSaved: (val) {
                      setState(() {
                        this.name = val;
                      });
                    }),
                /** 속성 **/
                CustomTextField(
                    context: context,
                    hint: "속성",
                    inputType: TextInputType.text,
                    onSaved: (val) {
                      setState(() {
                        this.name = val;
                      });
                    }),
                /** 도트이미지 **/
                CustomTextField(
                    context: context,
                    hint: "도트이미지",
                    inputType: TextInputType.text,
                    onSaved: (val) {
                      setState(() {
                        this.name = val;
                      });
                    }),
                /** 도트 이로치 이미지 **/
                CustomTextField(
                    context: context,
                    hint: "도트 이로치 이미지",
                    inputType: TextInputType.text,
                    onSaved: (val) {
                      setState(() {
                        this.name = val;
                      });
                    }),
                /** 이미지 **/
                CustomTextField(
                    context: context,
                    hint: "이미지",
                    inputType: TextInputType.text,
                    onSaved: (val) {
                      setState(() {
                        this.name = val;
                      });
                    }),
                /** 이로치 이미지 **/
                CustomTextField(
                    context: context,
                    hint: "이로치 이미지",
                    inputType: TextInputType.text,
                    onSaved: (val) {
                      setState(() {
                        this.name = val;
                      });
                    }),
                RaisedButton(
                  onPressed: () async {
                    if (this.formKey.currentState!.validate()) {
                      this.formKey.currentState!.save();
                      log("result $name");
                    } else {
                      log("fail $name");
                    }
                  },
                  child: Text("저장하기"),
                )
              ],
            ),
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void customShowDialog(
  BuildContext context,
  String title,
) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: [
            FlatButton(
              child: Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}

Widget CustomTextField(
    {required BuildContext context,
    required FormFieldSetter onSaved,
    required String hint,
    required TextInputType inputType}) {
  return Container(
    padding: EdgeInsets.all(8),
    child: Column(
      children: [
        TextFormField(
            validator: (value) {
              if (value!.length < 1) {
                return value;
              }
            },
            onSaved: onSaved,
            keyboardType: inputType,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: hint,
                errorStyle: TextStyle(color: Colors.red))),
      ],
    ),
  );
}
