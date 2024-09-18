import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/widget/textfield%20auth%20widget/text_field_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();

  bool loading = false;

  void forgotPassword() {
    setState(() {
      loading = true;
    });
    AuthController().forgotPassword(email.text).then((value) {
      if (value != null) {
        setState(() {
          loading = false;
        });
        AwesomeDialog(
          context: context,
          title: "Succes",
          desc: "Please Check Email!",
          dialogType: DialogType.success,
          btnOkOnPress: () => Navigator.pushNamedAndRemoveUntil(
              context, "/login", (route) => false),
        ).show();
      } else {
        setState(() {
          loading = false;
        });
        AwesomeDialog(
          context: context,
          title: "Failed",
          desc: "",
          dialogType: DialogType.error,
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
              controller: email,
              text: 'Your Email',
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.yellow),
                ),
                onPressed: () => forgotPassword(),
                child: loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Forgot Password',
                        style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
