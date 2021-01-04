
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white,),
        title: Text(
          '登录',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 80),
              accountEdit(),
              SizedBox(height: 30),
              passwordEdit(),
              SizedBox(height: 100),
              loginButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget accountEdit() {
    return TextFormField(
      controller: _controller.accountTextController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        filled: true,
        hintText: '账号',
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.normal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
      ),
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
      validator: (value) =>
      value.trim().isEmpty ? '请输入账号' : null,
    );
  }

  Widget passwordEdit() {
    return TextFormField(
      controller: _controller.passwordTextController,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        filled: true,
        hintText: '输入密码',
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.normal
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0
          ),
        )
      ),
      validator: (v) => v.trim().isEmpty ? '请输入密码' : null,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.normal
      ),
    );
  }

  Widget loginButton() {
    return MaterialButton(
      color: Colors.blue,
      splashColor: Colors.white,
      height: 45,
      minWidth: Get.width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '登录',
        style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),
      ),
      onPressed: () {
        _controller.login();
      },
    );
  }
}