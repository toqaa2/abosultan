import 'package:carousel_slider/carousel_slider.dart';

import '../../core/utils/app_imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    HomeWidget(),
    FavouritesWidget(),
    ProfileWidget(),
    MoreWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[300],
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColors.mainColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'المفضلة'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابك'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'القائمة'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        children: [
          _buildTopSection(),
          _buildCarouselSlider(),
          _buildIndicator(),
          _buildTitleWithGradient('الاقسام'),
          _buildCategoriesSection(),
          _buildTitleWithGradient('الاصناف الجديدة'),
          _buildFeaturedSection(),
          _buildTitleWithGradient('الاكثر مبيعا'),
          _buildBestSellingSection(),
        ],
      ),
    );
  }

  Widget _buildTopSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Cart action
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Notification action
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
        enlargeCenterPage: true,
        viewportFraction:
            1.0,
      ),
      items: [
        'assets/Slider.png',
        'assets/Slider.png',
      ].map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [0, 1, 2].map((index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          width: _currentIndex == index ? 30.0 : 15.0,
          height: 5.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
            color: _currentIndex == index
                ? AppColors.mainColor
                : Colors.grey.shade300,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTitleWithGradient(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            // Action for 'See All'
            print('See All tapped');
          },
          child: Text(
            'رؤية المزيد',
            style: TextStyle(color: AppColors.mainColor),
          ),
        ),
        Spacer(),
        Stack(
          children: [
            Container(
              width: 150,
              height: 35,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Color(0xffFDF7DE),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            Positioned(
              child: Text(
                textAlign: TextAlign.center,
                title,
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoriesSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryItem(
            imageUrl: 'assets/catgory1.webp',
            categoryName: 'عطور نسائية',
          ),
          SizedBox(width: 16),
          CategoryItem(
            imageUrl: 'assets/category2.jpg',
            categoryName: 'عطور اطفال',
          ),
          SizedBox(width: 16),
          CategoryItem(
            imageUrl: 'assets/category3.webp',
            categoryName: 'عطور رجالية',
          ),
          SizedBox(width: 16),
          CategoryItem(
            imageUrl: 'assets/category4.webp',
            categoryName: 'عطور رجالية',
          ),
          SizedBox(width: 16),
          CategoryItem(
            imageUrl: 'assets/catgory1.webp',
            categoryName: 'عطور رجالية',
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedSection() {
    return Container(
      height: 100,
      color: Colors.green[100],
      child: Center(child: Text('Featured Section')),
    );
  }

  Widget _buildBestSellingSection() {
    return Container(
      height: 100,
      color: Colors.blue[100],
      child: Center(child: Text('Best Selling Section')),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String categoryName;

  const CategoryItem({
    Key? key,
    required this.imageUrl,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 4,
          shape: CircleBorder(),
          child: ClipOval(
            child: Image.asset(
              imageUrl,
              width: 100,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          categoryName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class FavouritesWidget extends StatelessWidget {
  const FavouritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Favourites Page'));
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Page'));
  }
}

class MoreWidget extends StatelessWidget {
  const MoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('More Page'));
  }
}
