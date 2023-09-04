import 'package:flutter/material.dart';
import 'package:covid_tracker/View/countries_list.dart';
import 'package:covid_tracker/world_stats.dart';

class DetailScreen extends StatefulWidget {
  String image;
  String countryName;
  int totalcases;
  int totaldeaths;
  int active;
  int critical;
  int test;

  DetailScreen(
      {Key? key,
      required this.image,
      required this.countryName,
      required this.totalcases,
      required this.totaldeaths,
      required this.active,
      required this.critical,
      required this.test})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryName),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.16,
                      ),
                      ReusableRow(
                          title: 'Country',
                          value: widget.countryName.toString()),
                      ReusableRow(
                          title: 'Total cases',
                          value: widget.totalcases.toString()),
                      ReusableRow(
                          title: 'Deaths',
                          value: widget.totaldeaths.toString()),
                      ReusableRow(
                          title: 'Active cases',
                          value: widget.active.toString()),
                      ReusableRow(
                          title: 'Critcal patients',
                          value: widget.critical.toString()),
                      ReusableRow(
                          title: 'Total tests', value: widget.test.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(),
      ],
    );
  }
}
