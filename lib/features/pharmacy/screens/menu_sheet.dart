import 'package:flutter/material.dart';
import '../widgets/pickup_drug_search.dart';

class MenuSheet extends StatelessWidget {
  const MenuSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            height: 5.0,
            width: 40.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
              child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.camera,
              color: Colors.white,
              size: 50,
            ),
          )),
          SizedBox(
            height: 12,
          ),
          Center(
            child: Text(
              "EnthCliff",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 20.0,
            child: Divider(
              thickness: 10,
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      radius: 30,
                      child: Icon(Icons.shield_sharp, size: 30,),
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      radius: 30,
                      child: Icon(Icons.message_rounded, size: 30,),
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      radius: 30,
                      child: Icon(Icons.settings, size: 30,),
                    ),
                  ),
                )
              ],
            ),
          ),
           SizedBox(
            height: 20.0,
            child: Divider(
              thickness: 10,
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 8,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(children: [
                    
                    ListTile(
                      title: Text("History"),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    Divider(
                      indent: 13,
                      endIndent: 20,
                    ),
                    ListTile(
                      title: Text("Info"),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    // SizedBox(
                    //   width: 500,
                    //   height: 0,
                    //   child: Divider(),
                    // ),
                  ]),
                ),
              
              ],
            ),
          )
        ],
      ),
    );
  }
}
