import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:temancurhat/shared/styles/styles.dart';
import 'package:temancurhat/shared/widgets/widgets.dart';

class Register2Screen extends StatefulWidget {
  @override
  _Register2ScreenState createState() => _Register2ScreenState();
}

class _Register2ScreenState extends State<Register2Screen> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _nomorTelponController = TextEditingController();
  final _tanggalLahirController = TextEditingController();
  final _asalKotaController = TextEditingController();
  final _jenisKelaminController = TextEditingController();

  bool _isSetuju = false;

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
    _nomorTelponController?.dispose();
    _tanggalLahirController?.dispose();
    _asalKotaController?.dispose();
    _jenisKelaminController?.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: Center(
                    child: TextWidget(
                      text: "Tak kenal\nmaka tak sayang",
                      textAlign: TextAlign.center,
                      fontSize: 25.0,
                      color: MyColors.titleBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 42),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: FormBuilder(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        InputTextWidget(
                          name: "nomor_telpon",
                          controller: _nomorTelponController,
                          hintText: "Nomor Telpon",
                          iconData: Icons.phone,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 20),
                        InputTextWidget(
                          name: "tanggal_lahir",
                          controller: _tanggalLahirController,
                          hintText: "Tanggal Lahir",
                          iconData: Icons.calendar_today,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 20),
                        InputTextWidget(
                          name: "asal_kota",
                          controller: _asalKotaController,
                          hintText: "Asal Kota",
                          iconData: Icons.location_on,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 20),
                        InputTextWidget(
                          name: "jenis_kelamin",
                          controller: _jenisKelaminController,
                          hintText: "Jenis Kelamin",
                          iconData: Icons.face,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSetuju = !_isSetuju;
                          });
                        },
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: _isSetuju ? MyColors.blue : Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xc000000),
                                offset: Offset(0, -5),
                                blurRadius: 30,
                              ),
                            ],
                          ),
                          child: _isSetuju
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 24,
                                )
                              : Container(),
                        ),
                      ),
                      SizedBox(width: 10),
                      TextWidget(
                        text: 'Saya mengisi data dengan benar.',
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 84, top: 14),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Saya setuju ',
                              style: TextStyle(color: MyColors.grey),
                            ),
                            TextSpan(
                              text: 'kebijakkan privasi\n',
                              style: TextStyle(
                                color: MyColors.grey,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 84),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'dan ',
                              style: TextStyle(color: MyColors.grey),
                            ),
                            TextSpan(
                              text: 'syarat dan ketentuan.',
                              style: TextStyle(
                                color: MyColors.grey,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
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
                          text: "Register",
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
