import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fodei/data/models/resturant.dart';
import 'package:fodei/data/remote/network/api_end_points.dart';
import 'package:fodei/presentation/dashboard/home/resturant_list_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:maps_launcher/maps_launcher.dart';

class ResturantDetailWidget extends StatelessWidget {
  const ResturantDetailWidget(
      {super.key, required this.resturant, required this.otherResturants});
  final Resturant resturant;
  final List<Resturant> otherResturants;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        title: const Text('Detail Resturant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            resturantDetail(resturant),
            const SizedBox(
              height: 16.0,
            ),
            resturantList(otherResturants)
          ],
        ),
      ),
    );
  }

  Widget resturantList(List<Resturant> resturants) {
    return Card(
      surfaceTintColor: Colors.white,
      child: Column(
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
                        'Other restaurants list',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 31, 41, 55),
                            fontSize: 20.0),
                      ),
                      Text(
                        'check the menu at this restaurant',
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
                          color: const Color(0xff32B768),
                        ),
                      ),
                      const Icon(
                        Icons.navigate_next_rounded,
                        color: Color(0xff32B768),
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
              return Center(
                child: ResturantListItem(resturant: resturants[index]),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget resturantDetail(Resturant resturant) {
    return Card(
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              resturant.name,
              style: GoogleFonts.inter(
                  color: const Color.fromARGB(255, 31, 41, 55),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              children: [
                SvgPicture.asset("assets/images/ic_map.svg"),
                const SizedBox(
                  width: 4.0,
                ),
                Text(resturant.location),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            GalleryWidget(
              gallery: resturant.gallery,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/ic_clock.svg'),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            'Open today',
                            style: GoogleFonts.inter(
                                color: const Color(0xff6B7280),
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0),
                          ),
                        ],
                      ),
                      Text(
                        resturant.timing,
                        style: GoogleFonts.inter(
                            color: const Color(0xff1F2937),
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextButton(
                    onPressed: () {
                      MapsLauncher.launchCoordinates(
                          resturant.lat, resturant.lng);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/images/ic_route.svg',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          'Visit the Restaurant',
                          style: GoogleFonts.inter(
                              color: const Color(0xff2C8DFF),
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({super.key, required this.gallery});
  final List<String> gallery;

  @override
  State<StatefulWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  late int selectedPage;
  late final PageController pageController;

  @override
  void initState() {
    selectedPage = 0;
    pageController = PageController(initialPage: selectedPage);
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
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: widget.gallery.length,
              controller: pageController,
              onPageChanged: (page) {
                selectCurrentPage(page);
              },
              itemBuilder: (context, position) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    ApiEndPoints().getImageUrl(widget.gallery[position]),
                    fit: BoxFit.cover,
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
            count: widget.gallery.length,
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
