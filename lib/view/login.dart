import 'package:android_tv/view/sign_in_up.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
            image: AssetImage('assets/images/bg.jpeg',),fit: BoxFit.fill,
        )
        ),
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("TV Android",style: TextStyle(fontSize: 33,fontWeight: FontWeight.w500,color: Colors.white /*Colors.grey[600]*/, letterSpacing: 10, shadows: <Shadow>[
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
                  ], ),),

                  Container(
                    //margin: EdgeInsets.only(top: 50.0), //aqui controlo a posição do botão d login
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.blueAccent,
                          offset: Offset(1.0, 6.0),
                          blurRadius: 20.0,
                        ),
                        BoxShadow(
                          color: Colors.blue.shade100,
                          offset: Offset(1.0, 6.0),
                          blurRadius: 20.0,
                        ),
                      ],
                      gradient: new LinearGradient(
                          colors: [
                            Colors.blueAccent,
                            Colors.blue.shade100
                          ],
                          begin: const FractionalOffset(0.2, 0.2),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: Stack(
                      children:<Widget>[
                        MaterialButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.blueAccent,
                            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                              child: Text("LOG IN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  //fontFamily: "WorkSansBold"
                                ),
                              ),
                            ),
                            onPressed: (){//showInSnackBar("Login button pressed")--------------------AQUI ONDE SUBMETO O FORMULÁRIO-------------------
                              Navigator.of(context).push(MaterialPageRoute(  //passar a tela que eu quero que o app navegue
                                builder: (_){
                                  return SignInUp("signin");//PaginaInicial();
                                },
                              ));
                            }
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    'Unlimited movies, TV\n shows, and more.',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Watch anywhere. Cancel anytime.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Ready to watch? Create or restart your membership.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10.0), //aqui controlo a posição do botão d login
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.blueAccent,
                          offset: Offset(1.0, 6.0),
                          blurRadius: 20.0,
                        ),
                        BoxShadow(
                          color: Colors.blue.shade100,
                          offset: Offset(1.0, 6.0),
                          blurRadius: 20.0,
                        ),
                      ],
                      gradient: new LinearGradient(
                          colors: [
                            Colors.blueAccent,
                            Colors.blue.shade100
                          ],
                          begin: const FractionalOffset(0.2, 0.2),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: Stack(
                      children:<Widget>[
                        MaterialButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.blueAccent,
                            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                              child: Text("SIGN UP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  //fontFamily: "WorkSansBold"
                                ),
                              ),
                            ),
                            onPressed: (){//showInSnackBar("Login button pressed")--------------------AQUI ONDE SUBMETO O FORMULÁRIO-------------------
                              Navigator.of(context).push(MaterialPageRoute(  //passar a tela que eu quero que o app navegue
                                builder: (_){
                                  return SignInUp("signup");//PaginaInicial();
                                },
                              ));
                            }
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );



  }
}
