import 'package:flutter/material.dart';
import 'package:todo/pages/header.dart';
import 'package:todo/pages/todo_card.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
          floatingActionButton: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, "/add-todo");
            },
            style: ButtonStyle(
                iconSize: MaterialStateProperty.all(35),
                iconColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.blue)),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(children: [
              SizedBox(
                height: 70,
              ),
              Header(),
              SizedBox(
                height: 20,
              ),
              SearchBar(
                shape: MaterialStatePropertyAll(BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero))),
                hintText: "Taper le nom d'une tache",
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Colors.grey.shade200),
                hintStyle: MaterialStateProperty.all(
                    TextStyle(fontWeight: FontWeight.normal)),
                elevation: MaterialStateProperty.all(0),
                leading: Icon(Icons.search),
                padding: MaterialStateProperty.all(EdgeInsets.all(5)),
              ),
              SizedBox(
                height: 17,
              ),
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(
                      "Mes Taches",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.blue)),
                          onPressed: null,
                          child: Text(
                            'En Progres',
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(onPressed: null, child: Text('A faire')),
                      SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(onPressed: null, child: Text('Terminer')),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              TodoCard(
                category: "Category 1",
                progress_val: 1.0,
                start_date: "12 Janv 2024",
                end_date: "14 Janv 2024",
                title: "Kill the bastards",
              ),
              SizedBox(
                height: 25,
              ),
              TodoCard(
                category: "Category 2",
                progress_val: 0.10,
                start_date: "12 Janv 2024",
                end_date: "14 Janv 2024",
                title: "Show them no mercy",
              ),
            ]),
          )),
    );
  }
}
