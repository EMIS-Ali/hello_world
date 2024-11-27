import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Counter Controller
class CounterController extends GetxController {
  // Observable variable
  var count = 0.obs;

  // Method to increment counter
  void increment() {
    count++;
  }

  // Method to decrement counter
  void decrement() {
    if (count > 0) {
      count--;
    }
  }

  // Method to reset counter
  void reset() {
    count.value = 0;
  }
}

// Details Screen
class DetailsScreen extends StatelessWidget {
  // Get the same instance of CounterController
  final CounterController controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Details Page',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Using Obx to monitor changes
            Obx(() => Text(
                  'Current Count: ${controller.count}',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  // Initialize controller using Get.put()
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Counter App'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => controller.reset(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Using Obx to monitor changes
            Obx(() => Text(
                  '${controller.count}',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: controller.decrement,
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: controller.increment,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Get.to(() => DetailsScreen()),
              child: Text('Go to Details'),
            ),
          ],
        ),
      ),
    );
  }
}

// Main App
void main() {
  runApp(
    GetMaterialApp(
      title: 'GetX Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: HomeScreen(),
    ),
  );
}
