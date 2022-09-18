import 'package:flutter/material.dart';
import '/screens/homepage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // @override
  // void initState() {
  //   Firebase.initializeApp();
  //   super.initState();
  // }

  // final _formkey = GlobalKey<FormState>();
  // TextEditingController _password = TextEditingController();
  // TextEditingController _Email = TextEditingController();

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://www.technologybeam.com/wp-content/uploads/2020/12/New-Project-2020-12-15T101926.704-1200x675.jpg'),
                    fit: BoxFit.cover,
                  )),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      color: Colors.black54,
                      child: Text(
                        'Login Page',
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            color: Colors.white),
                      ),
                    ),
                    left: 30.0,
                    bottom: 20.0,
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.mail),
                        label: Text('Username'),
                        hintText: 'Enter Username',
                      ),
                      // controller: _Email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      obscureText: _isObscure,
                      // controller: _password,
                      decoration: InputDecoration(
                        label: Text('Password'),
                        hintText: 'Enter Password',
                        prefixIcon: Icon(Icons.password_outlined),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              print('Hello');
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                        //   FirebaseAuth.instance
                        //       .signInWithEmailAndPassword(
                        //     email: _Email.text,
                        //     password: _password.text,
                        //   )
                        //       .then((value) {
                        //     Navigator.of(context)
                        //         .push(MaterialPageRoute(
                        //             builder: (context) => HomePage()))
                        //         .onError((error, stackTrace) {
                        //       print('Error ${error.toString()}');
                        //     });
                        //   });
                      },
                      child: Text('SIGN IN'),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Create',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
