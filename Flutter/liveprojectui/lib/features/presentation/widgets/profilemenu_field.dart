import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/switch_cubit/switch_cubit.dart';
import '../cubit/switch_cubit/switch_state.dart';

class FromField extends StatelessWidget {
  FromField({
    Key? key,
    required this.labelName,
    required this.onTap,
    required this.data,
  }) : super(key: key);

  final String labelName;
  final VoidCallback onTap;
  final String data;

  TextEditingController mydata = TextEditingController();
  @override
  Widget build(BuildContext context) {
    mydata.text = data;
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.grey,
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38)),
          labelText: labelName,
          labelStyle: TextStyle(color: Colors.black54)),
      onTap: onTap,
      controller: mydata,
    );
  }
}

class SwitchField extends StatelessWidget {
  const SwitchField({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        BlocBuilder<SwitchCubit, SwitchState>(
          builder: (context, state) {
            return Switch(
              onChanged: (val) {
                BlocProvider.of<SwitchCubit>(context).toggleSwitch(val);
              },
              value: (state is SwitchTrue) ? true : false,
            );
          },
        )
      ],
    );
  }
}

class EndingField extends StatelessWidget {
  const EndingField({
    Key? key,
    required this.txt,
  }) : super(key: key);

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            txt,
            style: TextStyle(fontSize: 20),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
