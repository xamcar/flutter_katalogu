import 'package:flutter/material.dart';
import 'package:flutter_katalog/model/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final Data product;
  final Set<int> cartIds;

  const ProductDetailScreen({super.key, required this.product, required this.cartIds});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Geri"),
          backgroundColor: Colors.blueGrey,
          leadingWidth: 20,
        ),
        body: SafeArea( child:
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ Hero(
              tag: widget.product.id ?? 0,

              child: Image.network(widget.product.image ?? "", height: 350, width: double.infinity, fit: BoxFit.cover,
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(widget.product.name ?? "", 
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                      ),
                      Text(widget.product.price ?? "N/A", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                      ),

                    ],
                  ),
          
                  SizedBox(height: 4),
                  Text(widget.product.tagline ?? "", style: TextStyle(fontStyle: FontStyle.italic,fontSize: 16, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 16),
                  Text("Açıklama",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 4),
                  Text(widget.product.description ?? "", textAlign: TextAlign.justify, style: TextStyle(fontSize: 16, height: 1.5),),
                  SizedBox(width: 4),
                  ElevatedButton(
                    onPressed: () {setState(() {
                    widget.cartIds.add(widget.product.id ?? 0);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ürün sepete eklendi!",), backgroundColor: Colors.green, behavior: SnackBarBehavior.floating, margin: EdgeInsets.only(
                    bottom: 80, left: 20, right: 20
                  ),));
                  }, style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey, minimumSize: Size.fromHeight(50), 
                  ),
                  child: Text("Sepete Ekle", style: TextStyle(color: Colors.white),))
                ],
              ),
            ),
            ],
          ),
        )
      )
    );
  }
}