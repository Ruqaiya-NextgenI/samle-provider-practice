extension Normalize on num{
  num normalized(
      num selfRangeMin,
      num selfRangeMax, [
        num normalizedRangeMin = 0.0,
        num normalizedRangeMax = 1.0,
      ]) =>
      (normalizedRangeMax - normalizedRangeMin) *
          ((this - selfRangeMin) / (selfRangeMax - selfRangeMin)) +
      normalizedRangeMin;

}