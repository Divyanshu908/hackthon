import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:share_plus/share_plus.dart';

class Notes extends StatefulWidget {
  @override
  NotesState createState() => NotesState();
}

class NotesState extends State<Notes> {
  String text = '';
  String subject = '';
  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    String pickedFile = imagePaths == null ? "" : imagePaths.toString();
    String trimmedFileName = pickedFile.split("/").last;
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Flutter Share Data'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Share text:',
                    labelStyle: TextStyle(color: Colors.blue),
                    hintText: 'Enter some text and/or link to share',
                  ),
                  maxLines: 2,
                  onChanged: (String value) => setState(() {
                    text = value;
                  }),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Share subject:',
                    labelStyle: TextStyle(color: Colors.blue),
                    hintText: 'Enter subject to share (optional)',
                  ),
                  maxLines: 2,
                  onChanged: (String value) => setState(() {
                    subject = value;
                  }),
                ),
                const Padding(padding: EdgeInsets.only(top: 12.0)),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Add Notes"),
                  onTap: () async {
                    final imagePicker =await FilePicker.platform.pickFiles();
                    List<String>? pickedFile =
                    imagePicker?.files.map((e) => e.path).cast<String>().toList();
                    if (pickedFile != null) {
                      setState(() {
                        Share.shareFiles(pickedFile);
                      });
                    }
                  },
                ),
                Text(imagePaths == null ? "" : trimmedFileName),
                const Padding(padding: EdgeInsets.only(top: 12.0)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Builder(
                      builder: (BuildContext context) {
                        return RaisedButton(
                          color: Colors.orangeAccent[100],
                          child: const Text('Share'),
                          onPressed: text.isEmpty && imagePaths.isEmpty
                              ? null
                              : () => _onShareData(context),
                        );
                      },
                    ),
                    const Padding(padding: EdgeInsets.only(top: 12.0)),
                    Builder(
                      builder: (BuildContext context) {
                        return RaisedButton(
                          color: Colors.orangeAccent[100],
                          child: const Text('Share With Empty Fields'),
                          onPressed: () => _onShareWithEmptyFields(context),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  _onShareData(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles();
    List<String>? files =
    result?.files.map((e) => e.path).cast<String>().toList();
    if (files == null) return;

    await Share.shareFiles(files);
  }
  _onShareWithEmptyFields(BuildContext context) async {
    await Share.share("text");
  }
}