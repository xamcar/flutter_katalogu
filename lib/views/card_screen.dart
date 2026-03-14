import 'package:flutter/material.dart';
import 'package:flutter_katalog/model/product_model.dart';
import 'package:flutter_katalog/views/payment_screen.dart';

class CardScreen extends StatefulWidget {
  final List<Data> products;
  final Set<int> cartIds;
  const CardScreen({super.key, required this.products, required this.cartIds});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = widget.products.where((product) => widget.cartIds.contains(product.id)).toList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sepetim"),
        backgroundColor: Colors.blueGrey,
        leadingWidth: 20,
      ),
      body: SafeArea(child: 
      Padding(padding: EdgeInsets.all(16), child: Column(
        children: [
         Expanded(
          child:
          cartProducts.isEmpty ? Center(child: Column(
            children: [
              Icon( Icons.shopping_bag_outlined, size: 80, color: Colors.blueGrey,),
                SizedBox(height: 16),
              Text("Sepetinizde ürün bulunmamaktadır!", style: TextStyle(fontSize: 18, color: Colors.grey[600]),),
            ],
          )) :
           ListView.builder(
          itemCount: cartProducts.length,
          itemBuilder: (context, index) {
            final item = cartProducts[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Container(
              width: 70,
              height: 70.0,
              decoration: BoxDecoration(
                color: Color(0xfff5f5f5),
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(item.image ?? "" ),
                  fit: BoxFit.cover,
                ),
              ),
                        ),

                  SizedBox(width: 16),
                  Expanded(
                    child: Column( 
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(item.name ?? "", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Text(item.tagline ?? "", style: TextStyle(fontSize: 14, color: Colors.grey[600]),),
                      Text(item.price ?? "N/A", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueGrey),),
                    ],),
                  ),
                  
                   IconButton(onPressed: (){
                    setState(() {
                      widget.cartIds.remove(item.id);
                    });
                   }, icon: Icon(Icons.restore_from_trash_rounded, color: Colors.red,)),
                  
                ],
                        ),
            );
          },
          ),
         ),
         SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200, width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Toplam", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Text("${cartProducts.fold(0, (total, item) => total + int.parse(item.price?.replaceAll('\$', '') ?? "0"))} USD", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey),),
              ],
            ),
          ),
          SizedBox(height: 5),
         ElevatedButton(
          onPressed: (){
            if (widget.cartIds.isEmpty) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Sepet Boş"),
                  content: Text("Siparışi tamamlamak için sepete ürün ekleyin."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Tamam"),
                    ),
                  ],
                ),
              );
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen()));
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey, minimumSize: Size.fromHeight(50), 
          ),
          child:  Text("Siparişi Tamamla", style: TextStyle(color: Colors.white), ),
         ),
        ],
        ),
      ),
      ),
    );
  }
}