import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/widget/textfield%20auth%20widget/text_field_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isObsecure = true;

  TextEditingController email = TextEditingController(),
      password = TextEditingController();

  bool loading = false;

  // isLogin() async {
  //   final prefs = await SharedPreferences.getInstance();

  // }

  saveLogin() {
    setState(() {
      loading = true;
    });
    AuthController().loginProses(email.text, password.text).then((value) {
      if (value != null) {
        setState(() {
          loading = false;
        });
        AwesomeDialog(
          context: context,
          title: "Succes",
          desc: "Login as ${email.text}",
          dialogType: DialogType.success,
          btnOkOnPress: () =>
              Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false),
        ).show();
      } else {
        setState(() {
          loading = false;
        });
        AwesomeDialog(
          context: context,
          title: "Failed",
          desc: "Login Gagal",
          dialogType: DialogType.error,
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: lebar,
            child: Column(
              children: [
                SizedBox(
                  height: tinggi * 0.2,
                  child: Image.asset(
                    'assets/img/traver.png',
                    width: 200,
                  ),
                ),
                TextFieldWidget(
                  controller: email,
                  text: 'Email',
                ),
                const SizedBox(height: 25),
                TextFieldWidget(
                  controller: password,
                  text: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObsecure = !isObsecure;
                      });
                    },
                    icon: isObsecure
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  obscureText: isObsecure,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        const Text('Remember Me')
                      ],
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/forgot-password'),
                      child: const Text('Forgot Password'),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(lebar * 10, 60)),
                    shape: const MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/register'),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.yellow),
                    minimumSize: MaterialStatePropertyAll(Size(lebar * 10, 60)),
                    shape: const MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  onPressed: () => saveLogin(),
                  child: loading
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.grey.shade200,
                      child: Image.asset('assets/img/ig.png', height: 100),
                    ),
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.grey.shade200,
                      child: Image.asset('assets/img/google.png', height: 100),
                    ),
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.grey.shade200,
                      child: Image.asset('assets/img/fb.png', height: 100),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
