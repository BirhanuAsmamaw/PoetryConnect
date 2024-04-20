import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          centerTitle: true,
          title: Text(
            'About Us',
            style: GoogleFonts.acme(textStyle: const TextStyle(fontSize: 40)),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Our Vision',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.abel(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                          decoration: TextDecoration.underline)),
                ),
                Text(
                    style: GoogleFonts.abel(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20)),
                    "At Ethio Poem, we envision a dynamic online hub dedicated to the art of poetry. Our platform offers a seamless experience for both reading and posting poems, fostering a global community of poets and enthusiasts. We strive to create a space where individuals can effortlessly share their unique perspectives and emotions, contributing to a more connected and understanding world through the timeless power of poetry. Join us on this poetic journey!"),
                Text(
                  style: GoogleFonts.abel(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                          decoration: TextDecoration.underline)),
                  "Our Commitment to Inclusivity",
                ),
                Text(
                    style: GoogleFonts.abel(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20)),
                    "Diversity is the heartbeat of our poetic community. At Ethio Poem, we are committed to fostering an inclusive space that embraces voices from all walks of life. We believe in the power of varied perspectives to enrich the poetic landscape, and we actively encourage contributions from writers of diverse backgrounds and experiences. Join us in building a tapestry of poetry that reflects the beautiful mosaic of our shared humanity."),
                Text(
                  "The Poetry Experience",
                  style: GoogleFonts.abel(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                          decoration: TextDecoration.underline)),
                ),
                Text(
                    style: GoogleFonts.abel(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20)),
                    "Immerse yourself in a unique poetry experience at Ethio Poem. Our platform is thoughtfully designed to enhance your journey through the written word. Whether you're a seasoned poet or a passionate reader, our user-friendly interface ensures a seamless and enjoyable experience. Discover curated collections, explore diverse themes, and engage with a community that shares your love for the profound impact of poetry on the human soul."),
              ],
            ),
          ),
        ));
  }
}
