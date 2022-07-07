import 'package:flutter/material.dart';

class FromField extends StatelessWidget {
  FromField(
      {Key? key,
      required this.labelName,
      required this.onTap,
      required this.data,
      this.wantIcon = true})
      : super(key: key);

  final String labelName;
  final VoidCallback onTap;
  final String data;
  final bool wantIcon;

  final TextEditingController myData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    myData.text = data;
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      labelName,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      data,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

class SwitchField extends StatelessWidget {
  const SwitchField(
      {Key? key,
      required this.text,
      required this.value,
      required this.onChanged})
      : super(key: key);

  final String text;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          Switch(
            onChanged: onChanged,
            value: value,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: Colors.blue,
          )
        ],
      ),
    );
  }
}

class EndingField extends StatelessWidget {
  const EndingField(
      {Key? key, required this.txt, required this.onPressed, this.style})
      : super(key: key);

  final String txt;
  final VoidCallback? onPressed;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              txt,
              style: TextStyle(fontSize: 16, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
