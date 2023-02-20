import 'package:android_tv/aux/video_player.dart';
import 'package:android_tv/model/movie.dart';
import 'package:android_tv/view/details_movie.dart';
import 'package:android_tv/view/login.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage(this.nomeUsuario);
  final String nomeUsuario;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _actionMovieCards = [];
  List<Widget> _bollywoodMovieCards = [];

  final GlobalKey _listKey = GlobalKey();
  late List<Movie> _actionMovies;
  late List<Movie> _bollywoodMovies;
  late List<Movie> _dcComics;
  int  indexSelected1 = -1;
  int  indexSelected2 = -1;
  int  indexSelected3 = -1;

  String description = "";

  double widthTemp = 200;
  double heighTemp = 200;

  void addMovies() {
     _actionMovies = [
       Movie(
         title: 'Iron Man',
         image: 'https://cdn.britannica.com/49/182849-050-4C7FE34F/scene-Iron-Man.jpg',
         url: 'https://www.youtube.com/watch?v=8ugaeA-nMTc',
         description: "Tony Stark is a billionaire industrialist and brilliant inventor who conducts military tests abroad, but is kidnapped by terrorists who force him to build a devastating weapon. Instead, he builds armored armor and faces his captors. Upon returning to the US, Stark improves the armor and uses it to fight crime."
       ),
       Movie(
         title: 'Avatar The Last Airbender',
         image: 'https://s2.glbimg.com/n59RnoDvaFaexFUJiy6yAgtIMaY=/0x0:1200x700/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2022/y/R/1kKCcuRJyqIbEVAkdRzw/avatar-o-caminho-da-agua-2.jpg',
         url: 'https://www.youtube.com/watch?v=V-0GkangoHM',
         description: "On the lush alien world of Pandora live the Na'vi, beings that appear primitive but are highly evolved. As the planet's environment is toxic, avatars were created, biological bodies controlled by the human mind that move freely on Pandora. Jake Sully, a paralyzed former Marine, walks again through an avatar and falls in love with a Na'vi. This passion drives Jake to fight for Pandora's survival."
       ),
      Movie(
          title: 'Dracula',
          image: 'https://wallpaperaccess.com/full/1923020.jpg',
          url: 'https://www.youtube.com/watch?v=_2aWqecTTuE',
        description: "Young English lawyer Jonathan Harker takes a job in a gloomy village in the mists of Transylvania, Romania. He is captured and imprisoned by the vampire Dracula, who travels to London inspired by a photograph of Harker's fiancée, Mina Murray. In Britain, Dracula begins a reign of seduction and horror, draining the life of Mina's closest friend, Lucy Westenra. Lucy's friends join forces with Professor Abraham Van Helsing to try to fend off Dracula once and for all."
      ),
      Movie(
          title: 'The Maze Runner',
          image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQczM9W4ScNshPLjZLLRFbNvxzBL7vXOLjTxXZvp2OZE3ri3w2JsNjdpNV5erKRNfTyDzc&usqp=CAU',
          url: 'https://www.youtube.com/watch?v=AwwbhhjQ9Xk',
        description: "In a post-apocalyptic world, young Thomas is abandoned in a community made up of boys after his memory is erased. Soon he finds himself trapped in a labyrinth, where he will have to join forces with other young people so that he can escape."
      ),
      Movie(
          title: '300',
          image: 'https://wallpapercave.com/wp/wp2162772.jpg',
          url: 'https://www.youtube.com/watch?v=UrIbxk7idYA',
        description: "In 480 BC, there is a war between Persia, led by King Xerxes, and Greece. In the battle of Thermopylae, Leonidas, king of the Greek city of Sparta, leads his warriors out of favor against the massive Persian army. Even knowing that certain death awaits them, their sacrifices inspire all of Greece to unite against their common enemy."

      ),
      Movie(
          title: 'Venom',
          image:
          'https://i.ytimg.com/vi/OKD8To6OGis/maxresdefault.jpg',
          url: 'https://www.youtube.com/watch?v=u9Mv98Gr5pY',
      description: "Journalist Eddie Brock develops superhuman strength and power when his body merges with the alien Venom. Overcome with rage, Venom tries to control Eddie's dangerous new abilities."
      ),
      Movie(
          title: 'Pirates Of the Caribbean',
          image: 'https://cdn.wallpapersafari.com/45/66/q2rdlZ.jpg',
          url: 'https://www.youtube.com/watch?v=Hgeu5rhoxxY',
        description: "Pirate Jack Sparrow has his ship looted and stolen by Captain Barbossa and his crew. With Sparrow's ship, Barbossa invades the city of Port Royal, taking Elizabeth Swann, the governor's daughter, with him. To recover his vessel, Sparrow receives the help of Will Turner, a great friend of Elizabeth. They brave the seas towards the mysterious Island of Death, trying to stop the skeleton pirates from spilling Elizabeth's blood to undo the curse that plagues them."

      )
    ];
     _bollywoodMovies = [
     Movie(
         title: 'Pain and Gain',
         image: 'https://popkultur.de/wp-content/uploads/2013/08/painugain.jpg',
         url: 'https://www.youtube.com/watch?v=X4orHp2y2ZQ',
      description: "In 1990s Miami, a gym manager and his beefy accomplices kidnap a wealthy businessman and force him to hand over all of his assets, including cars and a luxury mansion, to them."
     ),

       Movie(
          title: 'Shaandar',
          image:
          'https://www.whoa.in/download/shaandaar-bollywood-movies-hd-poster',
          url: 'https://www.youtube.com/watch?v=k99-vMPh3-A',
          description: "A businessman's daughter is forced to marry a wealthy heir while her adopted sister grows closer to the charismatic wedding planner."
       ),
      Movie(
          title: '2 States',
          image: 'https://wallpaperaccess.com/full/1494461.jpg',
          url: 'https://www.youtube.com/watch?v=CGyAaR2aWcA',
        description: "Os alunos universitários Krish e Ananya esperam ter a aprovação dos pais para se casarem, mas diferenças culturais opõem as duas famílias."
      ),
      Movie(
          title: 'Ishaqzaade',
          image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSwxz8bwLoiW2C81B6IlqvgnK_ViI9-XPvoQ&usqp=CAU',
          url: 'https://www.youtube.com/watch?v=46kTKQ0C2Ek',
        description: "As they battle for political supremacy for their respective families, a Hindu man and a Muslim woman share a forbidden romance."
      ),
      Movie(
          title: 'Kick',
          image:
          'https://images.wallpapersden.com/image/ws-tiger-shroff-and-hrithik-roshan-war-movie_66472.jpg',
          url: 'https://www.youtube.com/watch?v=u-j1nx_HY5o',
        description: "Using his passion for comic books, teenager Dave Lizewski decides to reinvent himself as a superhero, despite his complete lack of special powers. The teen dons a costume, christens himself Kick-Ass n"
            " and starts fighting crime with the help of vigilante friends."
      ),
      Movie(
          title: 'Happy New Year',
          image:
          'https://c4.wallpaperflare.com/wallpaper/194/620/840/movies-bollywood-movies-wallpaper-preview.jpg',
          url: 'https://www.youtube.com/watch?v=JGHwANkQFrg',
        description: "A diamond thief and his gang enter a dance contest to pull off a big score. Anyway, they're not going to get out of this without learning to dance."
      )
    ];

     _dcComics = [
       Movie(
           title: 'Justice League',
           image: 'https://files.meiobit.com/wp-content/uploads/2017/11/20171117img01.jpg',
           url: 'https://www.youtube.com/watch?v=vM-Bja2Gy04',
        description: "Fueled by his restored faith in humanity and inspired by Superman's selfless act, Bruce Wayne enlists his new ally Diana Prince to fight an even greater, newly awakened enemy. Together, Batman and Wonder Woman nimbly seek out and recruit a team of metahumans, but even with the formation of an unprecedented league of heroes, it may be too late to save the planet from a catastrophic attack."
       ),

       Movie(
           title: 'Aquaman',
           image:
           'https://upload.wikimedia.org/wikipedia/pt/7/7d/Aquaman_%282018%29.jpg',
           url: 'https://www.youtube.com/watch?v=zL2BtTdIuLI',
          description: "The city of Atlantis, once home to one of the world's most advanced civilizations, is now a sunken kingdom ruled by the greedy King Orm. With a vast army at his disposal, Orm plans to conquer both the other ocean kingdoms and the surface world. Standing in his way is Aquaman, half-human, half-Atlantean, and true heir to the throne. With the help of Princess Mera, Aquaman must retrieve the legendary Trident of Atlan and accept his destiny as protector of the depths."
       ),
       Movie(
           title: 'Flash',
           image: 'https://i.uai.com.br/bz40Ln_WdbskluEFgzE5G-vuX7A=/1200x900/smart/imgsapp2.uai.com.br/app/noticia_133890394703/2023/01/12/314974/grant-gustin-como-flash_1_62343.jpg',
           url: 'https://www.youtube.com/watch?v=P6DrikrCM2M',
          description: "O investigador forense Barry Allen (Grant Gustin) sofre um acidente em seu laboratório: ele leva um banho de produtos químicos e, em seguida, é atingido por um raio. A partir disso, ele se torna capaz de canalizar os poderes do Campo de Velocidade e de se locomover com uma rapidez sobre-humana. De máscara e uniforme vermelhos, Barry assume a identidade do super-herói Flash e começa a usar suas habilidades para patrulhar Central City, contando com a ajuda dos cientistas da S.T.A.R. Labs. Ao mesmo tempo que detém vilões, ele procura descobrir quem está por trás do assassino de sua mãe."
       ),
       Movie(
           title: 'Batman',
           image:
           'https://veja.abril.com.br/wp-content/uploads/2022/03/ABRE-rev-1-TBM-56056JOrv4_High_Res_JPEG.jpeg.jpg?quality=70&strip=info&w=1280&h=720&crop=1',
           url: 'https://www.youtube.com/watch?v=HJv4LQxbVEA',
        description: "After two years of stalking the streets as Batman, Bruce Wayne finds himself in the darkest depths of Gotham City. With few reliable allies, the lone vigilante establishes himself as the populace's embodiment of vengeance."
       ),
       Movie(
           title: 'Joker',
           image:
           'https://imagens.brasil.elpais.com/resizer/74_RzlDilW_4N2EjlFsYISJn96w=/1960x0/arc-anglerfish-eu-central-1-prod-prisa.s3.amazonaws.com/public/ZOD7BNL5DV6XKYEBQQ2HFDMNCE.jpg',
           url: 'https://www.youtube.com/watch?v=t433PEQGErc',
        description: "Isolated, intimidated and disregarded by society, failed comedian Arthur Fleck begins his path as a criminal mastermind after murdering three men in the middle of the subway. His action starts a popular movement against Gotham City's elite, of which Thomas Wayne is its greatest representative."
       ),
       Movie(
           title: 'Happy New Year',
           image:
           'https://c4.wallpaperflare.com/wallpaper/194/620/840/movies-bollywood-movies-wallpaper-preview.jpg',
           url: 'https://www.youtube.com/watch?v=JGHwANkQFrg',
          description: "Um ladrão de diamantes e seu bando entram em um concurso de dança para aplicar um grande golpe. De toda forma, eles não vão sair dessa sem aprender a dançar."
       )
     ];
    _actionMovies.forEach((movie) {
      _actionMovieCards.add(buildCard(movie));
    });
    _bollywoodMovies.forEach((movie) {
      _bollywoodMovieCards.add(buildCard(movie));
    });
     _dcComics.forEach((movie) {
       _bollywoodMovieCards.add(buildCard(movie));
     });
  }

  Widget buildCard(Movie movie) {
    return InkWell(


        onDoubleTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VideoPlayer(
                    url: movie.url,
                  )));
        },
        child: Container(
            height: 200,
            width: 200,
            child: Card(
                color: Colors.black12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Image.network(movie.image, fit: BoxFit.fill,)
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(movie.title,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ))));
  }

  late final pageUserController = PageController(viewportFraction: 1/*0.35*/);
  double currentPage = 0.0;
  double textPage = 0.0;

  final pageTextController = PageController();

  FocusNode list1 = FocusNode();
  FocusNode list2 = FocusNode();



  usuarioScrollListener(){
    setState(() {
      currentPage = pageUserController.page!;
      //print(currentPage);
    });
  }

  textScrollListener(){
    setState(() {
      textPage = currentPage;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    addMovies();
    pageUserController.addListener(usuarioScrollListener);
    pageTextController.addListener(textScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageUserController.removeListener(usuarioScrollListener);
    pageUserController.dispose();
    pageTextController.dispose();
    pageTextController.removeListener(textScrollListener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
            fit: BoxFit.fitHeight,
            image: AssetImage("assets/images/bg.jpeg"),

          ),
          gradient: new LinearGradient(
              colors: [
                Colors.blueAccent.shade700,
                Colors.lightBlue.shade100
              ],
              begin: const FractionalOffset(0.2, 0.2),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Opções
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Hello ${widget.nomeUsuario}",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w900),),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Favorites",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w900),),
                        Icon(Icons.arrow_drop_down_outlined,color: Colors.white,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("TV Show",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w900),),
                        Icon(Icons.arrow_drop_down_outlined,color: Colors.white,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Categories",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w900),),
                        Icon(Icons.arrow_drop_down_outlined,color: Colors.white,),
                      ],
                    ),
                    IconButton(iconSize: 40, color: Colors.white,onPressed: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          Login()), (Route<dynamic> route) => false);

                    }, icon: Icon(Icons.logout))
                  ],
                ),
                SizedBox(height: 30,),

                //Action Movies
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text("Action Movies",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30,fontStyle: FontStyle.italic,letterSpacing: 10, shadows: <Shadow>[
                    Shadow(
                      offset: Offset(10.0, 10.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Shadow(
                      offset: Offset(10.0, 10.0),
                      blurRadius: 8.0,
                      color: Color.fromARGB(0,255,165,0),
                    ),
                  ],),),
                ],),
                Container(
                  height: 250,
                  child: ListView.builder(
                      //controller: pageUserController,
                      //shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      //key: _listKey,
                      itemCount: _actionMovies.length,
                      itemBuilder: (context, index) {
                        //FocusNode list1 = FocusNode();

                        return Focus(
                            //key: Key(_bollywoodMovies[index].title),
                            onFocusChange: (value){
                            setState(() {
                              indexSelected1  = index ;
                            });
                            },
                            child: InkWell(
                                onFocusChange: (value){
                                  setState(() {
                                    indexSelected1 = value ? index: -1;
                                  });
                                },
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsMovie(_actionMovies[index])));
                                },
                                onDoubleTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VideoPlayer(
                                            url: _actionMovies[index].url,
                                          )));
                                },
                                child: ColorFiltered(
                                  colorFilter: index == indexSelected1 ? ColorFilter.linearToSrgbGamma():ColorFilter.srgbToLinearGamma()/*ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop)*/,
                                  child: Transform.scale(
                                    scale:1.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40), bottomRight:Radius.circular(40),bottomLeft: Radius.circular(40) ),

                                      ),
                                        padding: EdgeInsets.all(20),
                                        height:index == indexSelected1 ? 230:200,
                                        width: 200,
                                        child: Card(
                                            color: Colors.black12,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                    child: AnimatedScale(
                                                      duration: Duration(milliseconds: 800),
                                                        scale:index == indexSelected1 ?1.2: 1.0,
                                                        child: Hero(
                                                            tag: _actionMovies[index].image,
                                                            child: Image.network(_actionMovies[index].image, fit: BoxFit.fill,colorBlendMode: index==indexSelected2 ? BlendMode.srcIn: BlendMode.darken,)))
                                                ),
                                                Divider(
                                                  color: Colors.white,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(_actionMovies[index].title,
                                                      style: TextStyle(color: Colors.white)),
                                                ),
                                              ],
                                            ))),
                                  ),
                                )
                        )
                                );
                      }),
                ),


                //Hollywood filmes
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Hollywood Movies",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30,fontStyle: FontStyle.italic,letterSpacing: 10, shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(0,255,165,0),
                      ),
                    ],),),
                  ],),
                Container(
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _bollywoodMovies.length,
                      itemBuilder: (context, index) {

                        return InkWell(
                          onFocusChange: (value){
                            setState(() {
                              indexSelected2 = value ? index: -1;
                            });
                          },
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsMovie(_bollywoodMovies[index])));
                            },
                            onDoubleTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VideoPlayer(
                                        url: _bollywoodMovies[index].url,
                                      )));
                            },
                            child: ColorFiltered(
                              colorFilter: index == indexSelected2 ? ColorFilter.linearToSrgbGamma():ColorFilter.srgbToLinearGamma(),
                              child: Transform.scale(
                                scale:1.0,
                                child: Container(
                                    padding: EdgeInsets.all(20),
                                    height:index == indexSelected2 ? 230:200,
                                    width: 200,
                                    child: Card(
                                        color: Colors.black12,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: AnimatedScale(
                                                  duration: Duration(milliseconds: 800),
                                                    scale:index == indexSelected2 ?1.2: 1.0,
                                                    child: Image.network(_bollywoodMovies[index].image, fit: BoxFit.cover,colorBlendMode: index==indexSelected2 ? BlendMode.srcIn: BlendMode.darken,))
                                            ),
                                            Divider(
                                              color: Colors.white,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(_bollywoodMovies[index].title, style: TextStyle(color: Colors.white)),
                                            ),
                                          ],
                                        )
                                    )
                                ),
                            ),
                              ));
                      }),
                ),

                //DC COMICS
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("DC Comics",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30,fontStyle: FontStyle.italic,letterSpacing: 10, shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(0,255,165,0),
                      ),
                    ],),),
                  ],),
                Container(
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _dcComics.length,
                      itemBuilder: (context, index) {


                        return InkWell(
                            onFocusChange: (value){
                              setState(() {
                                indexSelected3 = value ? index: -1;
                              });
                            },
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsMovie(_dcComics[index])));
                            },
                            //focusNode: FocusNode(),
                            onDoubleTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VideoPlayer(
                                        url: _dcComics[index].url,
                                      )));
                            },
                            child: ColorFiltered(
                              colorFilter: index == indexSelected3 ? ColorFilter.linearToSrgbGamma():ColorFilter.srgbToLinearGamma(),
                              child: Transform.scale(
                                scale:1.0,
                                child: Container(
                                    padding: EdgeInsets.all(20),
                                    height:index == indexSelected3 ? 230:200,
                                    width: 200,
                                    child: Card(
                                        color: Colors.black12,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: AnimatedScale(
                                                  duration: Duration(milliseconds: 800),
                                                    scale:index == indexSelected3 ?1.2: 1.0,
                                                    child: Image.network(_dcComics[index].image, fit: BoxFit.cover,colorBlendMode: index==indexSelected3 ? BlendMode.srcIn: BlendMode.darken,))
                                            ),
                                            Divider(
                                              color: Colors.white,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(_dcComics[index].title, style: TextStyle(color: Colors.white)),
                                            ),
                                          ],
                                        )
                                    )
                                ),
                              ),
                            ));
                      }),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
