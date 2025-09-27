import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokemonappg13/models/article_model.dart';
import 'package:pokemonappg13/services/api_service_retrofit.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  late ApiServiceRetrofit client;
  late Future<List<ArticleModel>> futuresArticles;

  @override
  void initState() {
    final dio = Dio();
    client = ApiServiceRetrofit(dio);
    futuresArticles = client.getArticles();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ArticleModel articuloEspecifico = await client.getSingleArticle(6);
          print(articuloEspecifico.title);
        },
      ),
      appBar: AppBar(
        title: Text("Artículos"),
        actions: [
          IconButton(
            onPressed: () async {
              final ArticleModel articleModelAux = ArticleModel(
                title: "Titulo nuevo",
                likes: "0",
                userId: "jgallegos",
                // id: id,
              );
              final created = await client.createArticle(articleModelAux);
              futuresArticles = client.getArticles();
              setState(() {});
              print(created.id);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: futuresArticles,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No hay artículos"));
          }
          final List<ArticleModel> articles = snapshot.data!;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  title: Text(articles[index].title),
                  subtitle: Text(articles[index].userId),
                  leading: Text(articles[index].id ?? "0"),
                  trailing: Text(articles[index].likes),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
