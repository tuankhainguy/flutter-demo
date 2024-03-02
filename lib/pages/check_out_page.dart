import 'package:flutter/material.dart';
import 'package:demo/constants.dart';
import 'package:demo/models/product.dart';


void checkOut(BuildContext context) {
  checkout.isNotEmpty ? showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: kBaseColor,
    useSafeArea: true,
    context: context,
    builder: (ctx) => const CheckOutPage(),
  ) : null;
}

class CheckOutPage extends StatefulWidget{
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {

  @override
  Widget build(BuildContext context) {

    int subTotal = 0;
    cart.forEach((key, value) => subTotal += key.price * value);

    return Scaffold(
      backgroundColor: kBaseColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Checkout",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: kTextLight,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                checkout.clear();
                Navigator.pop(context);
              });
            },
            icon: const Icon(
              Icons.close_rounded,
              color: kTextOverlay,
            ),
          ),
          const SizedBox(width: kDefaultPadding / 2),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: checkout.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  color: kCardColor,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                    leading: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        checkout.keys.elementAt(index).image,
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    title: Text(
                      checkout.keys.elementAt(index).title,
                      style: const TextStyle(
                        color: kTextDark,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Amount: ${checkout.values.elementAt(index).toString()}",
                          style: const TextStyle(
                            color: kTextOverlay,
                          ),
                        ),
                        Text(
                          "Price: ${
                            checkout.keys.elementAt(index).price
                            * checkout.values.elementAt(index)
                          }",
                          style: const TextStyle(
                            color: kTextOverlay,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 85,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding / 4,
          horizontal: kDefaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              "\$$subTotal",
              style: const TextStyle(
                color: kTextLight,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: kDefaultPadding / 4),
            SizedBox(
              width: double.infinity,
                child: FilledButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return kCheckOutColor.withOpacity(1.0);
                    },
                  ),
                ),
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                    color: kTextDark,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      //     ],
      //   ),
      // ),
    );
  }
}
