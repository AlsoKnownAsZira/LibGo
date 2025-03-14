import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:venturo_core/features/home_page/view/components/home_app_bar.dart';
import 'package:venturo_core/shared/widgets/custom_botnav.dart';

class UserReportScreen extends StatefulWidget {
  UserReportScreen({Key? key}) : super(key: key);

  @override
  _UserReportScreenState createState() => _UserReportScreenState();
}

class _UserReportScreenState extends State<UserReportScreen> {
  List<dynamic> ongoingOrders = [];
  List<dynamic> historyOrders = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    var box = Hive.box('session');
    final userId = box.get('userId', defaultValue: '0');
    final url =
        'https://67c6a9bf351c081993fe3162.mockapi.io/libgo/api/v1/users/$userId/orders';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> orders = jsonDecode(response.body);
      setState(() {
        ongoingOrders = orders
            .where((order) => order['status'] != '3' && order['status'] != '4')
            .toList();
        historyOrders = orders
            .where((order) => order['status'] == '3' || order['status'] == '4')
            .toList();
        isLoading = false;
      });
    } else {
      Get.snackbar('Error', 'Failed to fetch orders',
          backgroundColor: Colors.red);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('session');
    String userName = box.get('nama', defaultValue: 'User');
    String userAvatar = box.get('avatar', defaultValue: '');

    return Scaffold(
      appBar: AppBar(
        title: HomeAppBar(userName: userName, userAvatar: userAvatar),
      ),
      bottomNavigationBar: CustomBotNav(
        currentIndex: 1,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'Ongoing'),
                      Tab(text: 'History'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        buildOrderList(ongoingOrders),
                        buildOrderList(historyOrders),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildOrderList(List<dynamic> orders) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return ListTile(
          leading: Image.network(order['book_image']),
          title: Text(order['book_name']),
          subtitle: Text('Author: ${order['book_author']}'),
          trailing: Text('Status: ${order['status']}'),
        );
      },
    );
  }
}
