import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart Screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        padding: const EdgeInsets.all(12),
        itemBuilder: (ctx, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12,
              ),
              border: Border.all(color: Colors.blue, width: 1.3),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    color: Colors.blue.withOpacity(0.5),
                    child: Image.network(
                        "https://tsirve.com/wp-content/uploads/2020/09/20171.png"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "POLO",
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  CupertinoButton(
                                    onPressed: () {
                                      if (qty >= 1) {
                                        setState(() {
                                          qty--;
                                        });
                                      }
                                    },
                                    padding: EdgeInsets.zero,
                                    child: const CircleAvatar(
                                      maxRadius: 13,
                                      backgroundColor:
                                          Color.fromARGB(255, 43, 160, 238),
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 1.0,
                                  ),
                                  Text(
                                    qty.toString(),
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 1.0,
                                  ),
                                  CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        qty++;
                                      });
                                    },
                                    padding: EdgeInsets.zero,
                                    child: const CircleAvatar(
                                      maxRadius: 13,
                                      backgroundColor:
                                          Color.fromARGB(255, 43, 160, 238),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "Add to Wishlist",
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "price: LKR",
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
