

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vax_wallet/Screens/vax_info_screen.dart';
import 'package:vax_wallet/Screens/vax_wallet.dart';

import '../Providers/index_provider.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<IndexProvider>(context);
    final navIndex = p.navIndex;
    List<Widget> screens = [
      const VaxWallet(),
      const VaxInfoScreen()
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vax App'),
      ),
      body: screens[navIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.white,
          backgroundColor: Colors.grey,
          iconSize: 40,
          showUnselectedLabels: true,
          onTap:(int index)=> p.updateIndex(index),
          currentIndex: navIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.wallet, size: 30,), label: "Wallet",backgroundColor: Colors.blue),
            BottomNavigationBarItem(icon: Icon(Icons.vaccines, size: 30,), label: "Add vaccine",backgroundColor: Colors.blue),
          ]),
    );
  }
}
