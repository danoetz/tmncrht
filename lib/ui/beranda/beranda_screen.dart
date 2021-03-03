import 'package:flutter/cupertino.dart';
import 'package:temancurhat/data/models/agent.dart';
import 'package:temancurhat/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:temancurhat/data/api/api_constant.dart';
import 'package:temancurhat/data/models/movies.dart';
import 'package:temancurhat/shared/styles/styles.dart';
import 'package:temancurhat/ui/agent/agent_screen.dart';
import 'package:temancurhat/ui/beranda/bloc/beranda_bloc.dart';

class PostItem {
  const PostItem({this.title, this.deskripsi});
  final String title;
  final String deskripsi;
}

class BerandaScreen extends StatefulWidget {
  @override
  _BerandaScreenState createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  bool _isLoading = false;
  bool _isMovieEmpty = true;

  List<Movies> listMovies;
  List<PostItem> listPost = [
    PostItem(
        title: "Berhenti Merokok", deskripsi: "Kamu sangat menyayangi dirimu"),
    PostItem(
        title: "Berhenti Alkohol",
        deskripsi: "Hidup lebih cerah dengan kesadaran penuh"),
    PostItem(
        title: "Berhenti Pornografi",
        deskripsi: "Pikiran lebih jernih dan fokus pada tujuan"),
  ];

  List<Widget> _smiley = [
    SmileyWidget(
      assetPath: 'assets/emojis/love.png',
      onTap: () {},
    ),
    SmileyWidget(
      assetPath: 'assets/emojis/laugh.png',
      onTap: () {},
    ),
    SmileyWidget(
      assetPath: 'assets/emojis/smile.png',
      onTap: () {},
    ),
    SmileyWidget(
      assetPath: 'assets/emojis/curious.png',
      onTap: () {},
    ),
    SmileyWidget(
      assetPath: 'assets/emojis/sad.png',
      onTap: () {},
    ),
    SmileyWidget(
      assetPath: 'assets/emojis/cry.png',
      onTap: () {},
    ),
    SmileyWidget(
      assetPath: 'assets/emojis/angry.png',
      onTap: () {},
    ),
  ];

  List<Agent> listAgent = [
    Agent(
      title: 'Good Listener Agent',
      imageUrl: 'assets/agen/01.png',
    ),
    Agent(
      title: 'Certified Coach',
      imageUrl: 'assets/agen/02.png',
    ),
    Agent(
      title: 'Professional Psychologist',
      imageUrl: 'assets/agen/01.png',
    ),
    Agent(
      title: 'Financial Coach',
      imageUrl: 'assets/agen/02.png',
    ),
    Agent(
      title: 'Law Consultant',
      imageUrl: 'assets/agen/01.png',
    ),
    Agent(
      title: 'Personal Menthor',
      imageUrl: 'assets/agen/02.png',
    ),
    Agent(
      title: 'Professional Hypnoterapist',
      imageUrl: 'assets/agen/01.png',
    ),
    Agent(
      title: 'Ustadz Ustadzah',
      imageUrl: 'assets/agen/02.png',
    ),
    Agent(
      title: 'Komnas Perempuan',
      imageUrl: 'assets/agen/01.png',
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<BerandaBloc>(context)..add(LoadNowPlaying());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.bgBlueGrey,
      body: BlocListener<BerandaBloc, BerandaState>(
        listener: (context, state) {
          if (state is MoviesHasData) {
            setState(() {
              _isLoading = false;
              _isMovieEmpty = false;
              listMovies = state.movieResult.results;
            });
          }
          if (state is MoviesNoData) {
            setState(() {
              _isLoading = false;
              _isMovieEmpty = true;
            });
          }
          if (state is MoviesLoading) {
            setState(() {
              _isLoading = true;
            });
          }
          if (state is MoviesNetworkError) {
            setState(() {
              _isLoading = false;
              _isMovieEmpty = true;
            });
          }
        },
        child: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 400,
                  child: Stack(
                    children: [
                      createClippedWidget(width, height),
                      Positioned(
                        top: 200,
                        child: Container(
                          height: 200,
                          width: width,
                          child: _isLoading
                              ? Center(
                                  child: Container(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      )),
                                )
                              : new Swiper(
                                  scrollDirection: Axis.horizontal,
                                  viewportFraction: 1.0,
                                  scale: 0.9,
                                  itemWidth: 300.0,
                                  itemHeight: 200.0,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Center(
                                        child: Container(
                                          width: width,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            child: _isMovieEmpty
                                                ? Container(
                                                    width: 300,
                                                    height: 200,
                                                    color: MyColors.white,
                                                    child: Icon(
                                                      Icons.image,
                                                      size: 50,
                                                      color: MyColors.blue,
                                                    ))
                                                : Image.network(
                                                    ApiConstant.imageUrl +
                                                        listMovies[index]
                                                            .posterPath,
                                                    fit: BoxFit.fill,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: _isMovieEmpty ? 1 : 10),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(text: "Saldo Anda"),
                              TextWidget(
                                text: "Rp. 165.000,-",
                                color: MyColors.titleBlue,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          RaisedButton(
                            color: MyColors.buttonBlue,
                            elevation: 7,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              height: 42,
                              child: Center(
                                child: TextWidget(
                                  text: "Top Up",
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                  child: TextWidget(
                    text: "Pilih teman curhat yang\npaling pas untukmu",
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: MyColors.titleBlue,
                    textAlign: TextAlign.center,
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
                    children: listAgent.map((i) {
                      return AgenWidget(
                        image: Image.asset(i.imageUrl),
                        tipeAgen: i.title,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AgentScreen(
                                dummy: listMovies[0],
                                agent: i,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: TextWidget(
                    text: "Lakukan perubahan diri\nyang lebih baik",
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: MyColors.titleBlue,
                    textAlign: TextAlign.center,
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: CardPost(
                        title: listPost[index].title,
                        deskripsi: listPost[index].deskripsi,
                      ),
                    );
                  },
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createClippedWidget(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipPath(
          clipper: ArcClipper(),
          child: Container(
            height: 270,
            width: width,
            color: MyColors.bgBlue,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: width,
                  padding: EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              NetworkImage('https://i.pravatar.cc/400?img=69'),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Hai, Nata!",
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25.0,
                          ),
                          TextWidget(
                            text: "Bagaimana Perasaanmu?",
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 72,
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _smiley),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
