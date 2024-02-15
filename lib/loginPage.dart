import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mocsmunchv2/components/loginButton.dart';
import 'package:mocsmunchv2/components/loginTextField.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {

    //show loading circle
    showDialog(context: context, builder: (context) {
      return const Center(child: CircularProgressIndicator()
      );
    }
  );

    //try sign in
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text,
      );

      //pop the loading circle
      Navigator.pop(context);
     } on FirebaseAuthException catch (e) {

      //pop the loading circle
      Navigator.pop(context);

      //Show Error Message
      showErrorMessage(e.code);
     }
  }

  //Error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(message,
          style: const TextStyle(color: Colors.white)
          ,),
        ),
        );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 38, 71, 1.0),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
            
                // logo at the top
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100, // Specify the desired width
                      height: 100, // Specify the desired height
                      child: Image.asset('lib/assets/MocsMunchLogo.png'),
                    ),
                  ],
                ),


            
                const SizedBox(height: 50),
            
                // welcome back, you've been missed!
                const Text(
                  'Mocs Munch v0.0.1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
            
                const SizedBox(height: 25),
            
                // Email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
            
                const SizedBox(height: 10),
            
                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
            
                const SizedBox(height: 10),
            
                // forgot password?
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(height: 25),
            
                // sign in button
                MyButton(
                  text: "Sign in!",
                  onTap: signUserIn,
                ),
            
                const SizedBox(height: 50),
            
                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.white,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(height: 50),
            
                const SizedBox(height: 50),
            
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Tap here to',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
