import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List listToSearch=[
    {
      'name': 'Amir',
      'class': 12
    },
    {
      'name': 'Raza',
      'class': 11
    },
    {
      'name': 'Praksh',
      'class': 10
    },
    {
      'name': 'Nikhil',
      'class': 9
    },
    {
      'name': 'Sandeep',
      'class': 8
    },
    {
      'name': 'Tazeem',
      'class': 7
    },
    {
      'name': 'Najaf',
      'class': 6
    },
    {
      'name': 'Izhar',
      'class': 5
    },
  ];

  var selected;
  late List selectedList;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20,),
              Text('Menu Mode',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomSearchableDropDown(
                  dropdownHintText: 'Search For Name Here... ',
                  showLabelInMenu: true,
                  initialValue: [
                    {
                      'parameter': 'name',
                      'value': 'Amir',
                    }
                  ],
                  dropdownItemStyle: TextStyle(
                      color: Colors.red
                  ),
                  primaryColor: Colors.red,
                  menuMode: true,
                  labelStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold
                  ),
                  items: listToSearch,
                  label: 'Select Name',
                  prefixIcon:  Icon(Icons.search),
                  dropDownMenuItems: listToSearch?.map((item) {
                    return item['name'];
                  })?.toList() ??
                      [],
                  onChanged: (value){
                    if(value!=null)
                    {
                      selected = value['class'].toString();
                    }
                    else{
                      selected=null;
                    }
                  },
                ),
              ),
              SizedBox(height: 20,),
              Text('Select a value',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomSearchableDropDown(
                  items: listToSearch,
                  label: 'Select Name',
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.blue
                      )
                  ),
                  prefixIcon:  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Icon(Icons.search),
                  ),
                  dropDownMenuItems: listToSearch?.map((item) {
                    return item['name'];
                  })?.toList() ??
                      [],
                  onChanged: (value){
                    if(value!=null)
                    {
                      selected = value['class'].toString();
                    }
                    else{
                      selected=null;
                    }
                  },
                ),
              ),
              Text('Multi Select',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomSearchableDropDown(
                  items: listToSearch,

                  label: 'Select Name',
                  multiSelectTag: 'Names',
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.blue
                      )
                  ),
                  multiSelect: true,
                  prefixIcon:  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Icon(Icons.search),
                  ),
                  dropDownMenuItems: listToSearch?.map((item) {
                    return item['name'];
                  })?.toList() ??
                      [],
                  onChanged: (value){
                    if(value!=null)
                    {
                      selectedList = jsonDecode(value);
                    }
                    else{
                      selectedList.clear();
                    }
                  },
                ),
              ),
              Text('Multi Select as Widget',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomSearchableDropDown(
                  initialValue: [
                    {
                      'parameter': 'name',
                      'value': 'Amir',
                    },
                    {
                      'parameter': 'name',
                      'value': 'Tazeem',
                    },
                  ],
                  items: listToSearch,
                  label: 'Select Name',
                  multiSelectTag: 'Names',
                  multiSelectValuesAsWidget: true,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.blue
                      )
                  ),
                  multiSelect: true,
                  prefixIcon:  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Icon(Icons.search),
                  ),
                  dropDownMenuItems: listToSearch?.map((item) {
                    return item['name'];
                  })?.toList() ??
                      [],
                  onChanged: (value){
                    print(value.toString());
                    if(value!=null)
                    {
                      selectedList = jsonDecode(value);
                    }
                    else{
                      selectedList.clear();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
