import 'package:cached_network_image/cached_network_image.dart';
import 'package:candi_steven/models/candi.dart';
import 'package:flutter/material.dart';


// DetailScreen adalah widget turunan dari StatelessWidget.
// Widget ini menerima sebuah objek Candi (model data) melalui konstruktor.
// Data ini berisi informasi seperti:
// name (nama candi)
// location (lokasi)
// built (tahun dibangun)
// type (jenis)
// description (deskripsi)
// imageAsset (gambar utama)
// imageUrls (list URL untuk galeri foto)
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.candi});


  final Candi candi;
  @override
  Widget build(BuildContext context) {
//Menggunakan Scaffold sebagai kerangka dasar halaman.
// SingleChildScrollView agar halaman bisa di-scroll ketika konten panjang.
// Column digunakan untuk menumpuk elemen dari atas ke bawah.
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        children: [
// Stack digunakan agar bisa menumpuk dua widget:
// Gambar utama (Image.asset)
// Tombol kembali (IconButton) di atasnya.
// ClipRRect memberi efek sudut melengkung pada gambar.
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    candi.imageAsset,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
              )
            ],
          ),
//Row digunakan agar teks dan ikon tampil sejajar secara horizontal.
// Menggunakan SizedBox(width: 70) agar label sejajar rapi.
// Deskripsi ditampilkan di bawahnya dengan teks yang justify (rata kanan-kiri) agar mudah dibaca.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16,),
                Row(
                  children: [
                    Text(candi.name),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.place, color: Colors.red),
                      SizedBox(width: 8),
                      SizedBox(
                        width: 70,
                        child: Text(
                          'Lokasi',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(': ${candi.location}'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: Colors.blue),
                      SizedBox(width: 8),
                      SizedBox(
                        width: 70,
                        child: Text(
                          'Dibangun',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(': ${candi.built}'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.house, color: Colors.green),
                      SizedBox(width: 8),
                      SizedBox(
                        width: 70,
                        child: Text(
                          'Tipe',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(': ${candi.type}'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Divider(color: Colors.deepPurple.shade100),
                  SizedBox(height: 16),
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    candi.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                    Divider(color: Colors.deepPurple.shade100),
              ],
            ),
          ),
           Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: Colors.deepPurple.shade100),
                    Text(
                      'Galeri',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 18),
// Menampilkan galeri gambar horizontal menggunakan ListView.builder.
// Menggunakan CachedNetworkImage:
// imageUrl: URL gambar online.
// placeholder: warna lembut sementara gambar dimuat.
// errorWidget: ikon error jika gagal memuat gambar.
// GestureDetector bisa digunakan nanti untuk aksi (misalnya membuka gambar dalam tampilan penuh).
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: candi.imageUrls.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.deepPurple.shade100,
                                    width: 2,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: candi.imageUrls[index],
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      width: 120,
                                      height: 120,
                                      color: Colors.deepPurple[50],
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Tap untuk memperbesar',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
        ],
      ),
      ),
    );
  }
}
