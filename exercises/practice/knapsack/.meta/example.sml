fun itemMaxValue(i: {value: int, weight: int}, prevValues, cap) =
  let 
    val valueWithout = List.nth(prevValues, cap) 
  in
    if (#weight i > cap) then
      valueWithout
    else
      let 
        val valueWith = List.nth(prevValues, cap - #weight i) + #value i 
      in
        Int.max(valueWith, valueWithout)
      end
  end;

fun nextValues(i: {value: int, weight: int}, prevValues, cap, acc) : int list = 
  if cap < 0 then 
    acc
  else
    let
      val itemValue = itemMaxValue(i, prevValues, cap)
    in
      nextValues(i, prevValues, cap - 1, itemValue::acc)
    end;

fun calculateValues([], values) = values
  | calculateValues((i :: next), values) = 
      let
        val valuesForNext = nextValues(i, values, (List.length values) - 1, [])
      in
        calculateValues(next, valuesForNext)
      end;

fun maximumValue([], _) = 0 
  | maximumValue(items, maximumWeight): int =
      let 
        val size : int = maximumWeight + 1 
        val initial : int list = List.tabulate(size, fn _ => 0)
      in
        List.last(calculateValues(items, initial))
      end;