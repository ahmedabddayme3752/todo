import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TodoCard extends StatelessWidget {
  const TodoCard(
      {super.key,
      required this.category,
      required this.title,
      required this.progress_val,
      required this.start_date,
      required this.end_date});
  final String category;
  final String title;
  final double progress_val;
  final String start_date;
  final String end_date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(19),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              color: Colors.grey.shade400, style: BorderStyle.solid)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category,
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Icon(
                CupertinoIcons.ellipsis,
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 2,
          ),
          Text("Progress"),
          new LinearPercentIndicator(
            padding: EdgeInsets.all(2),
            width: 140.0,
            lineHeight: 10.0,
            percent: progress_val,
            backgroundColor: Colors.grey.shade300,
            progressColor: Colors.blue,
            trailing: Text(
              "${progress_val * 100} %",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_month_outlined,
                color: Colors.blue,
              ),
              Text(
                start_date,
                style: TextStyle(color: Colors.grey.shade700),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.flag,
                color: Colors.blue,
              ),
              Text(
                end_date,
                style: TextStyle(color: Colors.grey.shade700),
              )
            ],
          )
        ],
      ),
    );
  }
}
