import 'package:flutter/material.dart';

import 'Widget/city_card.dart';

class Class2Stack extends StatelessWidget {
  const Class2Stack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack',
        style: TextStyle(
          color: Colors.white
        ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CityCard(img: 'https://media.istockphoto.com/id/1347665170/photo/london-at-sunset.jpg?s=612x612&w=0&k=20&c=MdiIzSNKvP8Ct6fdgdV3J4FVcfsfzQjMb6swe2ybY6I=', title: 'London', rating: '4.8',),


            SizedBox(
              height: 10,
            ),

            Stack(
              children: [
                Container(
                  color: Colors.red,
                  height: 200,
                  width: 200,
                ),

                Positioned(
                  bottom: 50,
                  left: 10,
                  right: 10,
                  top: 10,
                  child: Container(
                    color: Colors.green,
                    height: 150,
                    width: 180,
                  ),
                ),

                Positioned(
                  top: 20,
                  right: 20,
                  bottom: 20,
                  child: Container(
                    color: Colors.purple,
                    height: 100,
                    width: 150,
                  ),
                ),

              ],
            ),

            SizedBox(
              height: 10,
            ),

            Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      "https://scontent.fdac207-1.fna.fbcdn.net/v/t1.6435-9/125491507_3635660763146126_1853361735065579643_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=XeEN0betUoEQ7kNvwHiZzL_&_nc_oc=AdkYCXv3g2FnoPMVZQjlw4Q9JyBYMb-bt-eR37XSu3EvntA7AJWJSjnYoFo_ZXMre8s&_nc_zt=23&_nc_ht=scontent.fdac207-1.fna&_nc_gid=0OuGW44kQwiCLrIKKdfWag&oh=00_Afe6tLullX-YGZV8SXtPElojO1XLQVeY8xwu1izSuAOQHg&oe=691E17C9"
                  ),
                ),

                Positioned(
                  bottom: 15,
                  right: 5,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white,
                          width: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


