import 'package:flutter/material.dart';

class BudgetPlan extends StatelessWidget {
  const BudgetPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: const [
                  SizedBox(height: 10),
                  Text(
                    "Financial Planing",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(18),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Please add your daily budget',
                  hintStyle: const TextStyle(fontSize: 20, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "SUBMIT",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                side: const BorderSide(
                  width: 2.0,
                  color: Colors.black,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 15.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
