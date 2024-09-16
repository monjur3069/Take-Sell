import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_sell/common_widgets/appbar_actions.dart';
import 'package:take_sell/common_widgets/common_rating_widget.dart';
import 'package:take_sell/common_widgets/common_text_widget.dart';
import 'package:take_sell/providers/home_provider.dart';
import 'package:take_sell/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  final PageController pageController = PageController();

  @override
  void initState() {
    var provider = Provider.of<HomeProvider>(context, listen: false);
    provider.fetchHomeSliderData(context);
    provider.fetchHomeCategoryData(context);
    provider.fetchHomeTodaysDeal(context);
    provider.fetchHomeFeaturedProduct(context);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: scaffoldBg,
        titleSpacing: 0,
        leading: Transform.scale(
            scale: .7,
            child: Image.asset(
              'images/drawer_icon.PNG',
              fit: BoxFit.cover,
            )),
        title: const Text('E-Shop'),
        actions: [
          AppbarActions(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
          const SizedBox(
            width: 10,
          ),
          AppbarActions(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body: Consumer<HomeProvider>(builder: (context, controller, _) {
        return SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*CommonTextFormField(
                hintText: 'Search Item Here',
                controller: searchController,
                radius: 10,
                verticalPadding: 10,
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(Icons.mic),
                borderColor: Colors.grey,
              ),
              SizedBox(
                height: 8,
              ),*/
              ///Slider
              Container(
                padding: const EdgeInsets.all(0),
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xfff2f6ff),
                    borderRadius: BorderRadius.circular(12)),
                child: controller.isSliderDataLoaded == false
                    ? const Center(child: CircularProgressIndicator())
                    : controller.newSliderList.isNotEmpty
                        ? Center(
                            child: PageView.builder(
                              controller: controller.pageController,
                              itemCount: controller.images.length,
                              onPageChanged: (index) {
                                controller.changeIndex(index);
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),

                                      child: FadeInImage.assetNetwork(
                                  placeholder: 'images/loading.gif',
                                      placeholderFit: BoxFit.fitHeight,
                                      image: controller.images[index],
                                      fit: BoxFit.fill,
                                      imageErrorBuilder: (context, object, stackTrace) {
                                        return Image.asset(
                                          'images/no_image.png',
                                          fit: BoxFit.fill,
                                        );
                                      })
                                  ),
                                );
                              },
                            ),
                          )
                        : const Center(child: Text('No Data Found')),
              ),
              controller.newSliderList.isNotEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: controller.buildIndicator(),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 2,
              ),

              ///Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: primaryBlack),
                  ),
                  Container(
                    height: 20,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: const Text('Show All',style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                color: primaryColor,
                height: 1,
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 85,
                width: double.infinity,
                child: controller.isCategoryDataLoaded
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.homeCategoryModel?.data.length ?? 0,
                        itemBuilder: (context, index) {
                          var item = controller.homeCategoryModel?.data[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: FadeInImage.assetNetwork(
                                  placeholder: 'images/loading.gif',
                                      placeholderFit: BoxFit.fitHeight,
                                      image: item!.banner!,
                                      fit: BoxFit.cover,
                                      imageErrorBuilder: (context, object, stackTrace) {
                                        return Image.asset(
                                          'images/no_image.png',
                                          fit: BoxFit.fill,
                                        );
                                      })
                                  ),
                                ),
                                Text(item.name!,style: const TextStyle(fontSize: 12),),
                              ],
                            ),
                          );
                        })
                    : const SizedBox(),
              ),
              const SizedBox(
                height: 8,
              ),

              ///Todays Deal on Product
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Todays Deal on Products',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: primaryBlack),
                  ),
                  Container(
                    height: 20,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: const Text('Show All',style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                color: primaryColor,
                height: 1,
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 120,
                width: double.infinity,
                child: controller.isTodaysDealDataLoaded
                    ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.homeTodaysDealModel?.data.length ?? 0,
                    itemBuilder: (context, index) {
                      var item = controller.homeTodaysDealModel?.data[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: FadeInImage.assetNetwork(
                                placeholder: 'images/loading.gif',
                                    placeholderFit: BoxFit.fitHeight,
                                    image: item!.thumbnailImage!,
                                    fit: BoxFit.cover,
                                    imageErrorBuilder: (context, object, stackTrace) {
                                      return Image.asset(
                                        'images/no_image.png',
                                        fit: BoxFit.fill,
                                      );
                                    })
                                ),
                              ),
                            ),
                            SizedBox(height: 30,width: 90,child: Text(item.name!,style: const TextStyle(fontSize: 10),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                      );
                    })
                    : const SizedBox(),
              ),
              const SizedBox(
                height: 8,
              ),

              ///Featured Products
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Featured Products',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: primaryBlack),
                  ),
                  Container(
                    height: 20,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: const Text('Show All',style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                color: primaryColor,
                height: 1,
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 114*double.parse((controller
                    .homeFeaturedProductModel?.data.length ?? 1).toString()),
                // height: (double.parse((170 * 7).toString()) /1.54).h,
                child: GridView.builder(
                  physics:
                  const NeverScrollableScrollPhysics(),
                  controller: controller.scrollController,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.85,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: controller
                      .homeFeaturedProductModel?.data.length ??
                      0,
                  itemBuilder: (context, index) {
                    var item = controller.homeFeaturedProductModel!.data[index];
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Card(
                                margin: EdgeInsets.zero,
                                color: primaryWhite.withOpacity(.8),
                                child: SizedBox(
                                  height: 120,
                                  width: 200,
                                  child: FadeInImage.assetNetwork(
                                      placeholder: 'images/loading.gif',
                                      placeholderFit: BoxFit.fitHeight,
                                      image: '${item.thumbnailImage}',
                                      fit: BoxFit.cover,
                                      imageErrorBuilder: (context, object, stackTrace) {
                                        return Image.asset(
                                          'images/no_image.png',
                                          fit: BoxFit.fill,
                                        );
                                      }),
                                ),
                              ),
                             /* Positioned(
                                left: 0,
                                top: 0,
                                child: CommonTextWidget(
                                  text: "20% Off",
                                  fontWeight: FontWeight.w700,
                                  fontColor: Colors.red,
                                ),
                              ),*/
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CommonTextWidget(
                            text: item.name!,
                            fontWeight: FontWeight.w700,
                          ),
                          Row(
                            children: [
                              /*CommonTextWidget(
                                text: "1000 $taka",
                                fontWeight: FontWeight.w500,
                                fontColor: Colors.red,
                                textAlign: TextAlign.start,
                                fontSize: 12,
                                textLineThrough: true,
                              ),
                              const SizedBox(width: 10),*/
                              CommonTextWidget(
                                text: "${item.mainPrice!} $taka",
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontColor: Colors.blueGrey,
                                textAlign: TextAlign.start,
                              ),

                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CommonRatingWidget(ratingStar: item.rating!),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
