import 'package:flutter/material.dart';

class Provider05 extends ChangeNotifier {
  bool _diSekolah = false;
  bool _diPraktik = false;
  bool _diKursus = false;

  bool get statusSekolah => _diSekolah;
  bool get statusPraktik => _diPraktik;
  bool get statusKursus => _diKursus;

  bool _tkj = false;
  bool _rpl = false;
  bool _sma = false;

  bool get kelasTkj => _tkj;
  bool get kelasRpl => _rpl;
  bool get kelasSma => _sma;

  Set<String> _pilihPeminatan = {};
  Set<String> get pilihPeminatan => _pilihPeminatan;

  set kelasTkj(val) {
    _tkj = val;
    notifyListeners();
  }

  set kelasRpl(val) {
    _rpl = val;
    notifyListeners();
  }

  set kelasSma(val) {
    _sma = val;
    notifyListeners();
  }

  set setSekolah(val) {
    _diSekolah = val;
    notifyListeners();
  }

  set setPraktik(val) {
    _diPraktik = val;
    notifyListeners();
  }

  set setKursus(val) {
    _diKursus = val;
    notifyListeners();
  }

  void togglePeminatan(String peminatan) {
    if (_pilihPeminatan.contains(peminatan)) {
      _pilihPeminatan.remove(peminatan);
    } else {
      _pilihPeminatan.add(peminatan);
    }
    notifyListeners();
  }
}
