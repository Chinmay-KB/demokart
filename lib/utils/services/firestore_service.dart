import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demokart/utils/datamodels/carousel.dart';
import 'package:demokart/utils/datamodels/product.dart';
import 'package:demokart/utils/datamodels/user.dart';

class FirestoreService {
  final _firestoreInstance = FirebaseFirestore.instance;
  static const FIRESTORE_PRODUCT_COLLETION = 'products';
  static const FIRESTORE_USER_COLLECTION = 'users';

  static const FIRESTORE_PRODUCT_LIST_CATEGORY = 'list_category';
  static const FIRESTORE_PRODUCT_LIST_CATEGORY_BESTSELLER = 'bestseller';
  static const FIRESTORE_PRODUCT_LIST_CATEGORY_NEWARRIVAL = 'new_arrivals';
  static const FIRESTORE_PRODUCT_TAGS = 'tags';

  static const FIRESTORE_CATEGORY_WISE = 'category_wise';
  static const FIRESTORE_CAROUSEL = 'carousel_items';

  /// Fetches list of all the products available under `products ` collection.
  /// This query should ideally be paginated, but because of lack of items, it
  /// currently is not necessary.
  Future<QuerySnapshot<Product>> getAllProducts() => _firestoreInstance
      .collection(FIRESTORE_PRODUCT_COLLETION)
      .withConverter<Product>(
          fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
          toFirestore: (model, _) => model.toMap())
      .get();

  /// Function added just to populate data on the database easily for demoing
  /// purpose. Client side app should not have write operation on product
  /// collection.
  Future<DocumentReference<Product>> addProduct(Product addProd) =>
      _firestoreInstance
          .collection(FIRESTORE_PRODUCT_COLLETION)
          .withConverter<Product>(
              fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
              toFirestore: (model, _) => model.toMap())
          .add(addProd);

  /// Get all details of a specific product. Currently this uses the same
  /// [Product] datamodel to fetch, but in real case, detailed product page will
  /// contain much more info, so a different datamodel should be used.
  Future<DocumentSnapshot<Product>> getSingleProduct(String productId) =>
      _firestoreInstance
          .collection(FIRESTORE_PRODUCT_COLLETION)
          .doc(productId)
          .withConverter<Product>(
              fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
              toFirestore: (model, _) => model.toMap())
          .get();

  /// Get all the products which have `bestseller` as one of the element in
  /// `list_category` array.
  Future<QuerySnapshot<Product>> getBestSellers() async => _firestoreInstance
      .collection(FIRESTORE_PRODUCT_COLLETION)
      .where(FIRESTORE_PRODUCT_LIST_CATEGORY,
          arrayContainsAny: [FIRESTORE_PRODUCT_LIST_CATEGORY_BESTSELLER])
      .withConverter<Product>(
          fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
          toFirestore: (model, _) => model.toMap())
      .get();

  /// Get all the products which have `new_arrivals` as one of the element in
  /// `list_category` array.
  Future<QuerySnapshot<Product>> getNewArrivals() async => _firestoreInstance
      .collection(FIRESTORE_PRODUCT_COLLETION)
      .where(FIRESTORE_PRODUCT_LIST_CATEGORY,
          arrayContainsAny: [FIRESTORE_PRODUCT_LIST_CATEGORY_NEWARRIVAL])
      .withConverter<Product>(
          fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
          toFirestore: (model, _) => model.toMap())
      .get();

  /// Get all the products which have `new_arrivals` as one of the element in
  /// `list_category` array.
  Future<DocumentSnapshot<Carousel>> getCarouselData() async =>
      _firestoreInstance
          .collection(FIRESTORE_CATEGORY_WISE)
          .doc(FIRESTORE_CAROUSEL)
          .withConverter<Carousel>(
              fromFirestore: (snapshot, _) =>
                  Carousel.fromMap(snapshot.data()!),
              toFirestore: (model, _) => model.toMap())
          .get();

  /// Queries products in collection with similar tags.
  Future<QuerySnapshot<Product>> getSimilarProducts(List<String> tags) async =>
      _firestoreInstance
          .collection(FIRESTORE_PRODUCT_COLLETION)
          .where(FIRESTORE_PRODUCT_TAGS, arrayContainsAny: tags)
          .withConverter<Product>(
              fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
              toFirestore: (model, _) => model.toMap())
          .get();

  /// Check if the user exists on the database or not.
  Future<bool> checkUserExists(String uid) async {
    final _doc = await _firestoreInstance
        .collection(FIRESTORE_USER_COLLECTION)
        .doc(uid)
        .get();
    return _doc.exists;
  }

  /// Creates a new user document for a new user
  Future<void> createNewUser(
      {required String uid, required UserData userData}) async {
    await _firestoreInstance
        .collection(FIRESTORE_USER_COLLECTION)
        .withConverter<UserData>(
            fromFirestore: (snapshot, _) => UserData.fromMap(snapshot.data()!),
            toFirestore: (model, _) => model.toMap())
        .doc(uid)
        .set(userData);
  }

  Future<void> addToCart(
          {required String uid, required String productId}) async =>
      _firestoreInstance
          .collection(FIRESTORE_USER_COLLECTION)
          .withConverter<UserData>(
              fromFirestore: (snapshot, _) =>
                  UserData.fromMap(snapshot.data()!),
              toFirestore: (model, _) => model.toMap())
          .doc(uid)
          .update({
        "cart": FieldValue.arrayUnion([productId])
      });

  Future<void> removeFromCart(
          {required String uid, required String productId}) async =>
      _firestoreInstance
          .collection(FIRESTORE_USER_COLLECTION)
          .withConverter<UserData>(
              fromFirestore: (snapshot, _) =>
                  UserData.fromMap(snapshot.data()!),
              toFirestore: (model, _) => model.toMap())
          .doc(uid)
          .update({
        "cart": FieldValue.arrayRemove([uid])
      });

  Future<void> emptyCart(
          {required String uid, required String productId}) async =>
      _firestoreInstance
          .collection(FIRESTORE_USER_COLLECTION)
          .withConverter<UserData>(
              fromFirestore: (snapshot, _) =>
                  UserData.fromMap(snapshot.data()!),
              toFirestore: (model, _) => model.toMap())
          .doc(uid)
          .update({"cart": []});
}
