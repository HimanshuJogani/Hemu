import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class GooglePlacesApiScreen extends StatefulWidget {
  GooglePlacesApiScreen({Key? key}) : super(key: key);

  @override
  State<GooglePlacesApiScreen> createState() => _GooglePlacesApiScreenState();
}

class _GooglePlacesApiScreenState extends State<GooglePlacesApiScreen> {
  final TextEditingController mapcontroller = TextEditingController();

  var uuid = Uuid();
  String sessionToken = '122344';

  @override
  void initState() {
    super.initState();

    mapcontroller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (sessionToken == null) {
      setState(() {
        sessionToken = uuid.v4();
      });
    }
    getSuggesion(mapcontroller.text);
  }

  void getSuggesion(String input) async {
    String KPLACES_API_KEY = "AIzaSyDbEilehd2rVJUqlxUKXBrClnmIuMTYziY";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Search Places Api'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: TextFormField(
            controller: mapcontroller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search Places with name"),
          ),
        ),
      ),
    );
  }
}
