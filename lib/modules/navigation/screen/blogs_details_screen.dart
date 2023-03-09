import 'package:flutter/material.dart';
import 'package:orange_pro0/shared/constant/spaces.dart';

import '../../../shared/network/remote/end_pointes.dart';

class BlogsDetailsScreen extends StatelessWidget {
  final dynamic data;
  const BlogsDetailsScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    image: DecorationImage(
                      image: data.imageUrl == null || data.imageUrl == ''
                          ? const AssetImage('assets/images/cart/tree2.png')
                          : NetworkImage('${BASE_URL}${data.imageUrl}')
                              as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                PVSpace30,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    '${data.name}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                PVSpace20,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    '${data.description}',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          height: 2.0,
                        ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 20.0,
              left: 15.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
