import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter Layout Demo';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomePage(title: appTitle),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSection(image: 'images/candiijo.jpeg'),
            TitleSection(
              name: 'Candi Ijo',
              location: 'Prambanan, Sleman, Yogyakarta',
            ),
            ButtonSection(),
            TextSection(
              description:
                  'Candi Ijo adalah sebuah kompleks candi Hindu yang terletak di lereng bukit Ijo, sekitar 4 km sebelah tenggara Candi Ratu Boko, Kabupaten Sleman, Yogyakarta. '
                  'Candi ini dibangun pada abad ke-10 hingga ke-11 Masehi dan berada di ketinggian sekitar 375 meter di atas permukaan laut, menjadikannya candi tertinggi di Yogyakarta. '
                  'Candi Ijo terdiri dari satu candi utama dan beberapa candi perwara di sekitarnya. '
                  'Dari tempat ini, pengunjung dapat menikmati pemandangan alam yang indah serta panorama matahari terbenam yang menakjubkan. '
                  'Keunikan arsitektur serta letaknya yang strategis menjadikan Candi Ijo sebagai destinasi wisata sejarah dan budaya yang menarik.',
            ),
          ],
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  final String image;
  const ImageSection({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: double.infinity,
      height: 240,
      fit: BoxFit.cover,
      errorBuilder:
          (context, error, stackTrace) =>
              const Center(child: Text('Error loading image')),
    );
  }
}

class TitleSection extends StatelessWidget {
  final String name;
  final String location;
  const TitleSection({super.key, required this.name, required this.location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(location, style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const SizedBox(width: 4),
          const Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(color: color, icon: Icons.call, label: 'CALL'),
          ButtonWithText(color: color, icon: Icons.near_me, label: 'ROUTE'),
          ButtonWithText(color: color, icon: Icons.share, label: 'SHARE'),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  final String description;
  const TextSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: 14),
        softWrap: true,
      ),
    );
  }
}
