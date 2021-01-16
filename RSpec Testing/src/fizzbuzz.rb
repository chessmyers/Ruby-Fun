class FizzBuzz
  def output(num)
    if num % 3 == 0 && num % 5 == 0
      "fizzbuzz"
    elsif num % 3 == 0
      "fizz"
    elsif num % 5 == 0
      "buzz"
    else
      ""
    end
  end
end
