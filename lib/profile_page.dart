import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  Future<Map<String, dynamic>?> getUserData() async {
    var doc = await FirebaseFirestore.instance.collection('users').doc(user?.uid).get();
    return doc.data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: getUserData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var userData = snapshot.data!;
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  initialValue: userData['firstName'],
                  decoration: InputDecoration(labelText: 'First Name'),
                ),
                TextFormField(
                  initialValue: userData['lastName'],
                  decoration: InputDecoration(labelText: 'Last Name'),
                ),
                TextFormField(
                  initialValue: userData['email'],
                  decoration: InputDecoration(labelText: 'Email'),
                  readOnly: true, // Email is non-editable
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement update logic
                  },
                  child: Text('Update Profile'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
