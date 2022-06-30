import 'dart:math';

import 'package:apicallingusingttd/characterapicalling/data/model/character_model.dart';
import 'package:apicallingusingttd/characterapicalling/presentation/bloc/character_cubit.dart';
import 'package:apicallingusingttd/characterapicalling/presentation/bloc/character_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<CharacterModel> CharacterList = [];
  final TextEditingController _name = TextEditingController();
  var items = ['ID', 'Category', 'Random', 'Name'];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])),
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.black45,
              centerTitle: true,
              title: BlocBuilder<CharacterCubit, CharacterState>(
                  builder: (context, state) {
                if (state is serchActive) {
                  index = state.num;
                }
                if (index == 1 || index == 2 || index == 4) {
                  return TextField(
                    controller: _name,
                    decoration: const InputDecoration(
                      labelText: 'Enter Character',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    onChanged: (val) {
                      if (index == 1) {
                        context
                            .read<CharacterCubit>()
                            .getCharacterById(int.parse(val));
                      } else if (index == 2) {
                        context.read<CharacterCubit>().getSpecificCategory(val);
                      } else if (index == 4) {
                        context
                            .read<CharacterCubit>()
                            .getSpecificCharacterByName(val);
                      }
                    },
                  );
                } else {
                  return Text('Character'.toUpperCase());
                }
              }),
              bottom: TabBar(
                indicatorColor: Colors.orange,
                onTap: (val) {
                  context.read<CharacterCubit>().serch(val);
                  if (val == 0) {
                    context.read<CharacterCubit>().getAllCharacterDataFromApi();
                  } else if (val == 3) {
                    context.read<CharacterCubit>().getCharacterRandomData();
                  }
                },
                tabs: [
                  const Tab(
                    child: Text(
                      'All',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Tab(
                    child: Text(
                      items[0],
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  Tab(
                    child: Text(
                      items[1],
                      style: const TextStyle(fontSize: 11),
                    ),
                  ),
                  Tab(
                    child: Text(
                      items[2],
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  Tab(
                    child: Text(
                      items[3],
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<CharacterCubit, CharacterState>(
                builder: (context, state) {
                  if (state is CharacterSuccess) {
                    CharacterList = state.characterModel;
                    return ListView.builder(
                        itemCount: CharacterList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 150,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image(
                                                image: NetworkImage(
                                                    CharacterList[index].img!),
                                                height: 150,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    CharacterList[index].name!,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                  Text(
                                                    CharacterList[index]
                                                        .portrayed!,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey),
                                                  ),
                                                  const SizedBox(height: 3),
                                                  Text(
                                                    CharacterList[index]
                                                        .nickname!,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  ),
                                                  const SizedBox(height: 3),
                                                  Text(
                                                    CharacterList[index]
                                                        .occupation![0],
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  ),
                                                  const SizedBox(height: 6),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        CharacterList[index]
                                                                .birthday ??
                                                            "Not Found",
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color: Colors
                                                                .lightGreen),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        CharacterList[index]
                                                            .status!,
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      const Spacer(),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  RatingBar.builder(
                                                    initialRating: 3,
                                                    itemCount: 5,
                                                    itemBuilder:
                                                        (context, index) {
                                                      switch (index) {
                                                        case 0:
                                                          return const Icon(
                                                            Icons
                                                                .sentiment_very_dissatisfied,
                                                            color: Colors.red,
                                                          );
                                                        case 1:
                                                          return const Icon(
                                                            Icons
                                                                .sentiment_dissatisfied,
                                                            color: Colors
                                                                .redAccent,
                                                          );
                                                        case 2:
                                                          return const Icon(
                                                            Icons
                                                                .sentiment_neutral,
                                                            color: Colors.amber,
                                                          );
                                                        case 3:
                                                          return const Icon(
                                                            Icons
                                                                .sentiment_satisfied,
                                                            color: Colors
                                                                .lightGreen,
                                                          );
                                                        case 4:
                                                          return const Icon(
                                                            Icons
                                                                .sentiment_very_satisfied,
                                                            color: Colors.green,
                                                          );
                                                        default:
                                                          return const SizedBox();
                                                      }
                                                    },
                                                    onRatingUpdate:
                                                        (double value) {},
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ));
                  }
                },
              ),
            )),
      ),
    );
  }
}
