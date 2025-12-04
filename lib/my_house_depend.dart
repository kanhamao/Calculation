import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // Import the new HomePage

class MyHouseDependOnMyMoney extends StatelessWidget {
  final double currentMoney;
  const MyHouseDependOnMyMoney({super.key, required this.currentMoney});

  @override
  Widget build(BuildContext context) {
    String imageUrl;
    String label;
    if (currentMoney == 0) {
      imageUrl =
          'https://www.heritage.org/sites/default/files/styles/facebook_optimized/public/images/2020-03/GettyImages-1090748216.jpg?itok=CtkgLDkz';
      label = 'Homeless and hungry';
    } else if (currentMoney < 5) {
      imageUrl =
          'https://www.brookings.edu/wp-content/uploads/2024/07/homeless-person-sleeping-e1721124587851.jpg?quality=75';
      label = 'No house';
    } else if (currentMoney < 10) {
      imageUrl =
          'https://contents.mediadecathlon.com/p2615349/k\$4dac7636c9e5afd4e1febbd5f96fdfa2/instant-3-person-camping-tent-2-seconds-fresh-black-quechua-8801561.jpg?f=1920x0&format=auto';
      label = 'Tent';
    } else if (currentMoney < 15) {
      imageUrl =
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/30/b0/23/2b/caption.jpg?w=1200&h=-1&s=1';
      label = 'Nice house';
    } else {
      imageUrl =
          'https://i.pinimg.com/736x/06/f4/be/06f4be5e166ad03a5bfc62d80eca4811.jpg';
      label = 'Millionaire house';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              // Wrap image and button in a Stack
              Stack(
                children: [
                  // Image
                  SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          alignment: Alignment.center,
                          child: const Icon(Icons.broken_image, size: 48),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          height: 180,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Positioned button over the image
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: ElevatedButton.icon(
                      onPressed: () =>
                          _navigateToHomePage(context, label, currentMoney),
                      icon: const Icon(Icons.info_outline),
                      label: const Text('View Details'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: Colors.grey[200],
                        foregroundColor: const Color(0xff5a05cb),
                        elevation: 4,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                        child:
                            Text(label, style: const TextStyle(fontSize: 16))),
                    Text('\$${currentMoney.toStringAsFixed(0)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Removed bottom button, overlayed on image
      ],
    );
  }

  void _navigateToHomePage(BuildContext context, String label, double money) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(houseLabel: label, houseMoney: money),
      ),
    );
  }
}
