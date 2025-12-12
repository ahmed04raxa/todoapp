import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/repository/screen/crud/add_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ALL USERS DATA")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(child: Text("${index + 1}")),
                    title: Text(snapshot.data!.docs[index]['firstName']),
                    subtitle: Text(snapshot.data!.docs[index]['lastName']),
                    trailing: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Edit"), Text("Delete")],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.hasError.toString()));
            } else {
              return Text("No Data Found");
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Color(0XFF515DEF),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddData()),
          );
        },
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
