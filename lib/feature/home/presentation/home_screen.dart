import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:task/feature/home/presentation/widget/paralax_background.dart';
import 'package:animate_do/animate_do.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double topEleven = 0;
  double topTen = 0;
  double topNine = 0;
  double topEight = 0;
  double topSeven = 0;
  double topSix = 0;
  double topFive = 0;
  double topFour = 0;
  double topThree = 0;
  double topTwo = 0;
  double topOne = 0;

  int projectsCompleted = 0;
  int satisfiedClients = 0;
  int awardsWon = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        projectsCompleted = 120;
        satisfiedClients = 230;
        awardsWon = 35;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notif) {
          if (notif is ScrollUpdateNotification) {
            if (notif.scrollDelta == null) return true;
            setState(() {
              topEleven -= notif.scrollDelta! / 2.0;
              topTen -= notif.scrollDelta! / 1.9;
              topNine -= notif.scrollDelta! / 1.8;
              topEight -= notif.scrollDelta! / 1.7;
              topSeven -= notif.scrollDelta! / 1.6;
              topSix -= notif.scrollDelta! / 1.5;
              topFive -= notif.scrollDelta! / 1.4;
              topFour -= notif.scrollDelta! / 1.3;
              topThree -= notif.scrollDelta! / 1.2;
              topTwo -= notif.scrollDelta! / 1.2;
              topOne -= notif.scrollDelta! / 1;
            });
          }
          return true;
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/top-paralax-11.png',
                fit: BoxFit.cover,
              ),
            ),
            ParalaxBackground(top: topEleven, asset: "assets/top-paralax-11.png"),
            ParalaxBackground(top: topTen, asset: "assets/top-paralax-10.png"),
            ParalaxBackground(top: topNine, asset: "assets/top-paralax-9.png"),
            ParalaxBackground(top: topEight, asset: "assets/top-paralax-8.png"),
            ParalaxBackground(top: topSeven, asset: "assets/top-paralax-7.png"),
            ParalaxBackground(top: topSix, asset: "assets/top-paralax-6.png"),
            ParalaxBackground(top: topFive, asset: "assets/top-paralax-5.png"),
            ParalaxBackground(top: topFour, asset: "assets/top-paralax-4.png"),
            ParalaxBackground(top: topThree, asset: "assets/top-paralax-3.png"),
            ParalaxBackground(top: topTwo, asset: "assets/top-paralax-2.png"),
            ParalaxBackground(top: topOne, asset: "assets/top-paralax-1.png"),

            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 350),

                  // Animated Cards Section
                  FadeInUp(
                    delay: const Duration(milliseconds: 500),
                    child: _buildAnimatedCard(context, "Projects Completed", projectsCompleted),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 700),
                    child: _buildAnimatedCard(context, "Satisfied Clients", satisfiedClients),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 900),
                    child: _buildAnimatedCard(context, "Awards Won", awardsWon),
                  ),

                  const SizedBox(height: 20),
                  _buildMoreContentSection(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedCard(BuildContext context, String title, int targetValue) {
    return Card(
      color: Colors.black.withOpacity(0.5),
      elevation: 12,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            TweenAnimationBuilder<int>(
              tween: IntTween(begin: 0, end: targetValue),
              duration: const Duration(seconds: 2),
              builder: (context, value, child) {
                return Text(
                  "$value+",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold, color: Colors.yellowAccent),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoreContentSection(BuildContext context) {
    return Column(
      children: [
        Text(
          "Achievements & Milestones",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        _buildMilestoneCard("Reached 100k Downloads", Icons.download_rounded, Colors.greenAccent),
        _buildMilestoneCard("Over 300+ Positive Reviews", Icons.thumb_up_rounded, Colors.purpleAccent),
        _buildMilestoneCard("Recognized in 5 Countries", Icons.flag_rounded, Colors.orangeAccent),
      ],
    );
  }

  Widget _buildMilestoneCard(String text, IconData icon, Color iconColor) {
    return Card(
      color: Colors.black.withOpacity(0.7),
      elevation: 10,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadowColor: Colors.black45,
      child: ListTile(
        leading: Icon(icon, color: iconColor, size: 40),
        title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 800));
  }
}
