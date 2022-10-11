import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Data c = Get.find();
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          "EBook Store",
          style: GoogleFonts.montserrat(
            color: CupertinoColors.black,
            fontSize: 20,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: const Icon(
          CupertinoIcons.list_dash,
          color: black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        CupertinoIcons.search,
                        color: grey1,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: GoogleFonts.montserrat(
                          color: grey1,
                          fontSize: 14,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                        initialValue: null,
                        decoration: const InputDecoration.collapsed(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: "Search?",
                          hintStyle: TextStyle(
                            color: grey1,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Top Authors",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                    color: CupertinoColors.black,
                    fontSize: 24,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: white,
                          backgroundImage: NetworkImage(
                              'https://assets.promediateknologi.com/crop/0x0:0x0/x/photo/2022/01/19/444955596.png'),
                        ),
                        const SizedBox(
                          height: 7.0,
                        ),
                        Text('Tere Liye', style: font),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: white,
                          backgroundImage: NetworkImage(
                              'https://images.gr-assets.com/authors/1457789160p8/3012699.jpg'),
                        ),
                        const SizedBox(
                          height: 7.0,
                        ),
                        Text('Ahmad Fuadi', style: font),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: white,
                          backgroundImage: NetworkImage(
                              'https://awsimages.detik.net.id/community/media/visual/2020/06/11/jk-rowling-2_43.jpeg?w=700&q=90'),
                        ),
                        const SizedBox(
                          height: 7.0,
                        ),
                        Text('J.K Rowling', style: font),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: white,
                          backgroundImage: NetworkImage(
                              'https://cdn.britannica.com/13/136513-050-D53938B1/Danielle-Steel.jpg'),
                        ),
                        const SizedBox(
                          height: 7.0,
                        ),
                        Text('Danielle Steel', style: font),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: white,
                          backgroundImage: NetworkImage(
                              'https://asset.kompas.com/crops/rAKeg3yhfvk6OdCYywqaEHdNAus=/0x0:0x0/750x500/data/photo/2013/08/14/1600129BarbaraCartland1p.jpg'),
                        ),
                        const SizedBox(
                          height: 7.0,
                        ),
                        Text('Barbara', style: font),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: white,
                          backgroundImage: NetworkImage(
                              'https://www.biography.com/.image/t_share/MTE1ODA0OTcxNzgzMzkwNzMz/william-shakespeare-194895-1-402.jpg'),
                        ),
                        const SizedBox(
                          height: 7.0,
                        ),
                        Text('William', style: font),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Categories",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                    color: CupertinoColors.black,
                    fontSize: 24,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Wrap(
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        c.setActive1();
                      },
                      child: Chip(
                        backgroundColor: c.isActive1() ? black : grey2,
                        label: Text(
                          "Motivation & Inspiration",
                          style: c.isActive1() ? fontw : font,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        c.setActive2();
                      },
                      child: Chip(
                        backgroundColor: c.isActive2() ? black : grey2,
                        label: Text(
                          "Science & Theory",
                          style: c.isActive2() ? fontw : font,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        c.setActive3();
                      },
                      child: Chip(
                        backgroundColor: c.isActive3() ? black : grey2,
                        label: Text(
                          "Money & Investment",
                          style: c.isActive3() ? fontw : font,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        c.setActive4();
                      },
                      child: Chip(
                        backgroundColor: c.isActive4() ? black : grey2,
                        label: Text(
                          "Healty & Nutrition",
                          style: c.isActive4() ? fontw : font,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        c.setActive5();
                      },
                      child: Chip(
                        backgroundColor: c.isActive5() ? black : grey2,
                        label: Text(
                          "Education",
                          style: c.isActive5() ? fontw : font,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        c.setActive6();
                      },
                      child: Chip(
                        backgroundColor: c.isActive6() ? black : grey2,
                        label: Text(
                          "Psychological",
                          style: c.isActive6() ? fontw : font,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        c.setActive7();
                      },
                      child: Chip(
                        backgroundColor: c.isActive7() ? black : grey2,
                        label: Text(
                          "Biometric & Math",
                          style: c.isActive7() ? fontw : font,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Text(
                    "Trending Books",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      color: CupertinoColors.black,
                      fontSize: 24,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "See All",
                    style: GoogleFonts.montserrat(
                      color: CupertinoColors.black,
                      fontSize: 14,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Icon(
                    CupertinoIcons.forward,
                    color: black,
                    size: 20.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(const DetailPage()),
                          child: Stack(
                            children: [
                              Container(
                                height: 240.0,
                                width: 170,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://kominfosanti.bulelengkab.go.id/public/uploads/konten/resensi-buku-inilah-hebatnya-novel-negeri-5-menara-41.jpg",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      16.0,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 217, left: 120),
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: black,
                                  child: Icon(
                                    Icons.add,
                                    color: white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 0.0,
                        ),
                        SizedBox(
                          width: 170,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 120,
                                  child: Text("Negri 5 Menara", style: fontb)),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text("\$129", style: fontb),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 240.0,
                              width: 170,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1340606900l/15721334.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    16.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 217, left: 120),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: black,
                                child: Icon(
                                  Icons.add,
                                  color: white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 0.0,
                        ),
                        SizedBox(
                          width: 170,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 120,
                                  child:
                                      Text("Negri Para Bedebah", style: fontb)),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text("\$129", style: fontb),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 240.0,
                              width: 170,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://cdn.gramedia.com/uploads/items/9786020332956_Bumi-New-Cover.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    16.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 217, left: 120),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: black,
                                child: Icon(
                                  Icons.add,
                                  color: white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 0.0,
                        ),
                        SizedBox(
                          width: 170,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 120,
                                  child: Text("Bumi Series Tere Liye",
                                      style: fontb)),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text("\$129", style: fontb),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 240.0,
                              width: 170,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://inc.mizanstore.com/aassets/img/com_cart/produk/pabk-004-si_anak_cahaya-.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    16.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 217, left: 120),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: black,
                                child: Icon(
                                  Icons.add,
                                  color: white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 0.0,
                        ),
                        SizedBox(
                          width: 170,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 120,
                                  child: Text("Si Anak Cahaya", style: fontb)),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text("\$129", style: fontb),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 240.0,
                              width: 170,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://cdnwpseller.gramedia.net/wp-content/uploads/2021/11/09215255/Hujan.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    16.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 217, left: 120),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: black,
                                child: Icon(
                                  Icons.add,
                                  color: white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 0.0,
                        ),
                        SizedBox(
                          width: 170,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 120,
                                  child: Text("Hujan Tere Liye", style: fontb)),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text("\$129", style: fontb),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 240.0,
                              width: 170,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1642939105l/58920677.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    16.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 217, left: 120),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: black,
                                child: Icon(
                                  Icons.add,
                                  color: white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 0.0,
                        ),
                        SizedBox(
                          width: 170,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 120,
                                  child:
                                      Text("Wild Is the Witch", style: fontb)),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text("\$129", style: fontb),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
