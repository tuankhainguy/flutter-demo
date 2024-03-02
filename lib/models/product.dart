import 'package:flutter/material.dart';

class Product {
  final String title, image, description;
  final int id, price, size;
  final List<Color> color;
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
  handbags[0],
];

List<Product> newArrivals = [
  handbags[0],
];

List<Product> handbags = [
  Product(
    id: 1,
    title: "Blue handbag",
    image: "assets/images/blue_handbag.png",
    description: "Blue handbag",
    price: 100,
    size: 10,
    color: [Colors.blue, Colors.red],
  ),
  Product(
    id: 2,
    title: "Green handbag",
    image: "assets/images/green_handbag.png",
    description: "Green handbag",
    price: 90,
    size: 10,
    color: [Colors.green],
  ),
  Product(
    id: 3,
    title: "Yellow handbag",
    image: "assets/images/yellow_handbag.png",
    description: "Yellow handbag",
    price: 120,
    size: 10,
    color: [Colors.yellow],
  ),
  Product(
    id: 4,
    title: "Red handbag",
    image: "assets/images/red_handbag.png",
    description: "Red handbag",
    price: 200,
    size: 10,
    color: [Colors.red],
  ),
  Product(
    id: 5,
    title: "Black handbag",
    image: "assets/images/black_handbag.png",
    description: "First bag",
    price: 300,
    size: 10,
    color: [Colors.black],
  ),
  Product(
    id: 6,
    title: "Brown handbag",
    image: "assets/images/brown_handbag.png",
    description: "Brown handbag",
    price: 210,
    size: 10,
    color: [Colors.brown],
  ),
];

List<Product> backpacks = [
  Product(
    id: 7,
    title: "Backpack 1",
    image: "assets/images/green_backpack.png",
    description: "First backpack",
    price: 200,
    size: 10,
    color: [Colors.green],
  ),
];

List<Product> pc = [
  Product(
    id: 8,
    title: "PC 1",
    image: "assets/images/red_pc.png",
    description: "First PC",
    price: 3000,
    size: 10,
    color: [Colors.red],
  ),
];

List<Product> mobile = [
  Product(
    id: 9,
    title: "Phone 1",
    image: "assets/images/yellow_phone.png",
    description: "First phone",
    price: 1500,
    size: 10,
    color: [Colors.amber],
  ),
];

List<Product> accessories = [
  Product(
    id: 10,
    title: "Watch 1",
    image: "assets/images/orange_watch.png",
    description: "First accessory",
    price: 900,
    size: 10,
    color: [Colors.orange],
  ),
];

List<Product> search = [
  ...handbags,
  ...backpacks,
  ...pc,
  ...mobile,
  ...accessories,
];

List<Product> favourites = [];
Map<Product, int> cart = {};
Map<Product, int> checkout = {};
