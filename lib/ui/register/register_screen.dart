import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:temancurhat/shared/styles/styles.dart';
import 'package:temancurhat/shared/widgets/widgets.dart';
import 'package:temancurhat/ui/register/register2_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _namaDepanController = TextEditingController();
  final _namaBelakangController = TextEditingController();
  final _emailController = TextEditingController();
  final _konfirmasiEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _konfirmasiPasswordController = TextEditingController();

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
    _namaDepanController?.dispose();
    _namaBelakangController?.dispose();
    _emailController?.dispose();
    _konfirmasiEmailController?.dispose();
    _passwordController?.dispose();
    _konfirmasiPasswordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
//          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          color: MyColors.bgBlueGrey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 36,
                      width: 57,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xc000000),
                            offset: Offset(0, -5),
                            blurRadius: 30,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.chevron_left,
                        color: MyColors.blue,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: TextWidget(
                    text: "Kami sangat antusias\ningin mengenalmu",
                    textAlign: TextAlign.center,
                    fontSize: 25.0,
                    color: MyColors.titleBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: FormBuilder(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        InputTextWidget(
                          name: "nama_depan",
                          controller: _namaDepanController,
                          hintText: "Nama Depan",
                          iconData: Icons.account_circle,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 20),
                        InputTextWidget(
                          name: "nama_belakang",
                          controller: _namaBelakangController,
                          hintText: "Nama Belakang",
                          iconData: Icons.account_circle,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 20),
                        InputTextWidget(
                          name: "email",
                          controller: _emailController,
                          hintText: "Email",
                          iconData: Icons.email,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 20),
                        InputTextWidget(
                          name: "konfirmasi_email",
                          controller: _konfirmasiEmailController,
                          hintText: "Konfirmasi Email",
                          iconData: Icons.email,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 20),
                        InputTextWidget(
                          name: "password",
                          controller: _passwordController,
                          hintText: "Password",
                          iconData: Icons.lock,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 20),
                        InputTextWidget(
                          name: "konfirmasi_password",
                          controller: _konfirmasiPasswordController,
                          hintText: "Konfirmasi Password",
                          iconData: Icons.lock,
                          textInputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: RaisedButton(
                    color: MyColors.buttonBlue,
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      width: width,
                      height: 63,
                      child: Center(
                        child: TextWidget(
                          text: "Lanjut",
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
                          builder: (context) => Register2Screen(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: RaisedButton(
                    color: MyColors.google,
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      width: width,
                      height: 42,
                      child: Center(
                        child: TextWidget(
                          text: "Daftar via Google",
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: RaisedButton(
                    color: MyColors.facebook,
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      width: width,
                      height: 42,
                      child: Center(
                        child: TextWidget(
                          text: "Daftar via Facebook",
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
