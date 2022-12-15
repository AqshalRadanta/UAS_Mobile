import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prak_mobile/login_page.dart';
import 'package:prak_mobile/view/Home.dart';

class RegisterPage extends StatefulWidget {
  Function setTheme;
  final String? user;
  RegisterPage({Key? key, required this.setTheme, required this.user}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool isShowPasswordError = false;
  bool _isHidden = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(
              24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                title(),
                SizedBox(
                  height: 48,
                ),
                usernameTextField(),
                emailInput(),
                passwordInput(),
                
                SizedBox(
                  height: 56,
                ),
                RegisterButton(),
                LoginrButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lets Create your\naccount',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 87,
                height: 4,
                margin: EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black,
                ),
              ),
              Container(
                width: 8,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget usernameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 56,
          margin: EdgeInsets.only(
            top: 32,
          ),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget emailInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 56,
          margin: EdgeInsets.only(
            top: 32,
          ),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

 

 Widget passwordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 32,
          ),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.visibility_outlined,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        if (isShowPasswordError)
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              'Password kamu salah',
              style: TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }

  Widget RegisterButton() {
    return Container(
      height: 56,
      width: double.infinity,
      margin: EdgeInsets.only(top: 32),
      child: TextButton(
        onPressed: () {
          setState(() {
            isLoading = true;
          });
          Future.delayed(
            Duration(seconds: 2),
            () {
              setState(() {
                isLoading = false;
              });
              register(usernameController.text, emailController.text, passwordController.text, context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(setTheme: widget.setTheme),));
            },
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.grey.shade300,
              )
            : Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }



void register (String nama, email, password, BuildContext context)async{
  try {
      var response = await Dio().post('http://localhost:3000/user',
          data: {"username": nama, "email": email, "password": password});
      if (response.statusCode == 201) {
        print("akun berhasil dibuat");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MyHomePage(setTheme: widget.setTheme, user: "username"),
          ),
        );
      }
    } catch (e) {
      print(e);

      }
  }


  Container LoginrButton() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have account ?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextButton(
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(setTheme: widget.setTheme),
                ),
              );
            },
          ),
        ],
      ),
    );
  }


  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

