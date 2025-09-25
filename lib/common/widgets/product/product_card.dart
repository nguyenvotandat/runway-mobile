import 'package:agri/common/helper/fomart/number_utils.dart';
import 'package:agri/common/helper/navigator/app_navigator.dart';
import 'package:agri/domain/product/entity/agrochemical.dart';
import 'package:agri/presentation/agrochemical_detail/pages/argochemical_detail.dart';
import 'package:flutter/material.dart';

class AgrochemicalCard extends StatelessWidget {
  final AgrochemicalEntity agrochemicalEntity;

  const AgrochemicalCard({super.key, required this.agrochemicalEntity});

  bool isPromotionActive(AgrochemicalEntity agrochemicalEntity) {
    final packaging = agrochemicalEntity.packaging[0];
    final now = DateTime.now();
    return packaging.numberOfPromotions > 0 &&
        now.isAfter(packaging.promotionStart) &&
        now.isBefore(packaging.promotionEnd) &&
        packaging.discountedPrice > 0;
  }

  @override
  Widget build(BuildContext context) {
    // Tỉnh tổng đã bán
    int totalSold = 0;
    for (var packaging in agrochemicalEntity.packaging) {
      totalSold += packaging.sold;
    }
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
            context, ArgochemicalDetailPage(id: agrochemicalEntity.id));
      },
      child: SizedBox(
        child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: (MediaQuery.of(context).size.width - 4) / 2,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        image: DecorationImage(
                          image: NetworkImage(agrochemicalEntity.images[0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 36,
                            child: Text(
                              agrochemicalEntity.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                // color: AppColors.primary
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Text(
                                isPromotionActive(agrochemicalEntity)
                                    ? "₫${NumberUtils.formatNumber(agrochemicalEntity.packaging[0].discountedPrice.toInt())}"
                                    : "₫${NumberUtils.formatNumber(agrochemicalEntity.packaging[0].price.toInt())}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Container(
                                    width: 50,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.green, // Màu xanh lục
                                        width: 1.0, // Độ dày của đường viền
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          6.0), // Độ bo tròn góc (điều chỉnh theo ý muốn)
                                    ),
                                    child: Center(
                                        child: Row(
                                      children: [
                                        const Icon(
                                          //icons đánh giá sao
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          agrochemicalEntity.totalReviews == 0
                                              ? ("0")
                                              : ((agrochemicalEntity
                                                          .totalReviews /
                                                      agrochemicalEntity
                                                          .averageRating)
                                                  .toStringAsFixed(1)),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            // color: AppColors.primary
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              //tỉnh tổng đã bán

                              children: [
                                Text(
                                  "Đã bán $totalSold",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    // color: AppColors.primary
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
