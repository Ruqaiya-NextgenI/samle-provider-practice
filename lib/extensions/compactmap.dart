
//use to get ride of null values
extension CompactMap<T> on Iterable<T?>{
  Iterable<T> compactMap<E> ([
    E? Function(T?)? transform
  ]) => map(
    transform ?? (e) => e,
  ).where((element) => element != null).cast();
}

/*

final testValue = [1, 2, null, 4]; //List<int?>
final testValue2 = [1, 2, 3, 4]; //List<int>
final testValue3 = [1, 2, null, 4].compactMap(); //List<int>
final testValue4 = [1, 2, null, 4].compactMap(
        (e) {
          if(e != null && e >10 ){
            return e;
          } else {
            return null;
          }
        }
); //Iterable<int>
*/
