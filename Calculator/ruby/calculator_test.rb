require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/color'

require_relative __FILE__.chomp('_test.rb')

# tests for Calculator
class CalculatorTest < Minitest::Test
  def test_it_returns_0_given_empty_string
    result = Calculator.add('')
    assert_equal(0, result)
  end

  def test_it_returns_1_given_1_as_string
    result = Calculator.add('1')
    assert_equal(1, result)
  end

  def test_it_returns_2_given_2_as_string
    result = Calculator.add('2')
    assert_equal(2, result)
  end

  def test_it_returns_7_given_3_4_as_string
    result = Calculator.add('3,4')
    assert_equal(7, result)
  end

  def test_it_returns_11_given_5_6_as_string
    result = Calculator.add('5,6')
    assert_equal(11, result)
  end

  def test_it_returns_24_given_7_8_9_as_string
    result = Calculator.add('7,8,9')
    assert_equal(24, result)
  end

  def test_it_returns_sum_given_many_numbers_as_string
    result = Calculator.add('10,11,12,13,14')
    assert_equal(60, result)
  end

  def test_it_returns_41_given_20_21_separated_by_newline
    result = Calculator.add("20\n21")
    assert_equal(41, result)
  end

  def test_it_returns_45_given_22_23_separated_by_newline
    result = Calculator.add("22\n23")
    assert_equal(45, result)
  end

  def test_it_returns_75_given_24_25_26_separated_by_newline
    result = Calculator.add("24\n25\n26")
    assert_equal(75, result)
  end

  def test_it_returns_96_given_31_32_33_with_multiple_separator
    result = Calculator.add("31,32\n33")
    assert_equal(96, result)
  end

  def test_it_returns_40_given_40_with_new_delimiter
    result = Calculator.add("//;\n40")
    assert_equal(40, result)
  end

  def test_it_returns_83_given_41_42_with_new_delimiter
    result = Calculator.add("//;\n41;42")
    assert_equal(83, result)
  end

  def test_it_returns_156_given_51_52_53_with_new_delimiter
    result = Calculator.add("//;\n51;52;53")
    assert_equal(156, result)
  end

  def test_it_returns_156_given_51_52_53_with_new_delimiter_and_newline
    result = Calculator.add("//;\n61;62\n63")
    assert_equal(186, result)
  end
end
