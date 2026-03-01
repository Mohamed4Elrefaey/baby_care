import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/features/blog/data/model/article_model.dart';
import 'package:baby_care/features/blog/presentation/view/articles_view.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticlesCareWidget extends StatelessWidget {
  const ArticlesCareWidget({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            ArticlesView.routeName,
            arguments: articleModel,
          );
        },
        child: Container(
          margin: EdgeInsets.only(
            left: Localizations.localeOf(context).languageCode == 'ar' ? 0 : 16,
            right: Localizations.localeOf(context).languageCode == 'ar'
                ? 0
                : 16,
          ),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.bG,
            border: Border.all(color: AppColors.bG1),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF000000).withOpacity(0.04),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 0),
              ),
              BoxShadow(
                color: Color(0xFF000000).withOpacity(0.04),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        articleModel.title,
                        style: AppTextStyles.body2Bold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      8.height,
                      Text(
                        articleModel.description,
                        style: AppTextStyles.captionRagular.copyWith(
                          color: Color(0xff8C8C8C),
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      8.height,
                      WidgetLinearColor(
                        widget: Row(
                          children: [
                            Text(
                              S.of(context).viewArticle,
                              style: AppTextStyles.body2Bold.copyWith(),
                            ),
                            2.width,
                            Icon(Icons.arrow_forward, size: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: context.width * 0.3,
                height: 190,
                decoration: BoxDecoration(
                  borderRadius:
                      Localizations.localeOf(context).languageCode == 'ar'
                      ? BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        )
                      : BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(articleModel.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
