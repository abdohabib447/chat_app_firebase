import 'package:chat_app/widgets/customButton.dart';
import 'package:chat_app/widgets/customCircle.dart';
import 'package:chat_app/widgets/customTextField.dart';
import 'package:chat_app/Models/show_snack_bar.dart';
import 'package:chat_app/Models/constant_data.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'login_view_model.dart';

class LoginView extends StatelessWidget {
  static String routeName = 'LoginScreen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, child) {
          return ModalProgressHUD(
            inAsyncCall: viewModel.isLoading,
            child: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomCircle(),
                          Text(
                            textAlign: TextAlign.center,
                            'Login',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          SizedBox(height: 28,),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 0),
                            child: CustomTextField(
                              onChanged: viewModel.setEmail,
                              hint: 'Email',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: CustomTextField(
                              onChanged: viewModel.setPassword,
                              hint: 'Password',
                            ),
                          ),
                          SizedBox(height: 15),
                          CustomButton(
                            text: 'Login',
                            onTap: () async {
                              final success = await viewModel.loginUser();
                              if (success) {
                                Navigator.pushNamed(
                                  context,
                                  'ChatScreen',
                                  arguments: viewModel.email,
                                );
                              } else {
                                showSnackBar(context, viewModel.errorMessage);
                              }
                            },
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, 'RegisterScreen'),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          SizedBox(
                            height: 70,
                            width: width(context),
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Positioned(
                                  bottom: -40,
                                  child: Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff1F1F1F),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
