
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),//(title: 'Youtube Test App', key: key,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //  MyHomePage({required Key key, required this.title}) : super(key: key);

  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  sendMail() async {
    String username = 'taskhavenservices@gmail.com';
    String password = 'Avg4life.';

    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username)
      ..recipients.add('telelekan@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Mail using mailer package :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Write the content here</h1>\n<p>Hey! its easy use html tags for alignments</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      // Toast.show("You have clicked the Button! and email sent", context);
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Youtube Test App")//("widget.title"),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: sendMail,
          splashColor: Colors.blueGrey,
          color: Colors.blue,
          child: Text('click',style: TextStyle(color: Colors.black,
              fontSize: 20.0),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}