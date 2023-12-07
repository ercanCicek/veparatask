import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:veparatask/v.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final double gap = 16.0;

  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    backgroundColor: V.mainWhite.withOpacity(0.22),
  );

  int currentIndex = 0;

  final List<Widget> pages = List.generate(4, (index) => const HomePage());

  List<BottomNavigationBarItem> bottomNavItems({required bool isCurrent}) {
    BottomNavigationBarItem customItem({required String svgPath, required String label}) {
      return BottomNavigationBarItem(
        icon: SvgPicture.asset(svgPath, height: kRadialReactionRadius, color: isCurrent ? V.mainDarkBlue : V.mainLightGrey),
        label: label,
      );
    }
    return [
      customItem(svgPath: V.anasayfaImagePath, label: "Anasayfa"),
      customItem(svgPath: V.odemealImagePath, label: "Ödeme Al"),
      customItem(svgPath: V.komisyonImagePath, label: "Komisyon"),
      customItem(svgPath: V.islemlerImagePath, label: "İşlemler"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 66,
        leading: Padding(
          padding: EdgeInsets.only(left: gap),
          child: const CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage("https://media.licdn.com/dms/image/C4D03AQHAtJbHe6q6DQ/profile-displayphoto-shrink_800_800/0/1661021717667?e=1707350400&v=beta&t=0lMp5R_T7nHojAU1Zfg3RodbnimC7HaPOxQzwONhqEY"),
          ),
        ),
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "Ahmet Yıldız\n", style: TextStyle(fontSize: V.textSize2, color: Colors.black)),
              TextSpan(text: "VP866379", style: TextStyle(fontSize: V.textSize2, color: V.hintGrey)),
            ],
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: gap),
              child: Badge(
                backgroundColor: V.errorRed,
                label: const Text("4"),
                child: SvgPicture.asset(V.notificationImagePath),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: gap),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 35),
              height: 246,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    V.linearBlue,
                    V.linearBlue.withOpacity(0.7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Text("Kullanılabilir Bakiye", style: TextStyle(color: Colors.white, fontSize: V.textSize1)),
                  Text("₺2.750,20", style: TextStyle(color: Colors.white, fontSize: V.textSize5, fontWeight: FontWeight.w500)),
                  const Divider(
                    indent: 30,
                    endIndent: 30,
                    color: Colors.white,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Toplam Bakiye: ", style: TextStyle(color: Colors.white, fontSize: V.textSize1)),
                        TextSpan(text: "₺4.300,20\n\n", style: TextStyle(color: Colors.white, fontSize: V.textSize2, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: [
                        ElevatedButton.icon(
                          style: buttonStyle,
                          icon: const Icon(Icons.add_circle_outline),
                          label: const Text("Para Yükle"),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton.icon(
                          style: buttonStyle,
                          icon: const Icon(Icons.remove_circle_outline),
                          label: const Text("Para Çek"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: gap),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: gap),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Son İşlemler", style: TextStyle(fontSize: V.textSize3, fontWeight: FontWeight.w500)),
                        TextButton(
                          child: Text("Tümünü Gör", style: TextStyle(fontSize: V.textSize1)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 10,
                        separatorBuilder: (ctx, index) => const Divider(thickness: 1),
                        itemBuilder: (ctx, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tamamlandı", style: TextStyle(color: V.mainGreen, fontSize: V.textSize2)),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("12-04-2023 11:35", style: TextStyle(color: V.mainLightGrey, fontSize: V.textSize2)),
                                  const Spacer(),
                                  Text("4.598,00 ₺ ", style: TextStyle(fontSize: V.textSize2, fontWeight: FontWeight.w500)),
                                  Icon(Icons.arrow_forward_ios, size: V.textSize2, color: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: List.generate(pages.length, (index) => bottomNavItems(isCurrent: currentIndex == index)[index]),
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
