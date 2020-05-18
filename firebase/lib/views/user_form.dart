import 'package:firebase/models/user.dart';
import 'package:firebase/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;
  final Map<String, String> formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      formData['id'] = user.id;
      formData['name'] = user.name;
      formData['email'] = user.email;
      formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final user = ModalRoute.of(context).settings.arguments as User;
    _loadFormData(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de usuários'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              bool isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();

                setState(() {
                  _isLoading = true;
                });

                await Provider.of<Users>(context, listen: false).put(User(
                  id: formData['id'],
                  name: formData['name'],
                  email: formData['email'],
                  avatarUrl: formData['avatarUrl'],
                ));

                setState(() {
                  _isLoading = false;
                });

                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(15),
              child: Form(
                key: _form,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      initialValue: formData['name'],
                      decoration: InputDecoration(labelText: 'Nome'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Nome inválido';
                        }

                        if (value.trim().length < 3) {
                          return 'O nome digitado é extremamente pequeno. \nÉ necessário que sejam informados no mínimo 3 letras';
                        }

                        return null;
                      },
                      onSaved: (value) => formData['name'] = value,
                    ),
                    TextFormField(
                      initialValue: formData['email'],
                      decoration: InputDecoration(labelText: 'Email'),
                      onSaved: (value) => formData['email'] = value,
                    ),
                    TextFormField(
                      initialValue: formData['avatarUrl'],
                      decoration: InputDecoration(labelText: 'Url do Avatar'),
                      onSaved: (value) => formData['avatarUrl'] = value,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
