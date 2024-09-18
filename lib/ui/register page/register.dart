import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/widget/textfield%20auth%20widget/text_field_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isObsecure = true;

  TextEditingController name = TextEditingController(),
      email = TextEditingController(),
      password = TextEditingController(),
      konfirmasiPassword = TextEditingController();

  bool loading = false;

  saveRegis() {
    setState(() {
      loading = true;
    });
    AuthController()
        .registerProses(
            name.text, email.text, password.text, konfirmasiPassword.text)
        .then((value) {
      if (value != null) {
        setState(() {
          loading = false;
        });
        AwesomeDialog(
          context: context,
          title: "${value.message}",
          desc: "Register Berhasil as ${email.text}",
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
          desc: "Register Gagal",
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
                  controller: name,
                  text: 'nama',
                ),
                const SizedBox(height: 25),
                TextFieldWidget(
                  controller: email,
                  text: 'Email',
                ),
                const SizedBox(height: 25),
                TextFieldWidget(
                  controller: password,
                  text: 'password',
                  obscureText: isObsecure,
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
                ),
                const SizedBox(height: 25),
                TextFieldWidget(
                  controller: konfirmasiPassword,
                  text: 'Konfirmasi Password',
                  obscureText: true,
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
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false),
                  child: const Text(
                    'Back To Login',
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
                  onPressed: () => saveRegis(),
                  child: loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
