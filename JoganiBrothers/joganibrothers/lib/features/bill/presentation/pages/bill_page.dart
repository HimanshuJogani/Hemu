import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joganibrothers/core/navigation/route_info.dart';
import 'package:joganibrothers/core/theme/text_styles.dart';
import 'package:joganibrothers/features/bill/presentation/cubit/bill_cubit.dart';
import 'package:joganibrothers/features/bill/presentation/cubit/bill_state.dart';
import 'package:joganibrothers/utils/comman/comman_date_picker.dart';
import '../../../../utils/comman/comman_textfield.dart';
import '../../../products/data/models/product_model.dart';

class BillPage extends StatelessWidget {
  BillPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  int count = 0;
  List<Product> productList = [];

  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bill'),
        ),
        body: BlocBuilder<BillCubit, BillState>(
          builder: (context, state) {
            if (state is BillSuccess) {
              count = state.val;
            }
            if (state is CheckState) {
              productList.add(state.val);
            }
            return SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              const Text(
                                'Bill No:',
                                style: AppTextStyles.labelStyle,
                              ),
                              const SizedBox(width: 5),
                              Text("$count", style: AppTextStyles.labelStyle),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(
                                  Icons.edit_note,
                                ),
                                iconSize: 40,
                                onPressed: () {
                                  _displayTextInputDialog(context);
                                },
                              ),
                            ],
                          ),
                        ),
                        CommanTextField(
                          title: 'Name',
                          hintTxt: 'Name',
                          controller: nameController,
                          textType: TextInputType.text,
                          callback: (String? val) {
                            if(val == null || val!.isEmpty){
                              return "Please Enter Name";
                            }
                            return null;
                          },
                        ),
                        CommanTextField(
                          title: 'Village',
                          hintTxt: 'Village',
                          controller: villageController,
                          textType: TextInputType.text,
                          callback: (String? val) {
                            if(val == null || val!.isEmpty){
                              return "Please Enter Village name";
                            }
                            return null;
                          },
                        ),
                        DatePicker(controller: dateController),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: productList.length,
                            itemBuilder: (_, int index) {
                              return Card(
                                  elevation: 10,
                                  shadowColor: Colors.black,
                                  child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'BrandName:',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            SizedBox(),
                                            Text(
                                                '${productList[index].brandname}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 18)),
                                          ]),
                                    ),
                                    Expanded(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Price:',
                                                style: TextStyle(fontSize: 10)),
                                            SizedBox(),
                                            Text('${productList[index].price}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 18))
                                          ]),
                                    ),
                                    Expanded(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Text('weight:',
                                              style: TextStyle(fontSize: 10)),
                                          SizedBox(),
                                          Text('${productList[index].weight}',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontSize: 18))
                                        ])),
                                  ],
                                ),
                              ));
                            }),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //context.read<BillCubit>().billSwitchToggle();
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    )));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final dynamic res =
                await Navigator.pushNamed(context, RoutesName.products);
            context.read<BillCubit>().check(res['product']);
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

  Future<void> _displayTextInputDialog(BuildContext context) async {
    final TextEditingController _name = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return showDialog(
        context: context,
        builder: (context1) {
          return AlertDialog(
            title: const Text('Add custom bill no'),
            content: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: TextFormField(
                onChanged: (value) {},
                controller: _name,
                keyboardType:TextInputType.number,
                decoration: InputDecoration(hintText: "Bill No"),
                validator: (name) {},
              ),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                  print(int.parse(_name.text));
                  context.read<BillCubit>().billSwitchToggle(int.parse(_name.text));
                  Navigator.of(context, rootNavigator: true).pop('_displayTextInputDialog');
                },
                child: const Text('Add'),
              ),
            ],
          );
        });
  }


