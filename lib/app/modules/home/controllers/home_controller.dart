import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HomeController extends GetxController {
  void downloadCatalog() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            children: [
              pw.Center(
                child: pw.Text(
                  "CATALOG PRODUCTS",
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Table(
                border: pw.TableBorder.all(
                  color: PdfColor.fromHex("#000000"),
                  width: 2,
                ),
                children: [
                  pw.TableRow(
                    children: [
                      // No
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(20),
                        child: pw.Text(
                          "No",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                      // Kode Barang
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(20),
                        child: pw.Text(
                          "Product Code",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                      // Nama Barang
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(20),
                        child: pw.Text(
                          "Product Name",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                      // Qty
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(20),
                        child: pw.Text(
                          "Quantity",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                      // QR Code
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(20),
                        child: pw.Text(
                          "QR Code",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // ISI DATANYA
                  ...List.generate(
                    5,
                    (index) {
                      return pw.TableRow(
                        children: [
                          // No
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(20),
                            child: pw.Text(
                              "${index + 1}",
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          // Kode Barang
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(20),
                            child: pw.Text(
                              "7164272167",
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          // Nama Barang
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(20),
                            child: pw.Text(
                              "HGAHJGHDGAH",
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          // Qty
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(20),
                            child: pw.Text(
                              "${index + 25324}",
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          // QR Code
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(20),
                            child: pw.Text(
                              "QR Code",
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    // simpan
    Uint8List bytes = await pdf.save();

    // buat file kosong di direktori
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/mydocument.pdf');

    // memasukan data bytes -> file kosong
    await file.writeAsBytes(bytes);

    // open pdf
    await OpenFile.open(file.path);
  }
}
