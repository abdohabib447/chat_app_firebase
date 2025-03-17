import 'package:chat_app/Screens/register/rigister_view_model.dart';
import 'package:chat_app/widgets/customButton.dart';
import 'package:chat_app/widgets/customCircle.dart';
import 'package:chat_app/widgets/customTextField.dart';
import 'package:chat_app/Models/show_snack_bar.dart';
import 'package:chat_app/Models/constant_data.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  static String routeName = 'RegisterScreen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
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
                            'Sign Up',
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
                              textType: TextInputType.emailAddress,
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
                            text: 'Sign Up',
                            onTap: () async {
                              final success = await viewModel.registerUser();
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
                                "Already have an account? ",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Text(
                                  "Sign In",
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
                                      color: primaryColor.withOpacity(0.7),
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
