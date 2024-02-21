import 'package:flutter/material.dart';

class Product {
  final String title, image, description;
  final int id, price, size;
  final Color color;
  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.size,
    required this.color,
  });
}

List<Product> hotDeals= [
  Product(
    id: 1,
    title: "Bag 1",
    image: "assets/images/blue_handbag.png",
    description: "First bag",
    price: 100,
    size: 10,
    color: Colors.blue,
  ),
];

List<Product> newArrivals = [
  Product(
    id: 1,
    title: "Bag 1",
    image: "assets/images/blue_handbag.png",
    description: "First bag",
    price: 100,
    size: 10,
    color: Colors.blue,
  ),
];

List<Product> handbags = [
  Product(
    id: 1,
    title: "Bag 1",
    image: "assets/images/blue_handbag.png",
    description: "First bag",
    price: 100,
    size: 10,
    color: Colors.blue,
  ),
];

List<Product> backpacks = [
  Product(
    id: 1,
    title: "Backpack 1",
    image: "assets/images/green_backpack.png",
    description: "First backpack",
    price: 200,
    size: 10,
    color: Colors.green,
  ),
];

List<Product> pc = [
  Product(
    id: 1,
    title: "PC 1",
    image: "assets/images/red_pc.png",
    description: "First PC",
    price: 3000,
    size: 10,
    color: Colors.red,
  ),
];

List<Product> mobile = [
  Product(
    id: 1,
    title: "Phone 1",
    image: "assets/images/yellow_phone.png",
    description: "First phone",
    price: 1500,
    size: 10,
    color: Colors.amber,
  ),
];

List<Product> accessories = [
  Product(
    id: 1,
    title: "Watch 1",
    image: "assets/images/orange_watch.png",
    description: "First accessory",
    price: 900,
    size: 10,
    color: Colors.orange,
  ),
];
