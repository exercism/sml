local
  fun power2 (k: int): LargeInt.int =
    if k = 0 then 1
    else 2 * power2 (k - 1)
in
  fun square (n: int): string =
    if n < 1 orelse n > 64 then raise Fail "square must be between 1 and 64"
    else LargeInt.toString (power2 (n - 1))

  fun total (): string =
    LargeInt.toString ((power2 64) - 1)
end
