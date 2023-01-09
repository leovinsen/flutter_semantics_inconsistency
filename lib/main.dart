import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  /// For context, the Semantics tree of the 3 widgets below are consistent
  /// on both Android and iOS. However, when converted into
  /// their Android and iOS counterparts they are not consistent.
  ///
  /// The most glaring issue is, when we wrap a Widget in a [Semantics],
  /// the value of [Semantics.label] is not used as the parent Widget's
  /// label or accessibility ID. Instead, a new Text widget is created
  /// as a sibling to the child widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Semantics(
              label: 'ButtonID',
              child: const ElevatedButton(
                onPressed: null,
                child: Text('Disabled button'),
              ),
            ),
            Semantics(
              label: 'CheckboxID',
              child: const CheckboxListTile(
                value: true,
                onChanged: null,
                title: Text('Checkbox'),
              ),
            ),
            Semantics(
              label: 'TextFieldID',
              child: TextFormField(
                initialValue: 'Lorem ipsum dolor sit amet',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
