import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'LNU Capstone Proposal',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ornare libero in tincidunt hendrerit. Donec mollis, erat eu molestie convallis, velit nulla lacinia nibh, sed vulputate velit libero et leo. Nulla bibendum mauris vel libero aliquam, eu suscipit tortor rhoncus. Nunc congue dolor in turpis accumsan, eget vestibulum leo finibus. Fusce eget odio vel nunc iaculis placerat. Sed suscipit pharetra libero, eu suscipit lorem ultricies ac. Nam euismod mauris nec laoreet auctor. In hac habitasse platea dictumst. Pellentesque sem nunc, efficitur vel consectetur sed, tincidunt sit amet felis. Ut pellentesque vehicula massa quis fermentum. Vivamus in eros mi. Nunc id nulla vestibulum, varius nisi sed, dapibus ipsum.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Team CAHAYA',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ornare libero in tincidunt hendrerit. Donec mollis, erat eu molestie convallis, velit nulla lacinia nibh, sed vulputate velit libero et leo. Nulla bibendum mauris vel libero aliquam, eu suscipit tortor rhoncus. Nunc congue dolor in turpis accumsan, eget vestibulum leo finibus. Fusce eget odio vel nunc iaculis placerat. Sed suscipit pharetra libero, eu suscipit lorem ultricies ac. Nam euismod mauris nec laoreet auctor. In hac habitasse platea dictumst. Pellentesque sem nunc, efficitur vel consectetur sed, tincidunt sit amet felis. Ut pellentesque vehicula massa quis fermentum. Vivamus in eros mi. Nunc id nulla vestibulum, varius nisi sed, dapibus ipsum.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
