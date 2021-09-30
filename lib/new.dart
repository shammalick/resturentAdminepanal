// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class New extends StatelessWidget {
 
//  final db = FirebaseFirestore.instance;
 
//   @override
//   Widget build(BuildContext context) {
//     return Builder(
//       builder: (context) {
//         return Scaffold(
//           // ignore: avoid_unnecessary_containers
//           body: Container(
//             height: 200,
//             width: 200,
//              child:     StreamBuilder<QuerySnapshot>(
//                       stream: db.collection('recipies').snapshots(),
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           var recipies = snapshot.data!.docs;
//                           return GridView.builder(
//                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 4),
//                               // physics: BouncingScrollPhysics(),
//                               scrollDirection: Axis.vertical,
//                               shrinkWrap: true,
//                               itemCount: recipies.length,
//                               itemBuilder: (context, index) {
//                                 // number = recipies[index].get('views');
// return Text(recipies[index].get('name'),
//                             );
                               

//                               });
//                         } else {
//             //               return ListView(
//             //   children: snapshot.data!.docs.map((doc) {
//             //     return Card(
//             //       child: ListTile(
//             //         title: Text(doc.data()!['title']),
//             //       ),
//             //     );
//             //   }).toList(),
//             // );
//                           return const LinearProgressIndicator();
//                         }
//                       }),
    
//           ),
//         );
//       }
//     );
//   }
// }