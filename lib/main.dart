import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images= [
    'https://i.pinimg.com/736x/4c/ca/c6/4ccac6bf5573a09ac06e6537be28219d.jpg',
    'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg',
    'https://images.unsplash.com/photo-1611915387288-fd8d2f5f928b?ixlib=rb-4.0.3ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8w=1000q=80',
    'https://static01.nyt.com/images/2021/09/14/science/07CAT-STRIPES/07CAT-STRIPES-mediumSquareAt3X-v2.jpg',
    'https://play-lh.googleusercontent.com/XVHP0sBKrRJYZq_dB1RalwSmx5TcYYRRfYMFO18jgNAnxHAIA1osxM55XHYTb3LpkV8',
    'https://i1.sndcdn.com/avatars-000600452151-38sfei-t240x240.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.022),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenSize.height * 0.007),
              Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(
                  fontSize: screenSize.width * 0.07,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: screenSize.height * 0.015),
              SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.03,
                      vertical: screenSize.height * 0.01,
                    ),
                    hintText: 'Search for photos...',
                    hintStyle: const TextStyle(fontSize: 18),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.015),
              GridView.builder(
                shrinkWrap: true,
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Image $index Tapped!!!'))
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.network(
                          images[index],
                          width: screenSize.width * 0.25,
                        ),
                        Text(
                          'Image $index',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenSize.width * 0.045,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
             ListView(
               shrinkWrap: true,
               children:  [
                 ListTile(
                   leading: CircleAvatar(
                     maxRadius: 25,
                     backgroundImage: NetworkImage(
                       'https://i.pinimg.com/736x/4c/ca/c6/4ccac6bf5573a09ac06e6537be28219d.jpg',

                     ),
                   ),
                   title: Text('Photo 1'),
                   subtitle: Text('Description for photo 1'),
                 ),
                  ListTile(
                   leading: CircleAvatar(
                     maxRadius: 25,
                     backgroundImage: NetworkImage(
                       'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg',
                     ),
                   ),
                   title: Text('Photo 2'),
                   subtitle: Text('Description for photo 2'),
                 ),
                  ListTile(
                   leading: CircleAvatar(
                     maxRadius: 25,
                     backgroundImage: NetworkImage(
                       'https://static01.nyt.com/images/2021/09/14/science/07CAT-STRIPES/07CAT-STRIPES-mediumSquareAt3X-v2.jpg',
                     ),
                   ),
                   title: Text('Photo 3'),
                   subtitle: Text('Description for photo 3'),
                 ),
               ],
             ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Center(child: CircleAvatar(
                    maxRadius: 25,
                    child: IconButton(
                      icon: const Icon(Icons.upload,size: 30,),
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Colors.black87,
                              elevation: 0,
                              content: Text('Photos uploaded successfully!!!')),

                        );
                      },
                    ))),
              ),
              SizedBox(height: screenSize.width * 0.10),
            ],
          ),
        ),
      ),
    );
  }
}
