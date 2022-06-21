import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datatable_sortable_example/page/sortable_page.dart' as global;
import 'package:datatable_sortable_example/page/sortable_page.dart';
import 'package:datatable_sortable_example/widget/tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../firebase_options.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

String webs = " ";
String notwebs = "APP";

class MyApp extends StatelessWidget {
  static final String title = kIsWeb ? webs : notwebs;

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initFire();
    lerDados();
  }

  void lerDados() async {
    var a = await FirebaseFirestore.instance.collection("Teste").doc("1").get();
    webs = a["titulo"];
    print(webs);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: MyApp.title,
        tabs: [
          Tab(icon: Icon(Icons.sort_by_alpha), text: webs),
          // Tab(icon: Icon(Icons.select_all), text: 'Selectable'),
          // Tab(icon: Icon(Icons.edit), text: 'Editable'),
        ],
        children: [
          Container(
              padding: EdgeInsets.all(12),
              color: validateColorContainer(),
              child: SortablePage()),
          // Container(),
          // Container(),
        ],
      );
}

validateColorContainer() {
  if (global.colorRowNotOk == Colors.red) {
    return Colors.red;
  } else {
    return Colors.white;
  }
}

void initFire() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
