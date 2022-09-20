import 'package:covid_nineteen/Services/api-service.dart';
import 'package:covid_nineteen/views/screen/details.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountryTrack extends StatefulWidget {
  const CountryTrack({super.key});

  @override
  State<CountryTrack> createState() => _CountryTrackState();
}

class _CountryTrackState extends State<CountryTrack> {
  TextEditingController countrySearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Country'),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextFormField(
              controller: countrySearch,
              onChanged: (value) {
                setState(() {});
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search Country',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            Expanded(
                child: FutureBuilder(
                    future: ApiService().fetchCountry(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              String name = snapshot.data![index]['country'];
                              String affected = snapshot.data![index]['cases'].toString();
                              String recovered = snapshot.data![index]['recovered'].toString();
                              String death = snapshot.data![index]['deaths'].toString();
                              
                              
                              if (countrySearch.text.isEmpty) {
                                return Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                   Details(name: name,affected: affected,recovered: recovered,death: death,)));
                                      },
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag']),
                                      ),
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(
                                          snapshot.data![index]['continent']),
                                      trailing: Icon(Icons.info_outline),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    )
                                  ],
                                );
                              } else if (name
                                  .toLowerCase()
                                  .contains(countrySearch.text.toLowerCase())) {
                                return Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                   Details(name: name,affected: affected,recovered: recovered,death: death,)));
                                      },
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag']),
                                      ),
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(
                                          snapshot.data![index]['continent']),
                                      trailing: Icon(Icons.info_outline),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    )
                                  ],
                                );
                              } else {
                                return Container();
                              }
                              //END List View
                            });
                      } else {
                        return ListView.builder(
                            itemCount: 10,
                            itemBuilder: ((context, index) =>
                                Shimmer.fromColors(
                                  baseColor: Colors.grey.shade700,
                                  highlightColor: Colors.grey.shade100,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: Container(
                                          height: 32,
                                          width: 32,
                                          color: Colors.grey,
                                        ),
                                        title: Container(
                                          height: 12,
                                          width: 132,
                                          color: Colors.grey,
                                        ),
                                        subtitle: Container(
                                          height: 12,
                                          width: 132,
                                          color: Colors.grey,
                                        ),
                                        trailing: Container(
                                          height: 32,
                                          width: 32,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      )
                                    ],
                                  ),
                                )));
                      }
                    })),
          ],
        ),
      )),
    );
  }
}
