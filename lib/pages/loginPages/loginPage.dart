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

    /*show loading circle
    showDialog(context: context, builder: (context) {
      return const Center(child: CircularProgressIndicator()
      );
    }
  ); */

    //try sign in
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text,
      );

      //pop the loading circle
      Navigator.pop(context);
     } on FirebaseAuthException {


      //Show Error Message
      showErrorMessage("Incorrect Email or Password was entered");
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
                    SizedBox(
                      width: 100, // Specify the desired width
                      height: 100, // Specify the desired height
                      child: Image.asset('lib/assets/images/MocsMunchLogo.png'),
                    ),
                  ],
                ),


            
                const SizedBox(height: 50),
            
                // welcome back, you've been missed!
                const Text(
                  'Mocs Munch v1.0.0',
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
                  text: "Login",
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
                const SizedBox(height: 40),
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Container(
                        padding: const EdgeInsets.all(10), // Add padding around the text
                        decoration: BoxDecoration(
                          color: Colors.black, // Set background color to black
                          borderRadius: BorderRadius.circular(8), // Optional: Add border radius
                        ),
                        child: const Text(
                          'Create a New Account',
                          style: TextStyle(
                            color: Colors.white, // Set text color to white
                            fontWeight: FontWeight.normal,
                          ),
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
