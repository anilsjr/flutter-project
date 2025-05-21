import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color.fromARGB(255, 243, 242, 241),
      ),
      home: const MyHomePage(),
      // home: const LogInPage(title: ''),
      // home: const CallbackFunctionPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Widgets"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          ElevatedButton(
            onPressed:
                () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CallbackFunctionPage(),
                  ),
                ),
            child: Text("Callback Function Page"),
          ),
          ElevatedButton(
            onPressed:
                () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LogInPage(title: '')),
                ),
            child: Text("Login Page"),
          ),
        ],
      ),
    );
  }
}

// Callback function page
/*
to add vibration haptic on button press
to create 3d effect on button press

*/
class CallbackFunctionPage extends StatefulWidget {
  const CallbackFunctionPage({super.key});

  @override
  State<CallbackFunctionPage> createState() => _CallbackFunctionPageState();
}

class _CallbackFunctionPageState extends State<CallbackFunctionPage> {
  double elevationValue = 0.0;
  String buttonText = "Click Me";
  Color buttonColor = const Color.fromARGB(255, 0, 200, 255);

  callBack() {
    print("Callback function called");
    setState(() {
      elevationValue = 20.0;
      buttonText = "Clicked";
      buttonColor = const Color.fromARGB(255, 0, 255, 0);
    });
  }

  reset() {
    print("Reset function called");
    setState(() {
      elevationValue = 0.0;
      buttonText = "Click Me";
      buttonColor = const Color.fromARGB(255, 0, 200, 255);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: const Color.fromARGB(255, 0, 0, 0),
                elevation: elevationValue,
                backgroundColor: buttonColor,
              ),
              child: Text(
                buttonText,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),

              onPressed: callBack,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: const Color.fromARGB(255, 173, 85, 85),
                elevation: 5,
                backgroundColor: const Color.fromARGB(255, 0, 200, 255),
              ),
              child: Text(
                "Reset",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),

              onPressed: reset,
            ),
          ],
        ),
      ),
    );
  }
}

// login page

class LogInPage extends StatefulWidget {
  final String title;
  const LogInPage({super.key, required this.title});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  var emailText = TextEditingController();
  var passText = TextEditingController();
  bool _obscurePassword = true; //  add this to toggle visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Log In page')),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserTextFieldWidget(controller: emailText),

              ContainerWidget(),

              PasswordTextFieldWidget(controller: passText),

              ContainerWidget(),

              LoginButtonWidget(emailText: emailText, passText: passText),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.1,
      child: Container(
        // width: 100,
        height: 10,
        color: Colors.red,
        // child: const Center(child: Text("Container")),
      ),
    );
  }
}

class UserTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  const UserTextFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabled: true,
        hintText: "Username",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.deepOrange, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 2),
        ),
        suffixText: "ok",
        suffixIcon: IconButton(
          icon: const Icon(Icons.check_circle, color: Colors.grey),
          onPressed: () {},
        ),
        prefixIcon: const Icon(Icons.person),
      ),
    );
  }
}

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  const PasswordTextFieldWidget({super.key, required this.controller});

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscurePassword,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
      ),
    );
  }
}

class LoginButtonWidget extends StatelessWidget {
  final TextEditingController emailText;
  final TextEditingController passText;
  const LoginButtonWidget({
    super.key,
    required this.emailText,
    required this.passText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String uEmail = emailText.text.trim();
        String uPass = passText.text;
        print("Email : $uEmail, Pass: $uPass");
      },
      child: Text("Login"),
    );
  }
}
