import worksheet

worksheet{
-- Using a expression case statment
  fzbz(X) is case X in {
    Y where Y%5=0 and Y%3=0 is "fizzbuzz"
    Y where Y%3=0 is "fizz"
    Y where Y%5=0 is "buzz"
    _ default is "$X"
  };

  listFzbz has type (cons of integer) => cons of string
  listFzbz(nil) is nil
  listFzbz(cons(x, xs)) is cons(fzbz(x), listFzbz(xs))

-- Using function declaration with pattern matching
  fizzbuzz has type (integer) => string
  fizzbuzz(N) where N%3=0 and N%5=0 is "fizzbuzz"
  fizzbuzz(N) where N%3=0 is "fizz"
  fizzbuzz(N) where N%5=0 is "buzz"
  fizzbuzz(N) default is "$N"

  listFizzBuzz has type (cons of integer) => cons of string
  listFizzBuzz(nil) is nil
  listFizzBuzz(cons(x, xs)) is cons(fizzbuzz(x), listFizzBuzz(xs))

  testNumbers is cons of {1;2;3;4;5;6;7;8;9;10;11;12;13;14;15}
  result1 is listFzbz(testNumbers)
  result2 is listFizzBuzz(testNumbers)
  expectedResults is cons of {"1";"2";"fizz";"4";"buzz";"fizz";"7";"8";"fizz";"buzz";"11";"fizz";"13";"14";"fizzbuzz"}

  show "Results of fzbz is $(result1)"
  show "Results of Fizzbuzz is $(result2)"

  assert result1 = expectedResults
  assert result2 = expectedResults
}