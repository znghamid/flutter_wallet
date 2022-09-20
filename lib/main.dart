import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// Home Page
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: const Color(0xff1E1F28),
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
        title: Text(
          'My Wallet\'s',
          style: GoogleFonts.quicksand(
            color: const Color(0xff1E1F28),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      drawer: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Drawer(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            width: 280,
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xffB8B9C9),
                            width: 1,
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("lib/assets/img/profile.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Card
              Container(
                width: size!.width - 28,
                height: 200,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment(.7, 1.3),
                    colors: <Color>[
                      Color(0xffF5AE6D),
                      Color(0xffFE5145),
                    ], // Gradient from https://learnui.design/tools/gradient-generator.html
                    tileMode: TileMode.clamp,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(.8),
                      spreadRadius: -30,
                      blurRadius: 50,
                      offset: const Offset(0, 45),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.wallet,
                        size: 40,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "My Balance:",
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text(
                                "14,000",
                                style: GoogleFonts.quicksand(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 5),
                          Column(
                            children: const [
                              Icon(
                                Icons.attach_money,
                                size: 20,
                                color: Colors.white,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

              //  Card List
              const SizedBox(height: 40),
              Text(
                "Last added cards:",
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff1E1F28),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: const Color(0xfff4f4f8),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: const Icon(
                            Icons.credit_card,
                            color: Color(0xffff594f),
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          title: Text(
                            "**** **** **** 5453",
                            style: GoogleFonts.quicksand(),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: const Color(0xfff4f4f8),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: const Icon(
                            Icons.apple,
                            color: Color(0xff0CCCA3),
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          title: Text(
                            "Apple Pay",
                            style: GoogleFonts.quicksand(),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: const Color(0xfff4f4f8),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: const Icon(
                            Icons.paypal,
                            color: Color(0xff1a62ff),
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          title: Text(
                            "Pay Pal",
                            style: GoogleFonts.quicksand(),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: const Color(0xfff4f4f8),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: const Icon(
                            Icons.add,
                            color: Color(0xff171717),
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          title: Text(
                            "Add New Card",
                            style: GoogleFonts.quicksand(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
