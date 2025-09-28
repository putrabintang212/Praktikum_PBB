import 'package:flutter/material.dart';

void main() {
  runApp(const WireframeApp());
}

class WireframeApp extends StatelessWidget {
  const WireframeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
body: Center( 
  child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, 
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                  buildWireframe("login",[
                    header("Login"),
                    space(),
                    box(height: 80, width: 120, withCross: true),
                    space(),
                    inputLine("Username"),
                    inputLine("Password"),
                    space(),
                    button("Login"),
                  ]),

                  buildWireframe("Panel", [
                    header("ComShop Panel"),
                    space(),
                    button("Tambah Produk"),
                    button("Perbarui Produk"),
                    button("Hapus Produk"),
                    button("Lihat Produk"),
                    space(),
                    button("Logout"),
                  ]),
                  buildWireframe("Tambah Produk", [
                    header("Tambah Produk"),
                    space(),
                    box(height: 80, width: 120, withCross: true),
                    button("Upload Foto"),
                    space(),
                    inputLine("Nama Produk"),
                    inputLine("Stok Produk"),
                    inputLine("Harga Produk"),
                    space(),
                    button("Simpan"),
                  ]),
                ],
              ),

               Row(
                mainAxisAlignment: MainAxisAlignment.center, 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildWireframe("Perbarui Produk", [
                    header("Perbarui Produk"),
                    space(),
                    box(height: 80, width: 120, withCross: true),
                    button("Upload Foto Baru"),
                    space(),
                    inputLine("Nama Produk"),
                    inputLine("Stok Produk"),
                    inputLine("Harga Produk"),
                    space(),
                    button("Update"),
                  ]),
                  buildWireframe("Hapus Produk", [
                    header("Hapus Produk"),
                    space(),
                    box(height: 80, width: 120, withCross: true),
                    space(),
                    Container(
                      height: 120,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CustomPaint(painter: CrossPainter()),
                    ),
                    space(),
                    button("Hapus"),
                  ]),
                  buildWireframe("Lihat Produk", [
                    header("Lihat Produk"),
                    space(),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(
                        15,
                        (i) => box(height: 50, width: 50, withCross: true),
                        ),
                      ),
                    ]),
                  ],
                ),
              ],
            )
          ),
        ),
      ),
    );
  }

static Widget buildWireframe(String title, List<Widget> children) {
  return Column(
    children: [
      Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(10),
        width: 230,   
        height: 390,  
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: SingleChildScrollView( 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    ],
  );
}

  static Widget header(String text) => Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      );

static Widget box(
    {double height = 60, double width = 120, bool withCross = false}) {
  return Container(
    height: height,
    width: width,
    margin: const EdgeInsets.symmetric(vertical: 4),
    decoration: BoxDecoration(
      color: Colors.grey[400],
      borderRadius: BorderRadius.circular(8),
    ),
    child: withCross ? CustomPaint(painter: CrossPainter()) : null,
  );
}

static Widget inputLine(String label) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
        const SizedBox(height: 3),
        Container(
          height: 20,   
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        const SizedBox(height: 6),
      ],
    );


static Widget button(String text) => Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      width: 120,   
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[600],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
    );

  static Widget space() => const SizedBox(height: 12);
}

class CrossPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
