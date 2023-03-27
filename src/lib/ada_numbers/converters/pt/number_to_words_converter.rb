require_relative '../../utilities/integer_extensions'
require_relative '../../utilities/hash_extensions'
require_relative '../../utilities/settings'
require_relative '../../utilities/number_category'

require_relative '../../constants/pt/written_numbers'
require_relative '../../constants/pt/separators'


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

      private
      def self.convert_integer(number)
        return Message::UNSUPPORTED if number.number_of_digits > LIMIT

        select_scale
        @@number_tokens.clear
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

        @@number_tokens.clear
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

      def self.select_scale
        @@use_short_scale = Settings.scale == Settings::Parameters::SCALES[:short]
      end

      def self.resolve_number(number, flag = false)
        result = ''
        number_category = number.category

        case number_category
        when NumberCategory::UNITY
          result = unities number
        when NumberCategory::TEN
          result = tens number
        when NumberCategory::HUNDRED
          result = hundreds number
        when NumberCategory::THOUSAND
          result = thousands number
        when NumberCategory::MILLION
          result = millions number
        when NumberCategory::THOUSAND_MILLIONS
          result = thousand_millions number
        when NumberCategory::BILLION
          result = billions number
        end

        if result.empty?
          str_number = number.to_s
          bridge = number.bridge

          flag_first_digits = (number_category == NumberCategory::HUNDRED ? number != 100 : false)

          first_digits = (str_number[0...bridge] + '0'*number_category).to_i
          other_digits = (str_number[bridge..-1]).to_i

          flag_other_digits = other_digits != 100

          resolve_number first_digits, flag_first_digits
          resolve_number other_digits, flag_other_digits
        else
          @@number_tokens << result
        end

        add_separators_to_number @@number_tokens
      end

      def self.add_separators_to_number(number_tokens)
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

      def self.unities(number)
        WrittenNumber::Pt.numbers_to_words_map_unities.resolve number
      end

      def self.tens(number)
        WrittenNumber::Pt.numbers_to_words_map_tens.resolve number
      end

      def self.hundreds(number, is_cent = false)
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

      def self.thousands(number)
        evaluate_thousands_and_over number, 1e3.to_i, WrittenNumber::Pt::THOUSAND, WrittenNumber::Pt::THOUSAND
      end

      def self.millions(number)
        evaluate_thousands_and_over number, 1e6.to_i, WrittenNumber::Pt::MILLION_SINGULAR, WrittenNumber::Pt::MILLION_PLURAL
      end

      def self.thousand_millions(number)
        singular = (@@use_short_scale ? WrittenNumber::Pt::BILLION_SINGULAR : WrittenNumber::Pt::THOUSAND_MILLION)
        plural   = (@@use_short_scale ? WrittenNumber::Pt::BILLION_PLURAL : WrittenNumber::Pt::THOUSAND_MILLION)

        evaluate_thousands_and_over number, 1e9.to_i, singular, plural
      end

      def self.billions(number)
        singular = (@@use_short_scale ? WrittenNumber::Pt::TRILLION_SINGULAR : WrittenNumber::Pt::BILLION_SINGULAR)
        plural   = (@@use_short_scale ? WrittenNumber::Pt::TRILLION_PLURAL : WrittenNumber::Pt::BILLION_PLURAL)

        evaluate_thousands_and_over number, 1e12.to_i, singular, plural
      end

      def self.evaluate_thousands_and_over(number, category_identifier, singular, plural)
        return singular if number == category_identifier
        return '' if number%category_identifier != 0

        partial_number = number.to_s[0...number.bridge].to_i
        resolve_number partial_number
        return plural
      end
    end
  end
end
