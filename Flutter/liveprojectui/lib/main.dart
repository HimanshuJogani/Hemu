import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
         Expanded(
           flex: 3,
          child: Container(
            width: double.infinity,
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text("Edit Profile & Settings",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration:  BoxDecoration(
                        border: Border.all(width: 1,color: Colors.black),
                        shape:  BoxShape.circle,
                        image: DecorationImage(fit: BoxFit.cover, image: NetworkImage('https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425_960_720.png'))
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration:  BoxDecoration(
                              border: Border.all(width: 4,color: Colors.white),
                              shape:  BoxShape.circle,
                            color: Colors.amber
                          ),
                          child: Icon(Icons.edit,color:  Colors.white,),
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
          Expanded(
            flex: 7,
              child: Column(
                children: [
                  FromField(labelname: 'First Name'),
                  FromField(labelname: 'Last Name'),
                  FromField(labelname: 'Email'),
                  FromField(labelname: 'Password'),
                  FromField(labelname: 'Day End Time'),
                ],
              )
            )
       ]
      ),
    );
  }
}

class FromField extends StatelessWidget {
   FromField({
    Key? key, required this.labelname,
  }) : super(key: key);

  final String labelname;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:  InputDecoration(
        border: UnderlineInputBorder(),
        labelText: labelname,
      ),
    );
  }
}

