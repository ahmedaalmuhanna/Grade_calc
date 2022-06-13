import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
// Functions Area !

String getGrade(double myGrade) {
  String gradeLetter = '';
  if (myGrade >= 90) {
    gradeLetter = 'A';
  } else if (myGrade < 90 && myGrade >= 80) {
    gradeLetter = 'B';
  } else if (myGrade < 80 && myGrade >= 70) {
    gradeLetter = 'C';
  } else if (myGrade < 70 && myGrade >= 60) {
    gradeLetter = 'D';
  } else {
    gradeLetter = 'F';
  }
  return gradeLetter;
}

// Functions Area !

class _HomePageState extends State<HomePage> {
  String gradeLetter = '';
  @override
  Widget build(BuildContext context) {
    var inputController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    // percentage text
                    Text(
                      "  %",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    // text field
                    Container(
                        width: 300,
                        child: TextField(
                          controller: inputController,
                          decoration: InputDecoration(
                              hintText: "                Type your score",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 202, 122, 216),
                                    width: 5,
                                  ))),
                        )),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 60),
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      print(inputController.text);
                      double grade = double.parse(inputController.text);

                      print(grade);

                      setState(() {
                        gradeLetter = getGrade(grade);
                      });
                      print(gradeLetter);
                    },
                    child: Container(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          "Calculate",
                          style: TextStyle(fontSize: 20),
                        )),
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), primary: Colors.pinkAccent),
                  )),
              Text(gradeLetter)
            ]),
      ),
      appBar: AppBar(
        title: Center(
            child: Text(
          "Grade Calculator",
          style: TextStyle(fontSize: 25),
        )),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }
}
