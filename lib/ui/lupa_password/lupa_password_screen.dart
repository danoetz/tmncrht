import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:temancurhat/shared/styles/styles.dart';
import 'package:temancurhat/shared/widgets/widgets.dart';
import 'package:temancurhat/ui/register/register_screen.dart';

class LupaPasswordScreen extends StatefulWidget {
  @override
  _LupaPasswordScreenState createState() => _LupaPasswordScreenState();
}

class _LupaPasswordScreenState extends State<LupaPasswordScreen> {
  final _form2Key = GlobalKey<FormBuilderState>();

  final _emailController = TextEditingController();

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Login'),
//      ),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(30.0),
          color: MyColors.bgBlueGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                text: "Yuk pulihkan\npasswordmu!",
                fontSize: 25.0,
                color: MyColors.titleBlue,
                fontWeight: FontWeight.bold,
              ),
              TextWidget(
                text:
                    "Masukkan alamat emailmu,\ndan kami akan mengirimkan link\nreset password.",
                color: MyColors.grey,
                textAlign: TextAlign.center,
              ),
              FormBuilder(
                key: _form2Key,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: [
                    InputTextWidget(
                      name: "email",
                      controller: _emailController,
                      hintText: "Email",
                      iconData: Icons.email,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: RaisedButton(
                  color: MyColors.buttonBlue,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    width: width,
                    height: 63,
                    child: Center(
                      child: TextWidget(
                        text: "Kirim",
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: TextWidget(text: "Login", fontSize: 16.0),
                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
