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

      def self.resolve_number(number, flag = false)

      end


      private
      def self.select_scale
        @@use_short_scale = Settings.scale == Settings::Parameters::SCALES[:short]
      end
    end
  end
end
