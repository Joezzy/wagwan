
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wagwan/controller/login.controller.dart';
import 'package:wagwan/custom/btn.dart';
import 'package:wagwan/custom/txt.dart';
import 'package:wagwan/helper/dialogs.dart';
import 'package:wagwan/helper/validator.dart';
import 'package:wagwan/main.dart';
import 'package:wagwan/screens/auth/login_screen.dart';


//login screen -- implements google sign in or sign up feature for app
class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final authController=Get.put(AuthController());
  bool _isAnimate = true;

  @override
  void initState() {
    super.initState();
    // initMethod();
    //for auto triggsering animation
  }

  initMethod(){
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => _isAnimate = true);
    });
  }



  _handleGoogleBtnClick() {
    Dialogs.showProgressBar(context);



    // _signInWithGoogle().then((user) async {
    //   //for hiding progress bar
    //   Navigator.pop(context);
    //
    //   if (user != null) {
    //     log('\nUser: ${user.user}');
    //     log('\nUserAdditionalInfo: ${user.additionalUserInfo}');
    //     if ((await APIs.userExists())) {
    //       Navigator.pushReplacement(
    //           context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    //     } else {
    //       await APIs.createUser().then((value) {
    //         Navigator.pushReplacement(
    //             context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    //       });
    //     }
    //   }
    // });

  }


  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return GetX<AuthController>(
        builder: ( authController) {
          return Scaffold(
            body: SingleChildScrollView(child: buildForm(authController, context)),
          );
        }
    );
  }


  Form buildForm(AuthController authController, BuildContext context) {
    return Form(
      key: authController.registerKey.value,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50,),
            const  Text("Join us on",style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                fontSize:14 ),),
            const  Text("Wagwan",style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize:45 )),

            const SizedBox(height: 60,),

            MyText(
              hintText: "Email",
              controller: authController.emailController.value,
              validator: Validator.requiredValidator,
            ),
            const SizedBox(height: 20),
            MyText(
              hintText: "Password",
              controller: authController.passwordController.value,
              validator: Validator.requiredValidator,
            ),
            const SizedBox(height: 20),
            MyText(
              hintText: "Username",
              controller: authController.usernameController.value,
              validator: Validator.requiredValidator,
            ),

            const SizedBox(height: 20),
            MyButton(
              title: "Sign in",
              onTap:() {
                if(authController.registerKey.value.currentState!.validate()){
                  authController.register(context);
                }
              } ,
            ),

            const SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) =>  LoginView()));
              },
              child: Center(
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(text: "Already have an account? " ),
                        TextSpan(
                            text: 'Sign in',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ]),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

}

