import 'package:flutter/material.dart';
import 'package:todo/controller/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordvisible = false;
  bool? rememberPass = false;

  @override
  void initState() {
    super.initState();
    passwordvisible = true;
  }

  @override
  Widget build(BuildContext context) {
    Auth authController = Auth();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
              child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Sign In",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "E-mail",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: passwordvisible,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        suffixIcon: IconButton(
                          icon: Icon(passwordvisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                passwordvisible = !passwordvisible;
                              },
                            );
                          },
                        ),
                        hintText: "Enter Password",
                        border: InputBorder.none,
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: rememberPass,
                            onChanged: (newVal) {
                              setState(() {
                                this.rememberPass = newVal;
                              });
                            }),
                        Text(
                          "Remember Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 45,
                        ),
                        InkWell(
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          authController.login(context, emailController.text,
                              passwordController.text);
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(horizontal: 150)),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.blue)))
                  ]),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
