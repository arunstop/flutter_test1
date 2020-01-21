import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key key, this.title, this.content, this.action, this.longAction}) : super(key: key);
  final String title;
  final String content;
  final Function action;
  final Function longAction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 1),
      elevation: 1,
      child: InkWell(
        splashColor: Colors.blue,
        onTap: action,
        onLongPress: longAction,
        child: ListTile(
          contentPadding: EdgeInsets.all(12),
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  //0.7 of context
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Wrap(
                    runSpacing: 6,
                    children: <Widget>[
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      Text(
                        content,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                CachedNetworkImage(
                  //0.7 of context
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 60,
                  imageUrl:
                      'https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/a1/ff/cf/a1ffcf86-f21d-2f6a-5a7f-185e5b9016d8/source/256x256bb.jpg',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, size: 60),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}