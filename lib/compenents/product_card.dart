import 'package:flutter/material.dart';
import 'package:flutter_katalog/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final Data product;
  const ProductCard({super.key, required this.product });

  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                  BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0,3),
              )],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Hero(
                    tag: product.id ?? 0,

                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.vertical(top: Radius.circular(12)),
                      child: Image.network(product.image ?? ""),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name ?? "", maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      SizedBox(height: 1),
                      Text(product.tagline ?? "", style: TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis, color: Colors.grey[600]),),
                      SizedBox(height: 1),
                      Text(product.price ?? "N/A", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueGrey),),
                    ],
                  ),
                ),
              ]
            ),
            );
          
}}