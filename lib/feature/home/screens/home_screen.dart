import 'package:crafty_bay/app/asset_path.dart';
import 'package:crafty_bay/feature/common/controller/main_bottom_nav_index_controller.dart';
import 'package:crafty_bay/feature/core/extensions/app_localization_extension.dart';
import 'package:crafty_bay/feature/home/widgets/HomeCarouselSlider.dart';
import 'package:crafty_bay/feature/common/widgets/category_item.dart';
import 'package:crafty_bay/feature/home/widgets/product_card.dart';
import 'package:crafty_bay/feature/home/widgets/section_header.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8),
            _buildSearchView(),
            SizedBox(height: 12),
            HomeCarouselSlider(),
            SizedBox(height: 16),
            SectionHeader(title: context.localization.all_categories, oneTabSeeAll: () {
              Get.find<MainBottomNavIndexController>().moveToCategory();
            }),
            SizedBox(height: 16),
            _buildCategoryView(),
            SizedBox(height: 20),
            SectionHeader(title: context.localization.popular, oneTabSeeAll: () {}),
            SizedBox(height: 16),
            _buildProductView(),
            SizedBox(height: 16),
            SectionHeader(title: context.localization.special, oneTabSeeAll: () {}),
            SizedBox(height: 16),
            _buildProductView(),
            SizedBox(height: 16),
            SectionHeader(title: context.localization.snew, oneTabSeeAll: () {}),
            SizedBox(height: 16),
            _buildProductView(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  SizedBox _buildProductView() {
    return SizedBox(
      height: 208,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return ProductCart();
        },
      ),
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
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  Padding _buildCategoryView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CategoryItem(
            title: 'Electronics',
            iconData: Icons.computer,
            onTab: () {},
          ),
          CategoryItem(title: 'Food', iconData: Icons.fastfood, onTab: () {}),
          CategoryItem(title: 'Fashion', iconData: Icons.face, onTab: () {}),
          CategoryItem(title: 'Furniture', iconData: Icons.bed, onTab: () {}),
        ],
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
          backgroundImage: NetworkImage(
            'https://scontent.fbzl5-1.fna.fbcdn.net/v/t39.30808-1/488259833_122221468874074736_6951742490121162663_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=110&ccb=1-7&_nc_sid=1d2534&_nc_ohc=PXfFXukrQOAQ7kNvwFMopTV&_nc_oc=AdnrwN27IWYe9FG7ZKRqYttSx9h2aSAcA8BI_QDMZ41oCUvAlgA5WknQCGcB2crcbaU&_nc_zt=24&_nc_ht=scontent.fbzl5-1.fna&_nc_gid=i5-_912dreLahSHZURmmTw&oh=00_AYGZYe_VZ6b3rB2OBQRFN4SDauHzNxp2v4DcSNbjBbPofg&oe=67F60090',
          ),
        ),
        SizedBox(width: 14),
      ],
    );
  }
}
