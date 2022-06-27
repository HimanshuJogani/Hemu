import 'package:flutter/material.dart';

class AddCollectionPopUp extends StatelessWidget {
  const AddCollectionPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Alert Dialog'),
          onPressed: () {
            _showDialog(context);
          },
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "コレクションを作成".toUpperCase(),
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF202223)),
          textAlign: TextAlign.center,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'コレクション名',
              style: TextStyle(fontSize: 12, color: Color(0xFF72787B)),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Collection 21.12.24',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF202223))),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '50 文字まで記入可能',
              style: TextStyle(fontSize: 12, color: Color(0xFF000000)),
            ),
          ],
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    debugPrint('Cancel');
                  },
                  child: const Text(
                    'キャンセル',
                    style: TextStyle(
                      color: Color(0xFF202223),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
              const SizedBox(width: 8),
              ElevatedButton(
                child: const Text("作成する"),
                style:
                    ElevatedButton.styleFrom(primary: const Color(0xFF5C9DB9)),
                onPressed: () {
                  debugPrint('Submit');
                },
              ),
            ],
          )
        ],
      );
    },
  );
}
