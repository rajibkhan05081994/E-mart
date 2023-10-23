import 'package:e_mart/consts/consts.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? user = auth.currentUser;

//collections
const userCollections = "Users";