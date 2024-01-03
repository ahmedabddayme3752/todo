import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/Todo.dart';
import 'package:todo/pages/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addTask(Task task) async {
 CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
 await tasks.add(task.toMap());
}
class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Header(),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Creer une nouvelle tache",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Form(
                  child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Type",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DropdownButtonFormField(
                      icon: Icon(Icons.arrow_drop_down_sharp),
                      iconDisabledColor: Colors.blue,
                      iconEnabledColor: Colors.blue,
                      iconSize: 35,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          fillColor: Colors.grey.shade200,
                          filled: true),
                      items: [DropdownMenuItem(child: Text("Type"))],
                      onChanged: null),
                  SizedBox(
                    height: 15,
                  ),
                  // Première paire
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Titre",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey.shade200,
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 25), // Espacement entre les paires de TextField
                  // Deuxième paire

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Date debut",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )),
                          SizedBox(height: 10), //
                          TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.grey.shade200,
                                filled: true),
                          )
                        ],
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Date Fin",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )),
                          SizedBox(height: 10), //
                          TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.grey.shade200,
                                filled: true),
                          )
                        ],
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Etat",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )),
                          SizedBox(height: 10), //
                          DropdownButtonFormField(
                              icon: Icon(Icons.arrow_drop_down_sharp),
                              iconDisabledColor: Colors.blue,
                              iconEnabledColor: Colors.blue,
                              iconSize: 25,
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  fillColor: Colors.grey.shade200,
                                  filled: true),
                              items: [DropdownMenuItem(child: Text("Done"))],
                              onChanged: null),
                        ],
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Avancement",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )),
                          SizedBox(height: 10), //
                          TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.grey.shade200,
                                filled: true),
                          )
                        ],
                      )),
                    ],
                  ),

                  SizedBox(height: 35),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Creer une tache",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    ));
  }
}
// 3486 300