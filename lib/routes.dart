import './pages/Home.dart';
import './pages/Trending.dart';
import './pages/Search.dart';
import './pages/Me.dart';

final routes = {
  '/': (context) => Home(),
  '/trending': (context) => Trending(),
  '/Search': (context) => Search(),
  '/Me': (context) => Me(),
};
