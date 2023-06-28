import 'package:flutter/material.dart';
import 'package:flutter_faq/flutter_faq.dart';
import 'package:get/get.dart';

class FAQsScreen extends StatelessWidget {
  FAQsScreen({super.key});

  final List questions = [
    {
      'question': 'What is Flutter?',
      'answer':
          'Flutter is a mobile app development framework created by Google. It allows developers to build natively compiled applications for mobile, web, and desktop from a single codebase.',
    },
    {
      'question': 'What are the benefits of using Flutter?',
      'answer':
          'There are several benefits of using Flutter, including: fast development, expressive and flexible UI, hot reload, and good performance.',
    },
    {
      'question': 'Is Flutter only for mobile app development?',
      'answer':
          'No, Flutter can be used to develop applications for mobile, web, and desktop. It supports building for Android, iOS, web, and desktop platforms.',
    },
    {
      'question': 'Is Flutter only for Android and iOS?',
      'answer':
          'No, Flutter can be used to build applications for Android, iOS, web, and desktop. It has good support for all these platforms.',
    },
    {
      'question': 'Is Flutter only for small apps?',
      'answer':
          'No, Flutter can be used to build small as well as large and complex apps. It has the capabilities and performance to handle any size of app.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F8F8),
        elevation: 0,
        title: Text(
          "FAQs",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: OutlinedButton(
            onPressed: Get.back,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 0,
              ),
              side: BorderSide(color: Colors.black45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black45,
            ),
          ),
        ),
      ),
     
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:12.0, vertical: 18),
          child: ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              final question = questions[index]['question'];
              final answer = questions[index]['answer'];
              return ExpansionTile(

                title: Text(question!),
                children: [
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(answer!),
                  ),
                ],
              );
            },
          )),
      // body: SafeArea(
      //   child: Scaffold(
      //     backgroundColor: Color(0xFFF8F8F8),
      //     body: SingleChildScrollView(
      //       padding: const EdgeInsets.symmetric(horizontal: 20),
      //       child: Column(children: [
      //         FAQ(
      //           showDivider: false,
      //           question: "Question 1",
      //           answer: data,
      //           separator: Container(
      //             height: 5,
      //             width: double.infinity,
      //             color: Colors.purple,
      //           ),
      //           ansPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 0,),
      //           queStyle: TextStyle(
      //             color: Color(0xFF7a7d97),
      //           ),
      //           ansStyle: TextStyle(
      //             color: Color(0xFFd3d4db),
      //           ),
      //           ansDecoration: BoxDecoration(
      //             color: Color(0xFFF8F8F8),
                  
      //           ),
      //           queDecoration: BoxDecoration(
      //             color: Color(0xFFF8F8F8),
      //           ),
      //         ),
      //         FAQ(question: "Question2", answer: data),
      //         FAQ(
      //           question: "Question 3",
      //           answer: data,
      //           ansStyle: const TextStyle(color: Colors.blue, fontSize: 15),
      //           queStyle: const TextStyle(color: Colors.green, fontSize: 35),
      //         ),
      //         FAQ(
      //           question: "Question 4",
      //           answer: data,
      //           showDivider: false,
      //         ),
      //         FAQ(
      //           question: "Question 5",
      //           answer: data,
      //           expandedIcon: const Icon(Icons.minimize),
      //           collapsedIcon: const Icon(Icons.add),
      //           showDivider: false,
      //           ansStyle: const TextStyle(color: Colors.blue, fontSize: 15),
      //           ansPadding: const EdgeInsets.all(50),
      //         ),
      //         FAQ(
      //           question: "Question 6",
      //           answer: data,
      //           expandedIcon: const Icon(Icons.minimize),
      //           collapsedIcon: const Icon(Icons.add),
      //           ansStyle: const TextStyle(color: Colors.blue, fontSize: 15),
      //           ansPadding: const EdgeInsets.all(50),
      //           separator: Container(
      //             height: 5,
      //             width: double.infinity,
      //             color: Colors.purple,
      //           ),
      //         ),
      //         FAQ(
      //           question: "Question 7",
      //           answer: data,
      //           expandedIcon: const Icon(Icons.minimize),
      //           collapsedIcon: const Icon(Icons.add),
      //           showDivider: false,
      //           ansStyle: const TextStyle(color: Colors.blue, fontSize: 15),
      //           ansPadding: const EdgeInsets.all(50),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),
    
    );
  }
}

String data = """"
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
""";
