# responsible for adding numbers
# #add : add numbers
class Calculator
  class << self
    COMMA = ','.freeze
    NEWLINE = "\n".freeze
    SEPARATORS = /[#{COMMA}#{NEWLINE}]/

    def add(numbers)
      return _add_separated_by_custom(numbers) if numbers.start_with? '//'
      _add_separated_by(numbers, SEPARATORS)
    end

    private

    def _add_multiple(numbers)
      numbers.inject(0) do |acc, number|
        acc + _add_single(number)
      end
    end

    def _add_single(number)
      number.to_i
    end

    def _add_separated_by(numbers, separators)
      _add_multiple(numbers.split(separators))
    end

    def _add_separated_by_custom(numbers)
      separator, numbers_part = numbers.match(%r{\A//(.)\n(.*)\z}m)[1, 2]
      _add_separated_by(numbers_part, /[#{NEWLINE}#{separator}]/)
    end
  end
end
