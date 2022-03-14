import 'package:flutter/material.dart';

import '../models/movies_res.dart';
import '../repositiory.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieResponse? movieResponseData;

  getData() {
    Repository.getMovies(
      "movies",
      "Hindi",
      "all",
      "voting",
    ).then((value) {
      setState(() {
        movieResponseData = value;
      });
    });
  }

  @override
  void initState() {
    //  implement initState
    Future.delayed(const Duration(seconds: 1), () {
      getData();
    });
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text("Movies"),
      ),
      body: (movieResponseData == null)
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.teal,
              ),
            )
          : SafeArea(
              child: ListView.builder(
                  itemCount: movieResponseData!.result!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.white,
                      child: Card(
                        margin: const EdgeInsets.all(15.0),
                        elevation: 5,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.arrow_drop_up,
                                      size: 40,
                                    ),
                                    Row(
                                      children: const [
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          "1",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.arrow_drop_down,
                                      size: 40,
                                    ),
                                  ],
                                ),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      "${movieResponseData!.result![index].poster}",
                                      height: 80.0,
                                      width: 50.0,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container();
                                      },
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 250.0,
                                      child: Text(
                                        "${(movieResponseData!.result == null) ? "" : movieResponseData!.result![index].title}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "Genre:",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                            width: 200,
                                            child: Text(movieResponseData!
                                                .result![index].genre!)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Director:",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                            "${movieResponseData!.result![index].director}",
                                            style: const TextStyle(
                                              fontSize: 12,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Stars:",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .55,
                                          child: Text(
                                              "${movieResponseData!.result![index].stars}",
                                              style: const TextStyle(
                                                fontSize: 12,
                                              )),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Mins|",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          child: Text(
                                            "${movieResponseData!.result![index].language} |",
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "${movieResponseData!.result![index].releasedDate!.bitLength}",
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${movieResponseData!.result![index].pageViews} view|",
                                          style: const TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Voted by ${movieResponseData!.result![index].totalVoted} People",
                                          style: const TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Center(
                                  child: Text(
                                    'Watch Trailer',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
    );
  }
}
