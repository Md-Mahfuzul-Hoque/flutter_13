import 'package:flutter/material.dart';

class FlutterInput extends StatelessWidget {
  const FlutterInput({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Input', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/0/0d/Facebook_logo_%28June_30%2C_2015%29.png',
            ),

            Image.asset('asset/YT.png'),

            SizedBox(height: 20),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 11,
              cursorColor: Colors.orange,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                suffixIcon: Icon(Icons.check),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  // borderSide: BorderSide(color: Colors.grey)
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.orange),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(20),

                // fillColor: Colors.grey.shade100,
                hintText: 'Enter Your Phone Number',
                hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                helperText: '017xxx',
                helperStyle: TextStyle(color: Colors.blue),
                labelText: 'Phone Number',
                labelStyle: TextStyle(color: Colors.orange, fontSize: 20),
              ),
            ),

            SizedBox(height: 10),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  // borderSide: BorderSide(color: Colors.grey)
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.orange),
                ),

                hintText: 'Enter Password',
                hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.orange, fontSize: 20),
              ),
            ),

            SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,

                  foregroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  print(phoneController.text);

                  print(passwordController.text);
                  // phoneController.clear();
                  // passwordController.clear();

                  if (passwordController.text.length < 6) {
                    print('Password must be minimum 6');
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
