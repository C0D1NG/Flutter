import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../utils.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50.0,
                width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: white,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
                child: const Icon(
                  CupertinoIcons.heart_fill,
                  color: white,
                  size: 25.0,
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Container(
                height: 50.0,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.cart,
                      size: 25.0,
                      color: black,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      "Add to cart",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: black,
                        fontSize: 16,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      "\$45.9",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: black,
                        fontSize: 16,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 500.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://picsum.photos/1000",
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
              Container(
                height: 500,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(
                      16.0,
                    ))),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      CupertinoIcons.back,
                      color: white,
                      size: 35.0,
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 360, left: 36),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Column(
                      children: [
                        Text(
                          "Negri 5 Menara",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: CupertinoColors.white,
                            fontSize: 30,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Ahmad Fuadi",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: grey1,
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Rating",
                          style: GoogleFonts.montserrat(
                            color: CupertinoColors.white,
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "4.4",
                          style: GoogleFonts.montserrat(
                            color: CupertinoColors.white,
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                      child: VerticalDivider(
                        color: white,
                        thickness: 2,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Pages",
                          style: GoogleFonts.montserrat(
                            color: CupertinoColors.white,
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "106",
                          style: GoogleFonts.montserrat(
                            color: CupertinoColors.white,
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                      child: VerticalDivider(
                        color: white,
                        thickness: 2,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Languages",
                          style: GoogleFonts.montserrat(
                            color: CupertinoColors.white,
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "ENG",
                          style: GoogleFonts.montserrat(
                            color: CupertinoColors.white,
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Introduction",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      color: CupertinoColors.white,
                      fontSize: 24,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ReadMoreText(
                  'lahir di pinggir Danau Maninjau dan tidak pernah menginjak tanah di luar ranah Minangkabau. Masa kecilnya adalah berburu durian runtuh di rimba Bukit Barisan, bermain bola di sawah berlumpur dan tentu mandi berkecipak di air biru Danau Maninjau. Tiba-tiba saja dia harus naik bus tiga hari tiga malam melintasi punggung Sumatera dan Jawa menuju sebuah desa di pelosok Jawa Timur. Ibunya ingin dia menjadi Buya Hamka walau Alif ingin menjadi Habibie. Dengan setengah hati dia mengikuti perintah Ibunya: belajar di pondok. Di kelas hari pertamanya di Pondok Madani (PM), Alif terkesima dengan "mantera" sakti man jadda wajada. Siapa yang bersungguh-sungguh pasti sukses. Dia terheran-heran mendengar komentator sepakbola berbahasa Arab, anak menggigau dalam bahasa Inggris, merinding mendengar ribuan orang melagukan Syair Abu Nawas dan terkesan melihat pondoknya setiap pagi seperti melayang di udara. Dipersatukan oleh hukuman jewer berantai, Alif berteman dekat dengan Raja dari Medan, Said dari Surabaya, Dulmajid dari Sumenep, Atang dari Bandung dan Baso dari Gowa. Di bawah menara masjid yang menjulang, mereka berenam kerap menunggu maghrib sambil menatap awan lembayung yang berarak pulang ke ufuk. Di mata belia mereka, awan-awan itu menjelma menjadi negara dan benua impian masing-masing. Kemana impian jiwa muda ini membawa mereka?',
                  trimLines: 5,
                  preDataText: "Alif",
                  preDataTextStyle: GoogleFonts.montserrat(
                    color: CupertinoColors.white,
                    fontSize: 14,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                  ),
                  style: GoogleFonts.montserrat(
                    color: CupertinoColors.white,
                    fontSize: 14,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                  ),
                  colorClickableText: grey1,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read More...',
                  trimExpandedText: ' Show less',
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Text(
                      "Best Seller",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                        color: CupertinoColors.white,
                        fontSize: 24,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      CupertinoIcons.line_horizontal_3_decrease,
                      color: white,
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
                      Container(
                        height: 160.0,
                        width: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://www.bukukita.com/babacms/displaybuku/102255_f.jpg",
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
                        width: 12.0,
                      ),
                      Container(
                        height: 160.0,
                        width: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/id/2/26/Sampul_buku_Ranah_3_Warna.jpg",
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
                        width: 12.0,
                      ),
                      Container(
                        height: 160.0,
                        width: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/id/thumb/8/83/Rantau_1_muara_%28sampul%29.jpg/220px-Rantau_1_muara_%28sampul%29.jpg",
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
                        width: 12.0,
                      ),
                      Container(
                        height: 160.0,
                        width: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/id/2/26/Sampul_buku_Ranah_3_Warna.jpg",
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
