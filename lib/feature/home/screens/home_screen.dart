import 'package:crafty_bay/app/asset_path.dart';
import 'package:crafty_bay/feature/common/controller/category_controller.dart';
import 'package:crafty_bay/feature/common/controller/home_slider_controller.dart';
import 'package:crafty_bay/feature/common/controller/main_bottom_nav_index_controller.dart';
import 'package:crafty_bay/feature/common/model/category_model.dart';
import 'package:crafty_bay/feature/common/widgets/category_item.dart';
import 'package:crafty_bay/feature/common/widgets/product_card.dart';
import 'package:crafty_bay/feature/core/extensions/app_localization_extension.dart';
import 'package:crafty_bay/feature/home/widgets/HomeCarouselSlider.dart';
import 'package:crafty_bay/feature/home/widgets/section_header.dart';
import 'package:crafty_bay/feature/product/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: RefreshIndicator(
        onRefresh: () async{
          Get.find<HomeSliderController>().getSliders();
          Get.find<CategoryController>().refrash();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8),
              _buildSearchView(),
              SizedBox(height: 12),
              HomeCarouselSlider(),
              SizedBox(height: 16),
              SectionHeader(
                title: context.localization.all_categories,
                oneTabSeeAll: () {
                  Get.find<MainBottomNavIndexController>().moveToCategory();
                },
              ),
              SizedBox(height: 16),
              _buildCategoryView(),
              SizedBox(height: 20),
              SectionHeader(
                title: context.localization.popular,
                oneTabSeeAll: () {
                  Navigator.pushNamed(
                    context,
                    ProductListScreen.name,
                    arguments: context.localization.popular,
                  );
                },
              ),
              SizedBox(height: 16),
              _buildProductView(),
              SizedBox(height: 16),
              SectionHeader(
                title: context.localization.special,
                oneTabSeeAll: () {
                  Navigator.pushNamed(
                    context,
                    ProductListScreen.name,
                    arguments: context.localization.special,
                  );
                },
              ),
              SizedBox(height: 16),
              _buildProductView(),
              SizedBox(height: 16),
              SectionHeader(
                title: context.localization.snew,
                oneTabSeeAll: () {
                  Navigator.pushNamed(
                    context,
                    ProductListScreen.name,
                    arguments: context.localization.snew,
                  );
                },
              ),
              SizedBox(height: 16),
              _buildProductView(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildProductView() {
    return SizedBox(
      height: 208,
      // child: ListView.builder(
      //   itemCount: 8,
      //   scrollDirection: Axis.horizontal,
      //   padding: EdgeInsets.symmetric(horizontal: 10),
      //   itemBuilder: (context, index) {
      //     return ProductCart();
      //   },
      // ),
    );
  }

  Padding _buildSearchView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryView() {
    return SizedBox(
      height: 90,
      child: GetBuilder<CategoryController>(
        builder: (controller) {
          return controller.inProgress
              ? Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(),
                ),
              )
              : ListView.builder(
                itemCount:
                    controller.categoryList.length > 10
                        ? 10
                        : controller.categoryList.length,
                padding: EdgeInsets.symmetric(horizontal: 14),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  CategoryModel categoryModel = controller.categoryList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FittedBox(
                      child: CategoryItem(
                        icon: categoryModel.icon,
                        title: categoryModel.title,
                        onTab: () {
                          Navigator.pushNamed(context, ProductListScreen.name,arguments: {
                            'id':categoryModel.id,
                            'title':categoryModel.title
                          });
                        },
                      ),
                    ),
                  );
                },
              );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      forceMaterialTransparency: true,
      title: SvgPicture.asset(AssetsPath.logoNavSvg, height: 36),
      actions: [
        SizedBox(width: 12),
        CircleAvatar(
          backgroundColor: Colors.grey.shade50,
          child: IconButton(
            icon: Icon(Icons.notifications_none),
            color: Colors.grey.shade600,
            onPressed: () {},
          ),
        ),
        SizedBox(width: 14),
        CircleAvatar(
          backgroundColor: Colors.grey.shade50,
          child: IconButton(onPressed: () {
            
          }, icon: Icon(Icons.person)),
        ),
        SizedBox(width: 14),
      ],
    );
  }
}
