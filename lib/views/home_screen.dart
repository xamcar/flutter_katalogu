import 'package:flutter/material.dart';
import 'package:flutter_katalog/compenents/product_card.dart';
import 'package:flutter_katalog/model/product_model.dart';
import 'package:flutter_katalog/services/api_service.dart';
import 'package:flutter_katalog/views/product_detail_screen.dart';
import 'package:flutter_katalog/views/card_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  String errorMessage = "";
  List<Data> allProducts = [];
  ApiService apiService = ApiService();
  final Set<int> cartIds = {};

  String searchQuery = "";
  @override
  void initState() {
    loadProducts();
  
    super.initState();
  }

  Future<void> loadProducts() async {
    setState(() {
      isLoading = true;
      errorMessage = "";
    });
    try {
      setState(() {
        isLoading =true;
      });
      ProductModel resData = await apiService.fetchProducts();
      setState(() {
        allProducts = resData.data ?? [];
      });
    } catch (e) {
      setState(() {
        errorMessage = "Ürünler alınırken bir hata oluştu!";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final filteredProducts = allProducts.where((product) {
      final name= product.name ?? "";
      return name.toUpperCase().contains(searchQuery.toUpperCase());
    }).toList();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
          Row(
            children: [
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CardScreen(products: allProducts, cartIds: cartIds)));
                },
                iconSize: 30,
                icon: Icon(Icons.shopping_bag_outlined), color: Colors.blueGrey,),
              SizedBox(width: 16),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Arama yap",
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                      ),
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    onChanged: (value){
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 80.0,
            decoration: BoxDecoration(
              color: Color(0xfff5f5f5),
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage("https://www.wantapi.com/assets/banner.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16),
          if (isLoading) Center(child: CircularProgressIndicator())
          else if (errorMessage != "") Center(child: Text(errorMessage))
          else Expanded(child: GridView.builder
          (itemCount: filteredProducts.length,
          gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.7,)),
          itemBuilder: (context, index){
            final product = filteredProducts[index];

            return GestureDetector(
              onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product, cartIds: cartIds)),
                );
              },
              
              child: ProductCard(product: product));
          }),
          ),
        ],),
        
      ),
      ),
    );
  }
}