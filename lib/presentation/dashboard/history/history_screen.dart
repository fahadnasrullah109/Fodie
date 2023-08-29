import 'package:flutter/material.dart';
import 'package:fodei/data/models/resturant.dart';
import 'package:fodei/data/remote/response/status.dart';
import 'package:fodei/presentation/dashboard/history/history_view_model.dart';
import 'package:fodei/presentation/dashboard/home/resturant_list_item.dart';
import 'package:fodei/presentation/dashboard/resturant/resturant-detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final HistoryViewModel viewModel = HistoryViewModel();

  @override
  void initState() {
    viewModel.fetchHistoryFromServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 246),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          'Book more',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 31, 41, 55),
          ),
        ),
        icon: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 31, 41, 55),
        ),
      ),
      body: ChangeNotifierProvider<HistoryViewModel>(
        create: (BuildContext context) => viewModel,
        child: Consumer<HistoryViewModel>(
          builder: (context, value, _) {
            switch (value.historyResponse.status) {
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.error:
                return Center(
                  child: Text(
                    value.historyResponse.toString(),
                  ),
                );
              case Status.completed:
                return resturantList(value.historyResponse.data!);
              default:
                return const Center(child: Text("No Data available to show."));
            }
          },
        ),
      ),
    );
  }

  Widget resturantList(List<Resturant> resturants) {
    return ListView.builder(
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
          child: ResturantListItem(resturant: resturants[index]),
        );
      },
    );
  }
}
