import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/controller/newsController.dart';
import 'package:app/model/newsModels.dart';

import 'webViewPage.dart';

class Sport extends GetWidget {
  NewsController _controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("News App")),
      body: FutureBuilder(
        future: _controller.getData("sports"),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            News data = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewPage(
                        url: data.articles[index].url ?? "",
                      ),
                    ),
                  ),
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 10,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        if (data.articles[index].urlToImage != null)
                          SizedBox(
                            width: double.infinity,
                            height: 150,
                            child: Image.network(
                              data.articles[index].urlToImage ?? "",
                              fit: BoxFit.fill,
                            ),
                          ),
                        Text(
                          data.articles[index].title ?? "",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        Text(
                          data.articles[index].description ?? "",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: data.articles.length,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
