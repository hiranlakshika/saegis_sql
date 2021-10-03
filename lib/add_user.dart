import 'package:flutter/material.dart';
import 'package:saegis_sql/db_helper.dart';
import 'package:saegis_sql/models/user.dart';

class AddUser extends StatelessWidget {
  final TextEditingController _id = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _age = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  AddUser({Key? key}) : super(key: key);

  Future<void> _showDialog(BuildContext context, String name) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('User Name'),
            content: Text(name),
            actions: [
              TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'This field cannot be null' : null,
                  controller: _id,
                  decoration: const InputDecoration(labelText: 'ID'),
                ),
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'This field cannot be null' : null,
                  controller: _title,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'This field cannot be null' : null,
                  controller: _name,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  controller: _address,
                  decoration: const InputDecoration(labelText: 'Address'),
                ),
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'This field cannot be null' : null,
                  controller: _age,
                  decoration: const InputDecoration(labelText: 'Age'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var user = User(
                        id: _id.text,
                        title: _title.text,
                        name: _name.text,
                        age: double.parse(_age.text),
                        address: _address.text,
                      );
                      await DatabaseHelper().insert(DatabaseHelper.tableUser, user);
                    }
                  },
                  child: const Text('Add User'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    User selectedUser = await DatabaseHelper().selectByColumn(DatabaseHelper.tableUser, 'id', '2');
                    _showDialog(context, selectedUser.name);
                  },
                  child: const Text('Select User'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var user = User(
                        id: _id.text,
                        title: _title.text,
                        name: _name.text,
                        age: double.parse(_age.text),
                        address: _address.text,
                      );
                      await DatabaseHelper().update(DatabaseHelper.tableUser, user);
                    }
                  },
                  child: const Text('Update User'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await DatabaseHelper().delete(DatabaseHelper.tableUser, '1');
                  },
                  child: const Text('Delete User'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
