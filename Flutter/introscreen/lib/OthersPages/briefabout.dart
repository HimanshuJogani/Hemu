import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Brief about',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text(
                            '60 STRONG',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text(
                              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shape: const CircleBorder(),
                                        side: const BorderSide(
                                            color: Colors.black)),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: const Icon(
                                        Icons.navigate_next,
                                        size: 25.0,
                                        color: Colors.black,
                                      ),
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      side: const BorderSide(color: Colors.black)),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: const Text(
                      'START NOW',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ))
            ],
          ),
        ));
  }
}
