import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../../domain/entities/article.dart';
import '../cubit/remote_articles_cubit.dart';
import '../widgets/article_widget.dart';

class BreakingNewsView extends StatefulWidget {
  const BreakingNewsView({Key? key}) : super(key: key);

  @override
  State<BreakingNewsView> createState() => _BreakingNewsViewState();
}

class _BreakingNewsViewState extends State<BreakingNewsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: BlocBuilder<RemoteArticlesCubit, RemoteArticlesState>(
          builder: (_, state) {
            if (state is RemoteArticlesLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }
            if (state is RemoteArticlesError) {
              return const Center(child: Icon(Ionicons.refresh));
            }
            if (state is RemoteArticlesDone) {
              return _buildArticle(state.articles, state.noMoreData);
            }
            return const SizedBox();
          },
        ));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Daily News', style: TextStyle(color: Colors.black)),
      actions: [
        Builder(
          builder: (context) => GestureDetector(
            onTap: () => _onShowSavedArticlesViewTapped(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Ionicons.bookmark, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildArticle(
    // ScrollController scrollController,
    List<Article>? articles,
    bool? noMoreData,
  ) {
    return ListView(
      // controller: scrollController!,
      children: [
        // Items
        ...List<Widget>.from(
          articles!.map(
            (e) => Builder(
              builder: (context) => ArticleWidget(
                article: e,
                onArticlePressed: (e) => _onArticlePressed(context, e),
              ),
            ),
          ),
        ),

        // add Loading (circular progress indicator at the end),
        // if there are more items to be loaded
        if (noMoreData!) ...[
          const SizedBox(),
        ] else ...[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: CupertinoActivityIndicator(),
          ),
        ]
      ],
    );
  }

  // void _onScrollListener(BuildContext context, ScrollController scrollController) {
  //   final maxScroll = scrollController.position.maxScrollExtent;
  //   final currentScroll = scrollController.position.pixels;
  //   final remoteArticleBloc = BlocProvider.of<RemoteArticlesBloc>(context);
  //   final state = remoteArticleBloc.blocProcessState;
  //
  //   if (currentScroll == maxScroll && state == BlocProcessState.idle) {
  //     remoteArticleBloc.add(const GetArticles());
  //   }
  // }

  void _onArticlePressed(BuildContext context, Article article) {
    Navigator.pushNamed(context, '/ArticleDetailsView', arguments: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticlesView');
  }
}
