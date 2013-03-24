implement
main (argc, argv) = let
  fn* loop1
    {i:nat | i <= 10} (i: int i): void =
    if i <= 9 then loop2 (i, i) else ()

  and loop2
    {i,j:nat | i <= 9; j <= 10} (i: int i, j: int j): void =
    if j <= 9 then (
      if i < j then (
        print ", "; printf ("(%i, %i)", @(i, j)); loop2 (i, j+1)
      )
    ) else (
      print_newline (); loop1 (i+1)
    )
in
  loop1 (0)
end
