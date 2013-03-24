implement
main (argc, argv) = let
  fn* outer
    {i:nat | i <= 10} (i: int i): void =
    if i <= 9 then inner (i, i) else ()

  and inner
    {i,j:nat | i <= 9; j <= 10} (i: int i, j: int j): void =
    if j <= 9 then (
      if i < j then (
        print ", "; printf ("(%i, %i)", @(i, j)); inner (i, j+1)
      )
    ) else (
      print_newline (); outer (i+1)
    )
in
  outer (0)
end
