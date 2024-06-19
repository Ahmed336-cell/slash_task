import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/presentation/views/cart_view.dart';
import '../cubit/home_cubit.dart';
import 'favourite_view.dart';
import 'home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeView(),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoaded) {
                return FavoritePage(favoriteProducts: state.favoruiteItems);
              } else if (state is HomeError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          // Add other pages here if needed
         CartPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Image.asset(
              'assets/images/homefilled.png',
              width: 30,
              height: 30,
            )
                : Image.asset(
              'assets/images/home.png',
              width: 30,
              height: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Image.asset(
              'assets/images/heartfilled.png',
              width: 30,
              height: 30,
            )
                : Image.asset(
              'assets/images/heart.png',
              width: 30,
              height: 30,
            ),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Image.asset(
              'assets/images/cartfilled.png',
              width: 30,
              height: 30,
            )
                : Image.asset(
              'assets/images/cart.png',
              width: 30,
              height: 30,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? Image.asset(
              'assets/images/userfilled.png',
              width: 30,
              height: 30,
            )
                : Image.asset(
              'assets/images/user.png',
              width: 30,
              height: 30,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
