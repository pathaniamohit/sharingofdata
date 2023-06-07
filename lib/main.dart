import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
      '/': (context) => HomePage(),
      '/SecondPage': (context) => SecondHome(),
    },
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            User user = new User(name: 'Adi', age: 22);
            Navigator.pushNamed(context, '/SecondPage', arguments: user);
          },
          child: Text('Second Home'),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  User? user;
  @override
  Widget build(BuildContext context) {
    RouteSettings? settings = ModalRoute.of(context)?.settings;
    user = settings?.arguments as User?;

    return Scaffold(
      appBar: AppBar(
        title: Text('${this.user?.name} - ${this.user?.age}'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back to First'),
        ),
      ),
    );
  }
}

class User {
  String? name;
  int? age;
  User({ this.name, this.age});
}