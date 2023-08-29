import 'package:flutter/material.dart';
import 'package:fodei/data/models/food_item.dart';
import 'package:fodei/data/models/home_response.dart';
import 'package:fodei/data/models/offer_item.dart';
import 'package:fodei/data/models/resturant.dart';
import 'package:fodei/data/remote/network/api_end_points.dart';
import 'package:fodei/data/remote/response/status.dart';
import 'package:fodei/presentation/dashboard/home/food_list_item.dart';
import 'package:fodei/presentation/dashboard/home/home_view_model.dart';
import 'package:fodei/presentation/dashboard/home/resturant_list_item.dart';
import 'package:fodei/presentation/dashboard/resturant/resturant-detail.dart';
import 'package:fodei/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    viewModel.fetchHomeItemsFromServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 246),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => viewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, _) {
            switch (value.homeResponse.status) {
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.error:
                return Center(
                  child: Text(
                    value.homeResponse.toString(),
                  ),
                );
              case Status.completed:
                return homeBody(value.homeResponse.data!);
              default:
                return const Center(child: Text("No Data available to show."));
            }
          },
        ),
      ),
    );
  }

  Widget homeBody(HomeResponse response) {
    return ListView(
      children: [
        searchWidget(),
        OffersWidget(offers: response.offers),
        newArrivalList(response.foods),
        resturantList(response.resturants)
      ],
    );
  }

  Widget searchWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
      child: TextField(
        style: GoogleFonts.inter(
          fontSize: 18.0,
          color: const Color.fromARGB(255, 31, 41, 55),
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 230, 231, 233),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          prefixIcon: const Icon(Icons.search),
          hintText: "Search",
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            borderRadius: BorderRadius.circular(13.0),
          ),
        ),
      ),
    );
  }

  Widget newArrivalList(List<FoodItem> foods) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today New Arrival',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 31, 41, 55),
                          fontSize: 20.0),
                    ),
                    Text(
                      'Best of the today\'s food list',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 107, 114, 128),
                          fontSize: 14.0),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "See All",
                      style: GoogleFonts.inter(
                        color: const Color.fromARGB(255, 107, 114, 128),
                      ),
                    ),
                    const Icon(
                      Icons.navigate_next_rounded,
                      color: Color.fromARGB(255, 107, 114, 128),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 260,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: foods.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Center(child: FoodListItem(food: foods[index]));
            },
          ),
        ),
      ],
    );
  }

  Widget resturantList(List<Resturant> resturants) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Booking Restaurant',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 31, 41, 55),
                          fontSize: 20.0),
                    ),
                    Text(
                      'Check your city\'s Near by Restaurant',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 107, 114, 128),
                          fontSize: 14.0),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "See All",
                      style: GoogleFonts.inter(
                        color: const Color.fromARGB(255, 107, 114, 128),
                      ),
                    ),
                    const Icon(
                      Icons.navigate_next_rounded,
                      color: Color.fromARGB(255, 107, 114, 128),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: resturants.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResturantDetailWidget(
                      resturant: resturants[index],
                      otherResturants: resturants,
                    ),
                  ),
                );
              },
              child: Center(
                child: ResturantListItem(resturant: resturants[index]),
              ),
            );
          },
        ),
      ],
    );
  }
}

class OffersWidget extends StatefulWidget {
  const OffersWidget({super.key, required this.offers});
  final List<OfferItem> offers;

  @override
  State<StatefulWidget> createState() => _OfferWidgetState();
}

class _OfferWidgetState extends State<OffersWidget> {
  late int selectedPage;
  late final PageController pageController;

  @override
  void initState() {
    selectedPage = 0;
    pageController =
        PageController(initialPage: selectedPage, viewportFraction: 0.8);
    super.initState();
  }

  void selectCurrentPage(int page) {
    setState(() {
      selectedPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: widget.offers.length,
              controller: pageController,
              onPageChanged: (page) {
                selectCurrentPage(page);
              },
              itemBuilder: (context, position) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.offers[position].background
                          .substring(2)
                          .toColor(),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  width: 20.0,
                                  height: 20.0,
                                  ApiEndPoints().getImageUrl(
                                      widget.offers[position].companyLogo),
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  widget.offers[position].title,
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  widget.offers[position].description,
                                  style: GoogleFonts.inter(
                                      color: Colors.white, fontSize: 10.0),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Text(
                                        'Order',
                                        style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontSize: 10.0),
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      const Icon(
                                        Icons.navigate_next_outlined,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Image.network(
                            ApiEndPoints()
                                .getImageUrl(widget.offers[position].image),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          PageViewDotIndicator(
            currentItem: selectedPage,
            size: const Size(8, 8),
            count: widget.offers.length,
            unselectedColor: const Color.fromARGB(255, 230, 230, 230),
            selectedColor: const Color.fromARGB(255, 50, 183, 104),
            duration: const Duration(milliseconds: 200),
            onItemClicked: (index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ),
    );
  }
}
