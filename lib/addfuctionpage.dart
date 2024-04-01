import 'package:addfunction/controller/sessioncontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddlistPage extends StatefulWidget {
  const AddlistPage({super.key});

  @override
  State<AddlistPage> createState() => _AddlistPageState();
}

class _AddlistPageState extends State<AddlistPage> {
  List<String?> _selectedProducts = [];
  List<int> _selectedProductPrices = [];
  List<int> _quantities = [1]; 

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SessionController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(),
          body: 
              SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedProducts.add(null);
                                _selectedProductPrices.add(0);
                                _quantities.add(1);
                              });
                            },
                            child: Text('Add'),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _selectedProducts.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                DropdownButton<String>(
                                  hint: Text('Select a product'),
                                  value: _selectedProducts[index],
                                  items: controller.productlistmodel!.data!
                                      .map((product) {
                                    return DropdownMenuItem<String>(
                                      value: product.productName,
                                      child: Text(product.productName ?? ''),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedProducts[index] = newValue;
                                      _selectedProductPrices[index] =
                                          controller.productlistmodel!.data!
                                                  .firstWhere((product) =>
                                                      product.productName ==
                                                      newValue)
                                                  .productSellingPrice ??
                                              0;
                                    });
                                  },
                                ),
                                  Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                               _selectedProducts.removeAt(index);
                                  _selectedProductPrices.removeAt(index);
                                  _quantities.removeAt(index);
                              });
                            },
                            child: Text('Del'),
                          ),
                        ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Text('Price: ${_selectedProductPrices[index]}'),
                                    SizedBox(width: 20),
                                    Card(
                                      elevation: 0,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _quantities[index]++;
                                          });
                                        },
                                        icon: Icon(Icons.add),
                                      ),
                                    ),
                                     Text('Quantity: ${_quantities[index]}'),
                                    Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(),
                                      child: IconButton(
                                        onPressed: () {
                                          if (_quantities[index] > 1) {
                                            setState(() {
                                              _quantities[index]--;
                                            });
                                          }
                                        },
                                        icon: Icon(Icons.remove),
                                      ),
                                    ),
                                    Text(
                                        'Total Price: ${_selectedProductPrices[index] * _quantities[index]}'),
                                  ],
                                ),
                                SizedBox(height: 20),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

       
