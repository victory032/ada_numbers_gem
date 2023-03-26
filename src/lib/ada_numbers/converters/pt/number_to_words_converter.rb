require_relative '../../utilities/integer_extensions'
require_relative '../../utilities/hash_extensions'

module AdaNumbers
  module NumberToWordsConverter
    class Pt
      LIMIT = 15

      @@use_short_scale = false
      @@number_tokens   = []

      def self.convert(number)
        return convert_integer(number) if number.class == Integer
        return convert_float(number)
      end

      def self.convert_integer(number)
        return Message::UNSUPPORTED if number.number_of_digits > LIMIT

        select_scale
        @@number_tokens = []
        return resolve_number number
      end

      def self.convert_float(number)
        select_scale

        str_number = number.to_s.split '.'

        str_integer_part = str_number.first
        str_decimal_part = str_number.size == 1? "0" : str_number.last

        return Message::UNSUPPORTED if str_integer_part.size > LIMIT || str_decimal_part.size > LIMIT

        whole_part   = str_integer_part.to_i
        decimal_part = str_decimal_part.to_i

        @@number_tokens = []
        result = resolve_number whole_part

        return result if decimal_part == 0

        result += " #{Separator::Pt::DECIMAL_SEPARATOR.downcase} "
        # just aggregating the zeros
        result += str_decimal_part.split('').
          select  { |c| c == "0"}.
          collect { |c| WrittenNumber::Pt::ZERO}.
          join ' '

        @@number_tokens.clear
        result += " #{resolve_number(decimal_part)}"

        return result
      end

      private
      def self.select_scale
        @@use_short_scale = Settings.scale == Settings::Parameters::SCALES[:short]
      end

      def self.resolve_number(number, flag = false)
      end

      def add_separators_to_number(number_tokens)
        result = number_tokens.first

        (1...number_tokens.size).each do |cursor|
          current_token = number_tokens[cursor]

          if WrittenNumber::Pt.numbers_that_ignore_separator.include? current_token
            result += " #{current_token}"
          else
            result += " #{Separator::Pt::NUMBERS_SEPARATOR.downcase} #{current_token}"
          end
        end

        return result
      end

      def unities(number)
        WrittenNumber::Pt.numbers_to_words_map_unities.resolve number
      end

      def tens(number)
        WrittenNumber::Pt.numbers_to_words_map_tens.resolve number
      end

      def hundreds(number, is_cent = false)
        results = {
          200 => WrittenNumber::Pt::TWO_HUNDRED,
          300 => WrittenNumber::Pt::THREE_HUNDRED,
          400 => WrittenNumber::Pt::FOUR_HUNDRED,
          500 => WrittenNumber::Pt::FIVE_HUNDRED,
          600 => WrittenNumber::Pt::SIX_HUNDRED,
          700 => WrittenNumber::Pt::SEVEN_HUNDRED,
          800 => WrittenNumber::Pt::EIGHT_HUNDRED,
          900 => WrittenNumber::Pt::NINE_HUNDRED,
          100 => (is_cent ? WrittenNumber::Pt::ONE_HUNDRED : WrittenNumber::Pt::ONE_HUNDRED_SINGLE)
        }

        return results.resolve number
      end

      def evaluate_thousands_and_over(number, category_identifier, singular, plural)
        return singular if number == category_identifier
        return '' if number%category_identifier != 0

        partial_number = number.to_s[0...number.bridge].to_i
        resolve_number partial_number
        return plural
      end

    end
  end
end
