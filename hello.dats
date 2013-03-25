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
fn mysqrt (c: double): double =
  newton_raphson (lam x => x * x - c, lam x => 2.0 * x, 1.0)
// cubic root function
fn cbrt (c: double): double =
  newton_raphson (lam x => x * x * x - c, lam x => 3.0 * x * x, 1.0)


typedef
thunk = () -<cloref1> ()

fun loop (th: thunk) = (
    th ();
    loop (thunk);
)


implement
main (argc, argv) = let
    val x = 103.1;
in
    loop (lam => (
	printf ("sqrt(%f)= %f", @(x,mysqrt(x)));
	print_newline ();
    ));
end
