import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/model/model.dart';
import 'package:travel_app/ui/home%20page/home_controller.dart';
import 'package:travel_app/widget/favorite%20widget/favorite_widget.dart';
import 'package:travel_app/widget/judul%20widget/judul_widget.dart';
import 'package:travel_app/widget/kategori%20widget/kategori_widget.dart';
import 'package:travel_app/widget/popular%20wisata%20widget/popular_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = 'fulan';

  @override
  void initState() {
    HomeController().getUserName().then((value) {
      setState(() {
        name = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Start hello
              Container(
                margin: EdgeInsets.only(bottom: tinggi * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 252, 211, 64),
                            child: Icon(Icons.person),
                          ),
                        ),
                        Text(
                          "Hello, $name",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      onPressed: () {
                        AuthController().logOut(context);
                      },
                    )
                  ],
                ),
              ),
              //end hello

              //start explore
              Container(
                margin: EdgeInsets.only(bottom: tinggi * 0.03),
                child: Text(
                  "Where do you want\nto explore today?",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              //end explore

              //start search
              Container(
                margin: EdgeInsets.only(bottom: tinggi * 0.03),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search destination",
                      suffixIcon: const Icon(Icons.search),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintStyle: GoogleFonts.poppins(fontSize: 20)),
                ),
              ),
              //end search

              JudulWidget(
                  onPressed: () {}, judul: 'Choose Kategory', link: 'See All'),

              FutureBuilder(
                future: HomeController().getKategori(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<DataKategori> data = snapshot.data;

                    return Container(
                        margin: EdgeInsets.only(bottom: tinggi * 0.03),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 20,
                            children: List.generate(data.length, (index) {
                              return KategoriWidget(
                                name: data[index].namaKategori,
                                img: data[index].gambarKategori,
                              );
                            }),
                          ),
                        ));
                  } else {
                    return _buildShimmer(context);
                  }
                },
              ),
//end category
              JudulWidget(
                judul: 'Favorite Place',
                onPressed: () => (),
                link: 'See All',
              ),

              FutureBuilder(
                future: HomeController().getWisata(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<WisataList> data = snapshot.data;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 10,
                        children: List.generate(
                          data.length,
                          (index) => InkWell(
                              onTap: () => Navigator.pushNamed(context, '/details', arguments: data[index]),
                            child: FavoriteWisataWidget(
                              img: data[index].gambarWisata,
                              nama: data[index].namaWisata,
                              rating: data[index].ratingWisata,
                              tempat: data[index].lokasiWisata,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return _buildShimmer(context);
                  }
                },
              ),

              const SizedBox(height: 15),

              JudulWidget(
                  judul: 'Popular Package', onPressed: () {}, link: 'See All'),

              FutureBuilder(
                future: HomeController().getWisata(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<WisataList> data = snapshot.data;
                    print(data.first.gambarWisata);

                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Wrap(
                        children: List.generate(
                          data.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: PopularWidget(
                              img: data[index].gambarWisata,
                              tempat: data[index].lokasiWisata,
                              desc: data[index].deskripsiWisata,
                              rating: data[index].ratingWisata,
                              harga: data[index].hargaWisata,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return _buildShimmer(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 20,
          children: List.generate(
            10,
            (index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      const CircleAvatar(),
                      const SizedBox(width: 5),
                      Container(
                        height: 25,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
