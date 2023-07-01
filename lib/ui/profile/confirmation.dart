import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/model/storage/shared_prefs.dart';

confirmationAlertDialog(BuildContext context) {

  Widget noButton = OutlinedButton(
    onPressed: (){
      Navigator.pop(context);
    },
    style: OutlinedButton.styleFrom(             
      side: BorderSide(color: Theme.of(context).colorScheme.secondary),
      foregroundColor: Theme.of(context).colorScheme.secondary,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      alignment: Alignment.center,
    ),
    child: Text('No'),
  );
  Widget yesButton = ElevatedButton(
    onPressed: (){
      SharedPrefs().logout();
      /*Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
            FadeTransition(
            opacity: animation,
            child: Login()
          ),
        ),
      );*/
    }, 
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      alignment: Alignment.center,
    ),
    child: Text('Yes'),
  );
                  
                  
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Theme.of(context).colorScheme.background,
    title: Text("Logout from Account", textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
        textStyle: Theme.of(context).textTheme.titleLarge,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        fontSize: 18
      ),
    ),
    content: Text("Are you sure want to logged out from the account?", textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.bodyMedium,
          letterSpacing: 1.2),
    ),
    actions: [
      Row(
        children: [
          Expanded(child: noButton),
          SizedBox(width: 10),
          Expanded(child: yesButton),
        ],
      ),
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

confirmationCloseAlertDialog(BuildContext context, Function yesPress) {
  Widget noButton = OutlinedButton(
    onPressed: () {
      Navigator.pop(context);
    },
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: Theme.of(context).colorScheme.secondary),
      foregroundColor: Theme.of(context).colorScheme.secondary,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      alignment: Alignment.center,
    ),
    child: Text('No'),
  );
  Widget yesButton = ElevatedButton(
    onPressed: () {
      yesPress();
      Navigator.pop(context);
      // SharedPrefs().logout();
      /*Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
            FadeTransition(
            opacity: animation,
            child: Login()
          ),
        ),
      );*/
    },
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      alignment: Alignment.center,
    ),
    child: Text('Yes'),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Theme.of(context).colorScheme.background,
    title: Text(
      "Close Application",
      textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.titleLarge,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
          fontSize: 18),
    ),
    content: Text(
      "Are you sure want to close App?",
      textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.bodyMedium,
          letterSpacing: 1.2),
    ),
    actions: [
      Row(
        children: [
          Expanded(child: noButton),
          SizedBox(width: 10),
          Expanded(child: yesButton),
        ],
      ),
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}