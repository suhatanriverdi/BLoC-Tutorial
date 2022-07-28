import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../model/article_model.dart';

class ListArticles extends StatefulWidget {
  const ListArticles({Key? key}) : super(key: key);

  @override
  State<ListArticles> createState() => _ListArticlesState();
}

class _ListArticlesState extends State<ListArticles> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsInitial) {
          context.read<NewsBloc>().add(GetTopHeadlinesEvent());
        } else if (state is NewsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsSuccess) {
          return buildArticles(context, state.articles);
        } else if (state is NewsFailure) {
          return Center(
            child: Container(
              color: Colors.amber,
              child: const Center(
                  child: const Text(
                ":)",
                style: TextStyle(fontSize: 500),
              )),
            ),
          );
        }
        return const Text('Something Else Happened');
      },
    );
    // return FutureBuilder(
    //   future: newsRepository.getArticles(),
    //   builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
    //     if (snapshot.hasData) {
    //       List<Article>? articles = snapshot.data;
    //       return buildArticles(context, articles);
    //     } else {
    //       return const Center(
    //         child: Text("No DATA!"),
    //       );
    //     }
    //   },
    // );
  }

  Widget buildArticles(BuildContext context, List<Article>? articles) {
    return ListView.builder(
        itemCount: articles!.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      articles[index].title,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    // Image.network(
                    //   articles[index].urlToImage,
                    // )
                    Image.network(
                      articles[index].urlToImage,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Icon(Icons.abc_outlined);
                      },
                    )
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
