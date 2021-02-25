import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:url_launcher/url_launcher.dart';

class HtmlPreview extends StatefulWidget {
  @override
  _HtmlPreviewState createState() => _HtmlPreviewState();
}

class _HtmlPreviewState extends State<HtmlPreview> {
  var dataHtml = """
      <div>
        <h1>Kelas Mobile Malang</h1>
        <a href="https://www.qries.com/">
        <img alt="Qries" src="https://cdn-images-1.medium.com/max/166/1*8fKXA-WmjDwn1GznAyi9Zg@2x.png">
        </a>
        <h2>Kelas Flutter</h2>
        <p>Kelas Flutter merupakan salah satu kelas yang diselanggarakan oleh Kelas Mobile Malang dengan mentor berpengalaman dalam bidangnya</p>
        <h3>Features</h3>
        <ul>
          <li>Khofifah</li>
          <li>Mega</li>
          <li>Murfuyani</li>
        </ul>
        <a href="https://www.instagram.com/kelasmobilemalang/?hl=id">klik disini</a>
      </div>
    """;

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('link tidak bisa di akses');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTML Preview'),
      ),
      body: Html(
        data: dataHtml,
        style: {
          "div": Style(
            // width: 300,
            // height: 300,
            // color: Colors.blue,
            // backgroundColor: Colors.green,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            border: Border.all(width: 1),
            fontSize: FontSize.large,
          ),
        },
        onLinkTap: (url) {
          launchURL(url);
        },
        onImageTap: (url) {
          print(url);
        },
      ),
    );
  }
}
