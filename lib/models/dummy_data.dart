import 'package:recipe_hub/models/category.dart';
import 'package:recipe_hub/models/food.dart';


List<Category> dummyCategories = [
  // ignore: prefer_const_constructors
  Category(
    id: "id_ayam",
    title: "Ayam",
    images:
        "https://selerasa.com/wp-content/uploads/2015/12/images_daging_ayam-goreng.jpg",
  ),
  Category(
    id: "id_bebek",
    title: "Bebek",
    images:
        "https://asset.kompas.com/crops/UhV2ngrlUWo92yJyruxM7I-vSNE=/69x65:869x598/750x500/data/photo/2021/11/25/619f7dc86e939.jpg",
  ),
  Category(
    id: "id_noodle",
    title: "Noodle",
    images:
        "https://hot-thai-kitchen.com/wp-content/uploads/2021/11/chili-garlic-noodles-blog.jpg",
  ),
  Category(
    id: "id_seafood",
    title: "Sea Food",
    images:
        "https://www.alpermata.com/wp-content/uploads/2020/10/2ecb1d36-36aa-45fe-91fe-3613f9ef46c2-1024x682.jpg",
  ),
  Category(
    id: "id_fastfood",
    title: "Fast Food",
    images:
        "https://storage.googleapis.com/cdn-1.pintaria.com/wp/roti-burger-Pintaria-200806023904.jpg",
  ),
];

List<Food> dummy_food = [
  Food(
    id: DateTime.now().toString(),
    title: "Ayam Goreng",
    category: "id_ayam",
    ingredients: ["Tepung", "Garam", "Lengkuas", "Kemiri"],
    duration: 10,
    imageUrl:
        "https://akcdn.detik.net.id/community/media/visual/2021/03/17/viral-resep-ayam-goreng-ini-ditonton-lebih-dari-5-juta-kali-2.jpeg",
  ),
  Food(
    id: DateTime.now().toString(),
    title: "Ayam Bakar",
    category: "id_ayam",
    ingredients: ["Bawang merah", "Cabai", "Kecap"],
    duration: 20,
    imageUrl:
        "https://asset.kompas.com/crops/yoovaRyPxaPFOY4gfCciore2eUY=/3x0:700x465/750x500/data/photo/2020/12/30/5fec5602f116e.jpg",
  ),
  Food(
    id: DateTime.now().toString(),
    title: "Ayam Bumbu Kuning",
    category: "id_ayam",
    ingredients: ["Kunyit", "Sereh", "Santan", "Garam"],
    duration: 25,
    imageUrl:
        "https://img-global.cpcdn.com/recipes/ff54e785e21864d7/751x532cq70/ayam-bumbu-bali-ayam-nyatnyat-foto-resep-utama.jpg",
  ),
  Food(
    id: DateTime.now().toString(),
    title: "Bebek Bakar",
    category: "id_bebek",
    ingredients: [
      "Kecap",
      "Bawang Merah",
      "Garam",
    ],
    duration: 25,
    imageUrl: "https://resepkoki.co/wp-content/uploads/2015/04/bebekbakar.jpg",
  ),
  Food(
    id: DateTime.now().toString(),
    title: "Bebek Goreng",
    category: "id_bebek",
    ingredients: [
      "Gula",
      "Salam",
      "Serai",
      "Bawang Putih",
    ],
    duration: 15,
    imageUrl: "https://resepkoki.co/wp-content/uploads/2015/04/bebekbakar.jpg",
  ),
  Food(
    id: DateTime.now().toString(),
    title: "Burger",
    category: "id_fastfood",
    ingredients: [
      "Roti",
      "Daging",
      "Salada",
      "Mayones",
    ],
    duration: 10,
    imageUrl:
        "https://storage.googleapis.com/cdn-1.pintaria.com/wp/roti-burger-Pintaria-200806023904.jpg",
  ),
  Food(
    id: DateTime.now().toString(),
    title: "Pizza",
    category: "id_fastfood",
    ingredients: [
      "Roti",
      "Sosis",
      "Bawang Putih",
      "Saus",
    ],
    duration: 5,
    imageUrl:
        "https://www.simplyrecipes.com/thmb/qu-AslBeskzh_HG9H0dQAmcrdLQ=/648x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2019__09__easy-pepperoni-pizza-lead-4-82c60893fcad4ade906a8a9f59b8da9d.jpg",
  ),
  Food(
    id: DateTime.now().toString(),
    title: "Cumi Saus Tiram",
    category: "id_seafood",
    ingredients: [
      "Cumi",
      "Cabai Merah",
      "Bawang Putih",
    ],
    duration: 10,
    imageUrl:
        "https://img.okezone.com/content/2021/01/29/298/2353163/resep-cumi-saus-tiram-sajian-seafood-yang-dijamin-bikin-ketagihan-KtneudN5H3.jpg",
  ),
  Food(
    id: DateTime.now().toString(),
    title: "Udang Saus Tiram",
    category: "id_seafood",
    ingredients: [
      "Udang",
      "Cabai Merah",
      "Bawang Putih",
    ],
    duration: 15,
    imageUrl:
        "https://cdns.klimg.com/merdeka.com/i/w/news/2021/06/19/1320300/content_images/670x335/20210619131518-1-ilustrasi-udang-004-destriyana.jpg",
  ),
  Food(
    id: DateTime.now().toString(),
    title: "Mie Goreng",
    category: "id_noodle",
    ingredients: [
      "Mie",
      "Bawang Goreng",
      "Tomat",
      "Garam",
    ],
    duration: 15,
    imageUrl:
        "https://cdn0-production-images-kly.akamaized.net/Hx82bLNOOJXZVLckgMMRB4h-67s=/680x383/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3129172/original/099632200_1589527804-shutterstock_1455941861.jpg",
  ),
  Food(
    id: DateTime.now().toString(),
    title: "Mie Rebus",
    category: "id_noodle",
    ingredients: [
      "Mie",
      "Jeruk Nipis",
      "Tomat",
      "Telur",
    ],
    duration: 15,
    imageUrl:
        "https://www.omahresep.com/wp-content/uploads/2021/02/mie-rebus-warkop.jpg",
  ),
];
