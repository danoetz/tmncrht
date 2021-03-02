import 'package:flutter/cupertino.dart';
import 'package:temancurhat/data/models/agent.dart';
import 'package:temancurhat/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:temancurhat/data/models/movies.dart';
import 'package:temancurhat/shared/styles/styles.dart';

class AgentScreen extends StatefulWidget {
  final Movies dummy;
  final Agent agent;

  const AgentScreen({Key key, this.dummy, this.agent}) : super(key: key);

  @override
  _AgentScreenState createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen> {
  final _searchController = TextEditingController();

  Movies dummyAgent;
  Agent agent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dummyAgent = widget.dummy;
    agent = widget.agent;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            //            title: Text('SliverAppBar'),
            backgroundColor: MyColors.bgYellow,
            expandedHeight: 400.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextWidget(
                      text: agent.title,
                      color: MyColors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 300,
                    child: Image.asset(
                      'assets/images/foto_agent.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 150.0,
            delegate: SliverChildListDelegate(
              [
                Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(height: 75, color: MyColors.bgYellow),
                        Container(height: 75, color: MyColors.bgBlueGrey),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: width - 60,
                        height: 150,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Card(
                          elevation: 0,
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Center(
                              child: Text(
                                'G.L.A adalah agent terlatih yang siap menjadi pendegar yang baik untukmu. Sudah terverifikasi dan patuh terhadap kode etik, sehingga aman dan nyaman curhat ke mereka.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.4,
                                  letterSpacing: 0.5,
                                  color: MyColors.darkGrey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: MyColors.bgBlueGrey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          color: MyColors.green,
                          size: 14,
                        ),
                        SizedBox(width: 10),
                        TextWidget(
                          text: '165 agent online',
                          color: MyColors.darkGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  RaisedButton(
                    color: MyColors.buttonBlue,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      width: 240,
                      height: 63,
                      child: Center(
                        child: TextWidget(
                          text: "Curhat Sekarang",
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                  Container(
                    width: width,
                    height: 140,
                    padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 14,
                          left: 20,
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.chevron_left),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Swiper(
                            scrollDirection: Axis.horizontal,
                            viewportFraction: 1.0,
                            scale: 0.9,
                            itemWidth: width,
                            itemHeight: 140,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                width: width,
                                height: height,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '“Lega rasanya bisa curhat ke para Good Listener Agent. Ceritaku ditanggapi dengan baik tanpa dihakimi, dan tanpa digurui.”',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                        color: MyColors.darkGrey,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '-Dhea, 19th',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                        color: MyColors.darkGrey,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          top: 14,
                          right: 20,
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.chevron_right),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: TextWidget(
                      text: "Pilih ${agent.title}\nkeasyanganmu",
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      color: MyColors.titleBlue,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: InputTextWidget(
                      name: 'search',
                      iconData: Icons.search,
                      hintText: 'Cari ${agent.title}',
                      controller: _searchController,
                    ),
                  ),
                  Container(
                    width: width,
                    height: 540,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3 / 4,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 75,
                                width: 75,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://i.pravatar.cc/400?img=28'),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(text: 'Anissa'),
                                  SizedBox(width: 5),
                                  Image.asset(
                                    'assets/images/verified_user.png',
                                    width: 15,
                                    height: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 75,
                                width: 75,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://i.pravatar.cc/400?img=40'),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
