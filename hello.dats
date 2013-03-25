typedef
fdouble = double -<cloref1> double
//
macdef epsilon = 1E-6 (* precision *)
//
// [f1] is the derivative of [f]
//
fn newton_raphson (
    f: fdouble, f1: fdouble, x0: double
  ) : double = let
  fun loop (
    f: fdouble, f1: fdouble, x0: double
  ) : double = let
    val y0 = f x0
  in
    if abs (y0 / x0) < epsilon then x0 else
      let val y1 = f1 x0 in loop (f, f1, x0 - y0 / y1) 
    end
  end
in
  loop (f, f1, x0)
end

// square root function
fn sqrt (c: double): double =
  newton_raphson (lam x => x * x - c, lam x => 2.0 * x, 1.0)
// cubic root function
fn cbrt (c: double): double =
  newton_raphson (lam x => x * x * x - c, lam x => 3.0 * x * x, 1.0)



implement
main (argc, argv) = let
  fn* outer
    {i:nat | i <= 10} (i: int i): void =
    if i <= 9 then inner (i, i) else ()

  and inner
    {i,j:nat | i <= 9; j <= 10} (i: int i, j: int j): void =
    if j <= 9 then (
      if i < j then print ", ";
      printf ("(%i, %i)", @(i, j));
      inner (i, j+1)
    ) else (
      print_newline (); outer (i+1)
    )
in
  outer (0)
end
