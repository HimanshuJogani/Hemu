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
  List<Product> productList=[];
  @override
  Widget build(BuildContext context) {
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
            if(state is CheckState){
              print(state.val);
              productList.add(state.val);
              print('product List :::: ${productList}');
            }
            return SingleChildScrollView(
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
                ),
                CommanTextField(
                  title: 'Village',
                  hintTxt: 'Village',
                  controller: villageController,
                ),
                DatePicker(controller : dateController),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {
                    print('name:::${nameController.text}');
                    print('village:::${villageController.text}');
                    print('date::${dateController.text}');
                    context.read<BillCubit>().billSwitchToggle();
                  },
                  child: const Text('Submit'),
                ),
              ],
            ));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
             final dynamic res=await Navigator.pushNamed(context, RoutesName.products);

            // .then((value) => {
            //   print('then call'),
            //
            //   print('res :: ${(value as Map)['product']}'),
             context.read<BillCubit>().check(res['product']);
            //
            //  });
            print('Product:::${productList}');
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
      builder: (context) {
        return AlertDialog(
          title: const Text('Add custom bill no'),
          content: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: TextFormField(
              onChanged: (value) {},
              controller: _name,
              decoration: InputDecoration(hintText: "Bill No"),
              validator: (name) {},
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20)),
              onPressed: () {},
              child: const Text('Add'),
            ),
          ],
        );
      });
}
