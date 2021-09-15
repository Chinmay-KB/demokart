import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demokart/utils/datamodels/category_wise_product.dart';
import 'package:demokart/utils/datamodels/product.dart';
import 'package:flutter/cupertino.dart';

class FirestoreService {
  final _firestoreInstance = FirebaseFirestore.instance;

  Future<QuerySnapshot<Product>> getAllProducts() => _firestoreInstance
      .collection('products')
      .withConverter<Product>(
          fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
          toFirestore: (model, _) => model.toMap())
      .get();

  Future<DocumentReference<Product>> addProduct(Product addProd) =>
      _firestoreInstance
          .collection('products')
          .withConverter<Product>(
              fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
              toFirestore: (model, _) => model.toMap())
          .add(addProd);

  Future<DocumentSnapshot<Product>> getSingleProduct(String productId) =>
      _firestoreInstance
          .collection('products')
          .doc(productId)
          .withConverter<Product>(
              fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
              toFirestore: (model, _) => model.toMap())
          .get();

  Future<QuerySnapshot<Product>> getBestSellers() async => _firestoreInstance
      .collection('products')
      .where('list_category', arrayContainsAny: ['bestseller'])
      .withConverter<Product>(
          fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
          toFirestore: (model, _) => model.toMap())
      .get();

  Future<QuerySnapshot<Product>> getNewArrivals() async => _firestoreInstance
      .collection('products')
      .where('list_category', arrayContainsAny: ['new_arrivals'])
      .withConverter<Product>(
          fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
          toFirestore: (model, _) => model.toMap())
      .get();
}
