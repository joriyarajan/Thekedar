import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:thekedar/controllers/register_controller.dart';

class Register extends StatelessWidget {
  final RegisterController _con = Get.put(RegisterController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _con.update();
      _con.userRegister();
    } else {
      _con.autoValidate = true;
      _con.update();
    }
  }
  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (controller) => Scaffold(
          backgroundColor: Color(0xfff5f6fa),
          body: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: SafeArea(child: _register()))),
    );
  }
  Widget _register(){
      return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/img/logo.png'))),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Sign Up", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Create New Account", style: TextStyle(fontSize: 17, color: Color(0xff8A8A8A)),),
              ),
              Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    child: Text("Username", style: TextStyle(color: Color(0xff8A8A8A), fontSize: 17),),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    onChanged: (String? value) {
                                      _con.username = value!;
                                      _con.update();
                                    },
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: Colors.green,
                                    autovalidateMode: _con.autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                                    validator: (String? arg){
                                      if(arg == ""){
                                        return "Username should not be blank.";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "Username",
                                        hintStyle: TextStyle(color: Color(0xff7D7D7D)),
                                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 1), borderRadius: BorderRadius.all(Radius.circular(10))),
                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 1), borderRadius: BorderRadius.all(Radius.circular(10))),
                                        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1), borderRadius: BorderRadius.all(Radius.circular(10))),
                                        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1), borderRadius: BorderRadius.all(Radius.circular(10)))
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    child: Text("New Password", style: TextStyle(color: Color(0xff8A8A8A), fontSize: 17),),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    onChanged: (String? value) {
                                      _con.new_password = value!;
                                      _con.update();
                                    },
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: Colors.green,
                                    autovalidateMode: _con.autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                                    validator: (String? arg){
                                      if(arg == ""){
                                        return "New password should not be blank.";
                                      }else{
                                        if(arg!.length < 6){
                                          return "New password should be atleast 6 characters long.";
                                        }
                                      }
                                    },
                                    decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "New Password",
                                        hintStyle: TextStyle(color: Color(0xff7D7D7D)),
                                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 1), borderRadius: BorderRadius.all(Radius.circular(10))),
                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 1), borderRadius: BorderRadius.all(Radius.circular(10))),
                                        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1), borderRadius: BorderRadius.all(Radius.circular(10))),
                                        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1), borderRadius: BorderRadius.all(Radius.circular(10)))
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    child: Text("Confirm Password", style: TextStyle(color: Color(0xff8A8A8A), fontSize: 17),),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    onChanged: (String? value) {
                                      _con.confirm_password = value!;
                                      _con.update();
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                    cursorColor: Colors.green,
                                    autovalidateMode: _con.autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                                    validator: (String? arg){
                                      if(arg == ""){
                                        return "Confirm password should not be blank.";
                                      }else{
                                        if(_con.new_password != _con.confirm_password){
                                          return "Confirm password should match with new password.";
                                        }
                                      }
                                    },
                                    obscureText: true,
                                    onFieldSubmitted: (String? value){
                                      _validateInputs();
                                    },
                                    decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "Confirm Password",
                                        hintStyle: TextStyle(color: Color(0xff7D7D7D)),
                                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 1), borderRadius: BorderRadius.all(Radius.circular(10))),
                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 1), borderRadius: BorderRadius.all(Radius.circular(10))),
                                        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1), borderRadius: BorderRadius.all(Radius.circular(10))),
                                        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1), borderRadius: BorderRadius.all(Radius.circular(10)))
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          child: TextButton(onPressed: (){
                            _validateInputs();
                          }, child: (_con.isLoading) ? SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(color: Colors.white)
                          ) : Text("Register", style: TextStyle(color: Colors.white, fontSize: 20),),
                        )
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?", style: TextStyle(fontSize: 17, color: Color(0xff8A8A8A)),),
                            GestureDetector(
                              child: Text(" Login Here", style: TextStyle(fontSize: 17, color: Colors.green)),
                              onTap: (){
                                Get.offAndToNamed('/');
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      );
  }
}
