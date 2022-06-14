import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey,
        ),
        border: UnderlineInputBorder(),
        labelText: labelName,
      ),
      onTap: onTap,
      initialValue: data,
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
        Switch(
          onChanged: (val) {
            //   BlocProvider.of<LoginBloc>(context).add(backgroundchanged(0xff9897));
          },
          value: true,
          activeColor: Colors.blue,
          activeTrackColor: Colors.black,
          inactiveThumbColor: Colors.redAccent,
          inactiveTrackColor: Colors.orange,
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
