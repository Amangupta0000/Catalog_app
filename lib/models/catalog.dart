
class CatalogModel{
 static List<Item> items = [
    Item(
      id: 1,
      title: "iPhone 9",
      dec: "An apple mobile which is nothing like apple",
      price: 549,
      image : "https://i.dummyjson.com/data/products/1/thumbnail.jpg",

    )

  ] ;

 Item getById(int id){
     return items.firstWhere((element) => element.id== id , orElse: null) ;
 }

}

class Item {
   final int id ;
   final String title ;
  final String dec ;
  final num price ;
  final String image ;
 Item( { required this.image ,required this.dec , required this.id ,required this.price ,required this.title});
 factory Item.fromMap(Map<String , dynamic> map){
   return Item(
     id : map["id"],
     title : map["title"],
     dec : map["description"],
     price : map["price"],
     image : map["thumbnail"],
   );
   }
   toMap() => {
   "id" : id,
  "title" : title ,
     "description" : dec,
     "price" : price ,
     "thumbnail" : image  ,
   };
}


