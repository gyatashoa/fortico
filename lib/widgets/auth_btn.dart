import 'package:flutter/material.dart';

class AuthBtn extends StatefulWidget {
  const AuthBtn({Key? key, required this.text,required this.onTap}) : super(key: key);
  final Future Function() onTap;
  final String text;

  @override
  State<AuthBtn> createState() => _AuthBtnState();
}

class _AuthBtnState extends State<AuthBtn> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          onPressed: isLoading
              ? () {}
              : () async {
                  setState(() {
                    isLoading = true;
                  });
                  await widget.onTap();
                  setState(() {
                    isLoading = false;
                  });
                },
          style: TextButton.styleFrom(
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  widget.text,
                  style: const TextStyle(color: Colors.white),
                )),
    );
  }
}
