import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color mycolor;
  late Size mediaSize;
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    mycolor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: mycolor,
        image: DecorationImage(
          image: const AssetImage('assets/images/bg.jpeg'),
          fit: BoxFit.cover,
          colorFilter: 
          ColorFilter.mode(mycolor.withOpacity(0.2), BlendMode.dstATop),
          ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [ 
              Positioned(top:80, child: _buildTop()),
              Positioned(bottom:0, child: _buildBottom()),
            ]),
          ),
          );
  }
  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.cloud_sharp,
          size: 100,
          color: Colors.white,
          ),
          Text(
            "Cuaca In",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
              letterSpacing: 2)
            ),
        ],
      ),
    );
  }

  Widget _buildBottom(){
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: _buildform(),
          ),
      ),
    );
  }

  Widget _buildform() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Welcome',
       style: TextStyle(
        color: mycolor, 
        fontSize: 32, 
        fontWeight:FontWeight.w500 
        ),
      ),
      _buildGreyText('Please Login With Your Information'),
      const SizedBox( height: 60),
      _buildGreyText("Email Addres"),
      _buildInputField(emailControler),
      const SizedBox(height: 40), 
      _buildGreyText("Password"),
      _buildInputField(passwordController, isPassword: true),
      const SizedBox(height: 20),
      _buildRememberForgot(),
      const SizedBox(height: 20),
      _buildLoginButton(),
      const SizedBox(height: 20),
      _buildOtherLogin(),
    ],
    );
  }

  Widget _buildGreyText(String text){
  return Text(
    text,
    style: const TextStyle(
      color: Colors.grey
    ),
  );
}

  Widget _buildInputField(TextEditingController controller,
{isPassword = false}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      suffixIcon: isPassword?Icon(Icons.remove_red_eye): Icon(Icons.done),
    ),
    obscureText: isPassword,
  );
}

  Widget _buildRememberForgot() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Checkbox(value: rememberUser, onChanged: (value) {
            setState(() {
            rememberUser = value!;
            });
          } ),
          _buildGreyText("Remember me"),
        ],
      ),
      TextButton(
        onPressed: () {}, child: _buildGreyText("I forgot my password"))
    ],
  );
}

  Widget _buildLoginButton() {
  return ElevatedButton(
    onPressed: () {
      debugPrint("Email : ${emailControler.text}");
      debugPrint("Password : ${passwordController.text}");
    },
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
      elevation: 20,
      shadowColor: mycolor,
      minimumSize: const Size.fromHeight(60),
    ),
    child: const Text("LOGIN"),
  );
}

  Widget _buildOtherLogin() {
  return Center(
    child: Column(
      children: [
        _buildGreyText("Or Login With"),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Tab(icon: Image.asset("assets/images/fb.jpeg")),
            Tab(icon: Image.asset("assets/images/x.jpeg")),
            Tab(icon: Image.asset("assets/images/gh.jpeg")),
          ],
        ),
      ],
    ),
  );
  }

}