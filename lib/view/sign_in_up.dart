import 'package:android_tv/view/home_page.dart';
import 'package:flutter/material.dart';

class SignInUp extends StatefulWidget {
   SignInUp(this.type);
  final String type;

  @override
  State<SignInUp> createState() => _SignInUpState();
}

class _SignInUpState extends State<SignInUp> {
  final GlobalKey<FormState> _formKeyLogin = GlobalKey();
 //auxiliar na validação do formulário
  final GlobalKey<FormState> _formKeyCadastro = GlobalKey();
 //auxiliar na validação do formulário
   final FocusNode myFocusNodeEmailLogin = FocusNode();

   final FocusNode myFocusNodePasswordLogin = FocusNode();

   final FocusNode myFocusNodePassword = FocusNode();

   final FocusNode myFocusNodeEmail = FocusNode();

   final FocusNode myFocusNodeName = FocusNode();

   TextEditingController loginEmailController = new TextEditingController();
 late String loginEmail;
   TextEditingController loginPasswordController = new TextEditingController();
 late String loginPassword;
   bool _obscureTextLogin = true;

   bool _obscureTextSignup = true;

   bool _obscureTextSignupConfirm = true;

   TextEditingController signupEmailController = new TextEditingController();
 late String signupEmail;
   TextEditingController signupNameController = new TextEditingController();
 late String signupName;
   TextEditingController signupPasswordController = new TextEditingController();
 late String signupPassword;
   TextEditingController signupConfirmPasswordController = new TextEditingController();
 late String signupConfirmPassword;

  bool _isLoading = false;
  String nomeUsuario = "";


  void _toggleLogin() {
     setState(() {
       _obscureTextLogin = !_obscureTextLogin;
     });
   }

   void _toggleSignup() {
     setState(() {
       _obscureTextSignup = !_obscureTextSignup;
     });
   }

   void _toggleSignupConfirm() {
     setState(() {
       _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
     });
   }

  _submit(){
    setState(() {
      _isLoading = true;
    });
    bool isValid = false;
    if(widget.type == "signin"){
      isValid = _formKeyLogin.currentState!.validate();
    }else{
      isValid = _formKeyCadastro.currentState!.validate();
    }
    FocusScope.of(context).unfocus(); //fechar teclado ao clicar em submeter formulário (clicar em entrar)

    if(isValid){

      nomeUsuario =widget.type == "signin"? loginEmail : signupName; // notifica o pai (AuthScreen0, passando os dados aqui de AuthData
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          HomePage(nomeUsuario)), (Route<dynamic> route) => false);

    } else{
      setState(() {
        _isLoading = false;
      });
    }


  }

  Widget _buildSignIn(BuildContext context) {
    return Container(
      color: Colors.white24,
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            //overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 10.0,
                color: Colors.white24,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                //formularios email e senha
                child: Container( // container que engloba o email e password
                  color: Colors.white24,
                  width: 350.0,
                  height: 100.0,
                  child: Form(
                    key: _formKeyLogin,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 16.0, color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.web_asset_outlined, color: Colors.black, size: 22.0,),
                              hintText: "Email Address",
                              hintStyle: TextStyle(
                                  fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                            ),
                            onChanged: (valor) => loginEmail = valor,
                            validator: (value) {
                              if(value == null || !value.contains("@")){
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                        ),
                        //),
                        Container(
                          width: double.maxFinite,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        Expanded(
                          child: TextFormField(
                            obscureText: _obscureTextLogin,
                            style: TextStyle(
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.lock, size: 22.0, color: Colors.black,),
                              hintText:"Password",
                              hintStyle: TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                              suffixIcon: GestureDetector(onTap: _toggleLogin, child: Icon(_obscureTextLogin ? Icons.remove_red_eye : Icons.remove_red_eye_outlined, size: 15.0, color: Colors.black,
                              ),
                              ),
                            ),
                            onChanged: (valor) => loginPassword = valor,
                            validator: (value) {
                              if(value == null || value.trim().length < 6){
                                return "Password must be at least 6 characters long!";
                              }
                              return null;
                            },
                          ),
                        ),
                        //),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 90.0), //aqui controlo a posição do botão d login
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
                          _submit();
                        }
                    ),
                    if(_isLoading)
                      Positioned.fill(
                        child: Container(
                          margin: EdgeInsets.all(1),
                          decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
                          child: Center(child: CircularProgressIndicator(),),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: TextButton(
                onPressed: () {},
                child: Text("Forgot Password?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    fontSize: 16.0,
                    //fontFamily: "WorkSansMedium"
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return Container(
      //height: 40,
      color: Colors.white24,
      padding: EdgeInsets.only(top: 23),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            //overflow: Overflow.visible,
            children: <Widget>[
              Card(
                color: Colors.white24,
                elevation: 10.0,
                //color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  color: Colors.white24,
                  width: 350.0,
                  height: 200.0, //---------------------------TESTE AGORA É AQUI  era 200
                  child: Form(
                    key: _formKeyCadastro,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            style: TextStyle(
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.person, color: Colors.black,size: 22.0,),
                              hintText: "Name",
                              hintStyle: TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 17.0),),
                            onChanged: (valor)=>signupName = valor,
                            validator: (value){
                              if(value == null || value.trim().length < 3){
                                //Scaffold.of(context).showSnackBar(SnackBar(content: Text("Campo 'nome' deverá ter pelo menos 3 caracteres!"),backgroundColor: Colors.red,));
                                return "Name must be at least 3 characters long!";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: double.maxFinite/*250.0*/,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(border: InputBorder.none, icon: Icon(Icons.email, color: Colors.black,size:22.0,), hintText: "E-mail address" , hintStyle: TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 17.0),),
                            onChanged: (valor) => signupEmail = valor,
                            validator: (value) {
                              if(value == null || !value.contains("@")){
                                // Scaffold.of(context).showSnackBar(SnackBar(content: Text("Digite um e-mail valido"),backgroundColor: Colors.red,));
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: double.maxFinite/*250.0*/,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: signupPasswordController,
                            obscureText: _obscureTextSignup,
                            style: TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 16.0, color: Colors.black),
                            onChanged: (valor) => signupPassword = valor,
                            validator: (value) {
                              if(value == null || value.trim().length < 6){
                                return "Password must be at least 6 characters long!";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                              suffixIcon: GestureDetector(
                                onTap: _toggleSignup,
                                child: Icon(
                                  _obscureTextSignup
                                      ? Icons.remove_red_eye
                                      : Icons.remove_red_eye_outlined,
                                  size: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          width: double.maxFinite/*250.0*/,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        Expanded(
                          child: TextFormField(
                            obscureText: _obscureTextSignupConfirm,
                            style: TextStyle(
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 16.0,
                                color: Colors.black),
                            validator: (value) {
                              //aqui faço um teste pra saber se precisa validar msm (so vai precisar se for tela d cadastro)
                              if (value != signupPasswordController.text) {
                                return "...passwords don't match!";
                              }
                              return null; //caso seja bem sucedida
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              hintText: "Password Confirmation",
                              hintStyle: TextStyle(
                                  fontFamily: "WorkSansSemiBold", fontSize:16.0),
                              suffixIcon: GestureDetector(
                                onTap: _toggleSignupConfirm,
                                child: Icon(
                                  _obscureTextSignupConfirm
                                      ? Icons.remove_red_eye
                                      : Icons.remove_red_eye_outlined,
                                  size: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 190), //controlo aqui a posição do botão signup
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
                  children: <Widget>[
                    MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.blueAccent,
                      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),//------------------TESTE AGORA É AQUIIIIIIIIII
                        child: Text("SIGN UP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            //fontFamily: "WorkSansBold"
                          ),
                        ),
                      ),
                      onPressed: (){
                        _submit();
                      }, //showInSnackBar("SignUp button pressed")
                    ),
                    if(_isLoading)
                      Positioned.fill(
                          child: Container(
                            margin: EdgeInsets.all(1),
                            decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
                            child: Center(child: CircularProgressIndicator(),),
                          )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  iconTheme: IconThemeData(size: 30),
      //  backgroundColor: Colors.transparent,
      //),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
            image: AssetImage('assets/images/bg.jpeg',),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                visualDensity: VisualDensity.comfortable,
                padding: EdgeInsets.all(20),
              icon: Icon(Icons.arrow_back_outlined,size: 40,),
              onPressed: (){
              Navigator.pop(context);
              },
              color: Colors.white,
              )

            ],
          ),
          Center(
            heightFactor: 1.5,
            child:widget.type == "signin" ? _buildSignIn(context) : _buildSignUp(context),
          ),
        ]
        ),
      ),
    );
  }
}


