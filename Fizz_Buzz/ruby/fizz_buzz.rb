
# add "domain language" method
class Integer
  def divisible_by?(divisor)
    (self % divisor).zero?
  end
end

# FizzBuzz Kata implementation
class FizzBuzz
  def fizz_buzz(number)
    result = ''
    result += 'Fizz' if number.divisible_by?(3)
    result += 'Buzz' if number.divisible_by?(5)
    result = number.to_s if result.empty?
    result
  end
end
