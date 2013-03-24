int main (int argc, char *argv[]) {
  int i, j ;
  for (i = 0; i <= 9; i += 1) {
    for (j = i; j <= 9; j += 1) {
	if (i < j) printf (", ");
	printf ("(%i, %i)", i, j);
    }
    printf ("\n") ;
  }
  return 0 ;
}
