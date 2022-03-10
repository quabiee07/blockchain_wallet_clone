import 'package:blockchain/constants.dart';
import 'package:blockchain/pages/home_page.dart';
import 'package:blockchain/local_auth.dart';
import 'package:blockchain/widgets/button.dart';
import 'package:blockchain/widgets/numpad.dart';
import 'package:blockchain/widgets/pin_fields.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
    Auth({Key? key}) : super(key: key);

final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
          body:  SafeArea(
            child: SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        'LOGOUT',
                        style: TextStyle(
                            fontSize: 14,
                            color: primaryColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.network(
                    'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/krinnxb23kgp75s0jyhp',
                    scale: 2.5,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    'Enter PIN',
                    style: TextStyle(
                        fontSize: 14,
                        color: primaryDark,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                buildInput(),
                const SizedBox(
                  height: 10,
                ),
                buildAuthenticate(context),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const[
                       Text(
                        '202202.1.2 (18741)',
                        style: TextStyle(color: primaryDark),
                       )
                    ],
                  ),
                ),
                NumPad(
                  controller: _controller, 
                  delete: () {
                    _controller.text = _controller.text
                    .substring(0, _controller.text.length -1);
                  }, 
                  onSubmit: (){
            
                  })
              ],
                    ),
            ),
          ),
     );
  }


  Widget buildAuthenticate(BuildContext context){
  return Center(
    child: GestureDetector(
      onTap: () async {
        final isAuthenticated = await LocalAuthAPI.authenticate();

        if(isAuthenticated){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage())
          );
        }
      },
      child: const Icon(
        Icons.fingerprint_rounded,
        color: primaryDark,
        size: 45,
         ),
      ),
  );
}

}

