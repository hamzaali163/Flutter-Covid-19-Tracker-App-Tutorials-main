import 'package:covid_tracker/View/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/services/utilities/stats_services.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchcontoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Statservices statservices = Statservices();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (value) => setState(() {}),
                  controller: searchcontoller,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    hintText: ('Search with country name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                    future: statservices.getworldstats(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return Shimmer.fromColors(
                            baseColor: Colors.grey.shade200,
                            highlightColor: Colors.grey.shade200,
                            child: ListView.builder(
                                itemCount: 14,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      ListTile(
                                          title: Container(
                                            height: 10,
                                            width: 90,
                                            color: Colors.white,
                                          ),
                                          subtitle: Container(
                                            height: 10,
                                            width: 90,
                                            color: Colors.white,
                                          ),
                                          leading: Container(
                                            height: 10,
                                            width: 50,
                                            color: Colors.white,
                                          ))
                                    ],
                                  );
                                }));
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                String Name = snapshot.data![index]['country'];

                                if (searchcontoller.text.isEmpty) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DetailScreen(
                                                    image: snapshot.data![index]
                                                        ['countryInfo']['flag'],
                                                    countryName:
                                                        snapshot.data![index]
                                                            ['country'],
                                                    totalcases: snapshot
                                                        .data![index]['cases'],
                                                    totaldeaths: snapshot
                                                        .data![index]['deaths'],
                                                    active: snapshot.data![index]
                                                        ['active'],
                                                    critical: snapshot.data![index]
                                                        ['critical'],
                                                    test: snapshot.data![index]
                                                        ['population']),
                                              ));
                                        },
                                        child: ListTile(
                                          title: Text(
                                              snapshot.data![index]['country']),
                                          subtitle: Text(snapshot.data![index]
                                                  ['cases']
                                              .toString()),
                                          leading: Image(
                                            height: 60,
                                            width: 60,
                                            image: NetworkImage(
                                                snapshot.data![index]
                                                    ['countryInfo']['flag']),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                } else if (Name.toLowerCase().contains(
                                    searchcontoller.text.toLowerCase())) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(
                                            
                                                    image: snapshot.data![index]
                                                        ['countryInfo']['flag'],
                                                    countryName:
                                                        snapshot.data![index]
                                                            ['country'],
                                                    totalcases: snapshot
                                                        .data![index]['cases'],
                                                    totaldeaths: snapshot
                                                        .data![index]['deaths'],
                                                    active: snapshot.data![index]
                                                        ['active'],
                                                    critical: snapshot.data![index]
                                                        ['critical'],
                                                    test: snapshot.data![index]
                                                        ['population']),
                                          ),);
                                        },
                                        child: ListTile(
                                          title: Text(
                                              snapshot.data![index]['country']),
                                          subtitle: Text(snapshot.data![index]
                                                  ['cases']
                                              .toString()),
                                          leading: Image(
                                            height: 60,
                                            width: 60,
                                            image: NetworkImage(
                                                snapshot.data![index]
                                                    ['countryInfo']['flag']),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                } else {
                                  return Container();
                                }
                              }),
                        );
                      }
                    }),
              )
            ],
          ),
        ));
  }
}
