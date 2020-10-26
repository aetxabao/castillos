import 'package:castillos/models/patrimonio_model.dart';
import 'package:castillos/screens/mapa_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final Patrimonio patrimonio;

  WebViewScreen({@required this.patrimonio});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  var isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.patrimonio.nombre),
        actions: [
          IconButton(
            icon: Icon(Icons.place),
            tooltip: "Mapa",
            onPressed: () => _goToMap(widget.patrimonio),
          )
        ],
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.patrimonio.getWebUrl(),
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (url) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.place),
        onPressed: () => _goToMap(widget.patrimonio),
      ),
    );
  }

  _goToMap(Patrimonio patrimonio) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MapaScreen(patrimonio: patrimonio)));
  }
}
