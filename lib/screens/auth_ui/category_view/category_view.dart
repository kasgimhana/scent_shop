import 'package:flutter/material.dart';
import 'package:scent_shop/constants/routes.dart';
import 'package:scent_shop/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:scent_shop/models/category_model/category_model.dart';
import 'package:scent_shop/models/product_model/product_model.dart';
import 'package:scent_shop/screens/auth_ui/product_details/product_details.dart';
import 'package:scent_shop/widgets/top_titles/top_titles.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key, required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ProductModel> productModelList = [];
  bool isLoading = true;
  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    productModelList = await FirebaseFirestoreHelper.instance
        .getCategoryView(widget.categoryModel.id);
    productModelList.shuffle();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: isLoading
            ? Center(
                child: Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TopTitles(
                          subtitle: "", title: widget.categoryModel.name),
                    ),
                    productModelList.isEmpty
                        ? const Center(
                            child: Text("Top Selling is Empty"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GridView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                primary: false,
                                itemCount: productModelList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20,
                                        childAspectRatio: 0.8,
                                        crossAxisCount: 2),
                                itemBuilder: (ctx, index) {
                                  ProductModel singleProduct =
                                      productModelList[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 12.0,
                                        ),
                                        Image.network(
                                          singleProduct.image,
                                          height: 70,
                                          width: 70,
                                        ),
                                        const SizedBox(
                                          height: 12.0,
                                        ),
                                        Center(
                                          child: Text(
                                            singleProduct.name,
                                            style: const TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                            "price: LKR${singleProduct.price}"),
                                        const SizedBox(
                                          height: 6.0,
                                        ),
                                        SizedBox(
                                          height: 30,
                                          width: 140,
                                          child: OutlinedButton(
                                            onPressed: () {
                                              Routes.instance.push(
                                                  widget: ProductDetails(
                                                      singleProduct:
                                                          singleProduct),
                                                  context: context);
                                            },
                                            child: const Text(
                                              "Buy",
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                    const SizedBox(
                      height: 12.0,
                    )
                  ],
                ),
              ));
  }
}
