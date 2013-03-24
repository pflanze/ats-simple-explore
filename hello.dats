implement
main (argc, argv) = let
  fn* loop1
    {i:nat | i <= 10} (i: int i): void =
    if i <= 9 then loop2 (i, i) else ()
  // end of [loop1]

  and loop2
    {i,j:nat | i <= 9; j <= 10} (i: int i, j: int j): void =
    if j <= 9 then (
      if i < j then (
        print ", "; printf ("(%i, %i)", @(i, j)); loop2 (i, j+1)
      ) // end of [if]
    ) else (
      print_newline (); loop1 (i+1)
    ) // end of [if]
  // end of [loop2]
in
  loop1 (0)
end // end of [main]
