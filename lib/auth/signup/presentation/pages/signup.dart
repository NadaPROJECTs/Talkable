import 'package:flutter/material.dart';
import 'package:savvyflos/auth/signup/presentation/manager/sign_up_view_model_cubit.dart';
import 'package:savvyflos/core/DI/di.dart';
import 'package:savvyflos/core/cashe/prefs_handler.dart';
import 'package:savvyflos/core/utils/routes_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvyflos/core/utils/strings_manager.dart';


class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController userTypeController;
  late TextEditingController passwordController;



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    userTypeController.dispose();
    passwordController.dispose();
  }
  @override
  void initState() {
    super.initState();
    nameController=TextEditingController();
    phoneController=TextEditingController();
    addressController=TextEditingController();
    userTypeController=TextEditingController();
    passwordController=TextEditingController();
  }
  @override Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) =>getIt.get<SignUpViewModelCubit>(),
  child: Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Center( child: Padding( padding: const EdgeInsets.all(16.0),
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( 'TalkAble', style: TextStyle( fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF003C43), fontFamily: 'Raleway', ), ),
            SizedBox(height: 40),
            _buildTextField('Full Name', 'enter your full name',nameController),
            SizedBox(height: 20),
            _buildTextField('Phone Number', 'enter your phone no.',phoneController),
            SizedBox(height: 20),
            _buildTextField('Address', 'enter your address',addressController),
            SizedBox(height: 20),
            _buildTextField('User Type', 'user or admin',userTypeController),
            SizedBox(height: 20),
            _buildPasswordField('Password', 'enter your password',passwordController),
            SizedBox(height: 20),

            BlocConsumer<SignUpViewModelCubit, SignUpViewModelState>( listener: (context, state){
                    if(state is SuccessState){
                      StringsManager.showToast("account created successfully");
                      PrefsHandler.saveToken(state.entity.token!);
                      Navigator.pushReplacementNamed(context, RoutesManager.login);
                    }
                    if(state is ErrorState){
                      StringsManager.showToast(state.error);
                    }
            },
  builder: (context, state) {
    return ElevatedButton(
              onPressed: () {
                print("ashraf 3===> ${phoneController.text}");
                //Navigator.of(context).pushReplacementNamed(RoutesManager.login);
                BlocProvider.of<SignUpViewModelCubit>(context).signUp
                  (name: nameController.text,
                    phone_number: phoneController.text,
                    address: addressController.text,
                    password: passwordController.text,
                    user_type: userTypeController.text);

                print("ashraf 11===> ${nameController.text}");
                print("ashraf 12===> ${phoneController.text}");
                print("ashraf 13===> ${addressController.text}");
                print("ashraf 14===> ${userTypeController.text}");


              },
              style: ElevatedButton.styleFrom( primary: Colors.white, onPrimary: Color(0xFF003C43),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8), ), ),
              child: Text( 'Sign up', style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold, ), ), );
  },
), ], ), ),
      ),
  ),
); }

               Widget _buildTextField(String label, String placeholder,TextEditingController controller) {
                 final TextEditingController? controller;

                 return Column( crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text( label, style: TextStyle( color:Color(0xFF003C43), fontSize: 16, fontWeight: FontWeight.bold, ), ),
                     SizedBox(height: 8),
                     TextField( decoration: InputDecoration( filled: true, fillColor: Color(0xFF003C43), hintText: placeholder , hintStyle: TextStyle(color: Color(0xFFFFFFFF)),
                       border: OutlineInputBorder( borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none, ),
                       contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), ), ), ], ); }

               Widget _buildPasswordField(String label, String placeholder,TextEditingController controller) {
                 final TextEditingController? controller;

                 return Column( crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text( label, style: TextStyle( color: Color(0xFF003C43), fontSize: 16, fontWeight: FontWeight.bold, ), ),
                       SizedBox(height: 8),
                       TextField( obscureText: true,
                         decoration: InputDecoration( filled: true, fillColor: Color(0xFF003C43), hintText: placeholder,hintStyle: TextStyle(color: Color(0xFFFFFFFF)),
                           border: OutlineInputBorder( borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none, ),
                           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                     suffixIcon: Icon(Icons.visibility_off, color: Colors.grey), ), ), ], ); } }