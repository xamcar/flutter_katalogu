import 'package:flutter/material.dart';
import 'package:flutter_katalog/views/success_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? expandedSection = 'address';
  
  late TextEditingController addressNameController;
  late TextEditingController addressController;
  late TextEditingController cityController;
  late TextEditingController cardNameController;
  late TextEditingController cardNumberController;
  late TextEditingController expiryController;
  late TextEditingController cvvController;

  @override
  void initState() {
    super.initState();
    addressNameController = TextEditingController();
    addressController = TextEditingController();
    cityController = TextEditingController();
    cardNameController = TextEditingController();
    cardNumberController = TextEditingController();
    expiryController = TextEditingController();
    cvvController = TextEditingController();
  }

  @override
  void dispose() {
    addressNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    cardNameController.dispose();
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Geri"),
          backgroundColor: Colors.blueGrey,
          leadingWidth: 20,
        ),
      body: Padding(
        
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    expandedSection = expandedSection == 'address' ? null : 'address';
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blueGrey[50],
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.home_outlined, color: Colors.blueGrey,),
                        title: Text("Adres"),
                        subtitle: expandedSection != 'address' ? Text(
                          "${addressNameController.text.isEmpty ? 'Ad Soyad' : addressNameController.text}\n${addressController.text.isEmpty ? 'Adres' : addressController.text}\n${cityController.text.isEmpty ? 'Şehir' : cityController.text}",
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ) : null,
                        trailing: Icon(expandedSection == 'address' ? Icons.expand_less : Icons.expand_more, color: Colors.blueGrey,),
                      ),
                      if (expandedSection == 'address')
                        Padding(
                          padding: const EdgeInsets.all(16.0), 
                          child: Column(
                            children: [
                            TextFormField(
                                controller: addressNameController,
                                decoration: InputDecoration(
                                  hintText: "Ad Soyad",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              SizedBox(height: 12),
                              TextFormField(
                                controller: addressController,
                                decoration: InputDecoration(
                                  hintText: "Adres",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              SizedBox(height: 12),
                              TextFormField(
                                controller: cityController,
                                decoration: InputDecoration(
                                  hintText: "Şehir",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  setState(() {
                    expandedSection = expandedSection == 'card' ? null : 'card';
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blueGrey[50],
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.credit_card, color: Colors.blueGrey,),
                        title: Text("Ödeme Bilgileri"),
                        subtitle: expandedSection != 'card' ? Text(
                          "${cardNameController.text.isEmpty ? 'Kart Sahibi Adı' : cardNameController.text}\n${cardNumberController.text.isEmpty ? 'Kart Numarası' : cardNumberController.text}\n${expiryController.text.isEmpty ? 'MM/YY' : expiryController.text} / ${cvvController.text.isEmpty ? 'CVV' : cvvController.text}",
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ) : null,
                        trailing: Icon(expandedSection == 'card' ? Icons.expand_less : Icons.expand_more, color: Colors.blueGrey,),
                      ),
                      if (expandedSection == 'card')
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: cardNameController,
                                decoration: InputDecoration(
                                  hintText: "Kart Sahibi Adı",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              SizedBox(height: 12),
                              TextFormField(
                                controller: cardNumberController,
                                decoration: InputDecoration(
                                  hintText: "Kart Numarası",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: expiryController,
                                      decoration: InputDecoration(
                                        hintText: "MM/YY",
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: TextFormField(
                                      controller: cvvController,
                                      decoration: InputDecoration(
                                        hintText: "CVV",
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          
                        ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: (){
                  if (addressNameController.text.isEmpty ||
                      addressController.text.isEmpty ||
                      cityController.text.isEmpty ||
                      cardNameController.text.isEmpty ||
                      cardNumberController.text.isEmpty ||
                      expiryController.text.isEmpty ||
                      cvvController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Eksik Bilgi"),
                        content: Text("Lütfen tüm bilgilerinizi girin."),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Tamam"),
                          ),
                        ],
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessScreen()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey, minimumSize: Size.fromHeight(50),),
                child: Text("Ödemeyi Tamamla", style: TextStyle(color: Colors.white), ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}