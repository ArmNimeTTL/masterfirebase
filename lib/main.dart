import 'package:flutter/material.dart';
import './screens/authen.dart';

// void type ฟังก์ชั่นไม่มี return กลับ
// return type ฟังก์ชั่นมี return กลับ
void main() {
  // ฟังก์ชันหลักของ dart
  runApp(MyApp());
}

// stateless หน้าจอที่แก้ไขไม่ได้
// stateful หน้าจอที่แก้ไขได้
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Master Firebase',
      home: Authen(),
    );
  }
}
