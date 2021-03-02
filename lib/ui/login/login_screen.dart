import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:temancurhat/data/repository/app_repository.dart';
import 'package:temancurhat/shared/styles/styles.dart';
import 'package:temancurhat/shared/widgets/widgets.dart';
import 'package:temancurhat/ui/beranda/beranda_screen.dart';
import 'package:temancurhat/ui/beranda/bloc/beranda_bloc.dart';
import 'package:temancurhat/ui/lupa_password/lupa_password_screen.dart';
import 'package:temancurhat/ui/register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.all(30.0),
            color: MyColors.bgBlueGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 218,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                TextWidget(
                  text: "Teman Curhat ID\n#YourHappinessSystem",
                  textAlign: TextAlign.center,
                  fontSize: 25.0,
                  color: MyColors.titleBlue,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    InputTextWidget(
                      name: "email",
                      controller: _emailController,
                      hintText: "Email",
                      iconData: Icons.email,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 20),
                    InputTextWidget(
                      name: "password",
                      controller: _passwordController,
                      hintText: "Password",
                      iconData: Icons.lock,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LupaPasswordScreen(),
                        ),
                      );
                    },
                    child: TextWidget(text: "Lupa?", fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: RaisedButton(
                    color: MyColors.buttonBlue,
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 63,
                      child: Center(
                        child: TextWidget(
                          text: "Login",
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) {
                              return BerandaBloc(repository: AppRepository());
                            },
                            child: BerandaScreen(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                  },
                  child: TextWidget(text: "Register", fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
