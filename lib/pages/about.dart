import 'package:flutter/material.dart';
import 'package:nft_charities/custom_widgets/bottom_bar.dart';
import 'package:nft_charities/custom_widgets/top_bar.dart';
import 'package:nft_charities/services/database.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 70,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 110),
          _values(),
          _whyUs(),
          _bios(),
        ],
      ),
    );
  }

  Widget _values() {
    return Column(
      children: [
        GradientText(
          'Our Values',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50.0,
            letterSpacing: 3,
          ),
          colors: [
            Colors.blueAccent[200]!,
            Colors.purpleAccent[100]!,
          ],
        ),
        const SizedBox(height: 50),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 100),
            _value(
              'illustrations/window.png',
              'Transparency',
              'When working with us, you will always know where the money you donated is going and you will always be able to know what it is doing. '
                  'We will always show how much we raised for a collection and proof of donations for your peace of mind.',
            ),
            const SizedBox(width: 50),
            _value(
              'illustrations/scales.png',
              'Integrity',
              'We will never go against the core ways in which we operate. '
                  'Our company will always be straightforward with how we work, '
                  'and we will be held accountable by those helping us support these charities.',
            ),
            const SizedBox(width: 50),
            _value(
              'illustrations/sprout.png',
              'Growth',
              'We believe in helping others, but we do that through NFT-Charities. '
                'When we grow, we donate more, more people get to live better lives, and the world becomes a better place. '
                'Help us help others.',
            ),
            const SizedBox(width: 100),
          ],
        ),
        const SizedBox(height: 150),
      ],
    );
  }

  Widget _value(String picture, String value, String description) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 300) / 3,
      child: Column(
        children: [
          // Positioned.fill(
          //   child: Image.asset(
          //     picture,
          //     height: 200,
          //     width: 200,
          //     fit: BoxFit.contain,
          //   ),
          // ),
          Image.asset(
            picture,
            height: 200,
            width: 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 15),
          GradientText(
            value,
            style: const TextStyle(
              fontSize: 30.0,
              letterSpacing: 2,
            ),
            colors: [
              Colors.blueAccent[200]!,
              Colors.purpleAccent[100]!,
            ],
          ),
          const SizedBox(height: 30),
          SelectableText(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              letterSpacing: 1,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _whyUs() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 200,
      child: Column(
        children: [
          GradientText(
            'Why Us?',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50.0,
              letterSpacing: 3,
            ),
            colors: [
              Colors.blueAccent[200]!,
              Colors.purpleAccent[100]!,
            ],
          ),
          const SizedBox(height: 50),
          const SelectableText(
            'It\'s no secret that most people don\'t donate significantly or regularly to charity. '
              'And many of the rich donate money to use their donations as tax write-offs. '
              'From this, we saw that there needs to be an incentive to donate. '
              'In other words, when everybody gets what they want, we all win.\n\n'

              'That\'ts why we\'re leveraging NFT markets and technology and partnering with artists in order to raise more money for charity than ever before. '
              'The money donated will be given to the charities that have the highest return on investments, so you can be confident that your money is being used well for good causes. '
              'In the future, we also hope to implement a weighted voting system based on the amount donated to decide which charities to support in upcoming collections. '
              'And by being completely transparent and open with our community, we want to build trust with people and a solid foundation to grow. '
              'So join us in welcoming this new age of philanthropy.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              letterSpacing: 1,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 150),
        ],
      ),
    );
  }

  Widget _bios() {
    return Column(
      children: [
        GradientText(
          'Our Team',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50.0,
            letterSpacing: 3,
          ),
          colors: [
            Colors.blueAccent[200]!,
            Colors.purpleAccent[100]!,
          ],
        ),
        const SizedBox(height: 50),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              const SizedBox(width: 100),
              _bio(
                'headshots/michael-northrup.jpg',
                'Michael J. Northrup',
                'Co-founder, Marketing Lead',
                'Michael is a double major, studying for his Masters in Business Administration and a B.S. in Public Accounting. '
                    'He is attending a State University in upstate NY, and recently finished an internship with Northwestern Mutual. '
                    'Having gained some experience in his time at Northwestern, he now seeks to apply his knowledge towards philanthropic causes.',
              ),
              const SizedBox(width: 50),
              _bio(
                'headshots/albert-ai.jpg',
                'Albert Ai',
                'Co-founder, Technical Lead',
                'Albert is a Mathematics - Computer Science major at UCSD, and is slated to enter his first internship in Summer 2022. '
                    'Having already independently developed several different mobile apps, he decided to venture into the NFT space with '
                    'Michael in order to support causes they believe in.',
              ),
              const SizedBox(width: 100),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bio(String picture, String name, String position, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Positioned.fill(
        //   child: Image.asset(
        //     picture,
        //     height: 250,
        //     width: 200,
        //     fit: BoxFit.cover,
        //   ),
        // ),
        Image.asset(
          picture,
          height: 250,
          width: 200,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 680) / 2,
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientText(
                name,
                style: const TextStyle(
                  fontSize: 30.0,
                  letterSpacing: 2,
                ),
                colors: [
                  Colors.blueAccent[200]!,
                  Colors.purpleAccent[100]!,
                ],
              ),
              const SizedBox(height: 10),
              SelectableText(
                position,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 30),
              SelectableText(
                description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 1,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
