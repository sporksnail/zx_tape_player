import 'package:colour/colour.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:zx_tape_player/ui/screens/player.dart';
import 'package:zx_tape_player/ui/screens/search.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(0, 100.0, 0, 0),
          child: Text('Find the desired tape',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'ZxSpectrum',
                  fontSize: 12.0,
                  color: Theme.of(context).primaryColor))),
      Padding(
        padding: EdgeInsets.fromLTRB(16, 24.0, 16, 0),
        child: TextField(
          controller: _controller,
          style: TextStyle(color: Colors.white),
          autofocus: true,
          onChanged: (text) {
            if (text.isNotEmpty) {
              Navigator.pushNamed(context, SearchScreen.routeName,
                  arguments: text);
              _controller.text = '';
            }
          },
          cursorColor: Colors.white,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Type a search text here',
            filled: true,
            fillColor: Colour('#28384C'),
            isDense: true,
            prefixIconConstraints: BoxConstraints(
              minWidth: 24,
              minHeight: 24),
            prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Image.asset('assets/images/home/search-icon.png')),
            hintStyle: TextStyle(fontSize: 16.0, color: Colour('546B7F')),
            contentPadding: EdgeInsets.symmetric(vertical: 16.0),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(3.5),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(3.5),
            ),
          ),
        ),
      ),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 65.0, 0, 0),
          child: Text('or select from file',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'ZxSpectrum',
                  fontSize: 12.0,
                  color: Theme.of(context).primaryColor))),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 24.0, 0, 0),
        child: FlatButton(
          color: Colour('#68B8DF'),
          textColor: Theme.of(context).primaryColor,
          padding: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
          onPressed: () async {
            FilePickerResult result = await FilePicker.platform.pickFiles(
                allowMultiple: false,
                        type: FileType.custom,
                        allowedExtensions: ['tap', 'tzx']
                    );
                    if (result != null && result.files.isNotEmpty)
                      Navigator.pushNamed(context, PlayerScreen.routeName,
                          arguments: result.files[0]);
                  },
                  child: Text(
                    "SELECT FROM FILES",
                    style: TextStyle(fontFamily: 'ZxSpectrum', fontSize: 10.0),
                  ),
                ),
              )
            ])
        )
    );
  }
}
