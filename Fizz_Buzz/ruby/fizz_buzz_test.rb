require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/color'

require_relative __FILE__.chomp('_test.rb')

# tests for FizzBuzz Kata (TDD)
class FizzBuzzTest < Minitest::Test
  def test_it_should_return_1_as_string_given_1_as_integer
    fizz_buzz = FizzBuzz.new
    assert_equal('1', fizz_buzz.fizz_buzz(1))
  end

  # return number as string
  [1, 2, 4, 7, 8].each do |number|
    define_method("test_it_should_return_#{number}_given_number_#{number}") do
      fizz_buzz = FizzBuzz.new
      assert_equal(number.to_s, fizz_buzz.fizz_buzz(number))
    end
  end

  # return fizz when multiple of 3
  [3, 6, 9, 12].each do |number|
    define_method("test_it_should_return_fizz_given_number_#{number}") do
      fizz_buzz = FizzBuzz.new
      assert_equal('Fizz', fizz_buzz.fizz_buzz(number))
    end
  end

  # return buzz when multiple of 5
  [5, 10].each do |number|
    define_method("test_it_should_return_buzz_given_number_#{number}") do
      fizz_buzz = FizzBuzz.new
      assert_equal('Buzz', fizz_buzz.fizz_buzz(number))
    end
  end

  # return FizzBuzz when multiple of 3 and multiple of 5
  [15].each do |number|
    define_method("test_it_should_return_fizzbuzz_given_number_#{number}") do
      fizz_buzz = FizzBuzz.new
      assert_equal('FizzBuzz', fizz_buzz.fizz_buzz(number))
    end
  end
end
